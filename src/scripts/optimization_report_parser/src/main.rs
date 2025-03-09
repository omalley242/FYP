use clap::Parser;
use glob::glob;
use rayon::iter::{IntoParallelIterator, ParallelBridge, ParallelIterator};
use serde::{Deserialize, Serialize};
use serde_yaml::Value;
use std::{
    collections::HashMap,
    fs::File,
    io::{BufReader, Write},
    ops::AddAssign,
    path::PathBuf,
    sync::{Arc, Mutex},
};

/// Simple program to parse large amount of llvm optimization reports
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    /// Root location of optimization reports
    #[arg(short, long)]
    input: PathBuf,

    /// Output path for reduced form
    #[arg(short, long)]
    output: PathBuf,
}

fn main() {
    let args = Args::parse();

    //Generate matching tool
    let path = args.input.join("**/*.opt.yaml");
    let global_map = Arc::new(Mutex::new(ReportInfo::default()));

    //Process each file in parallel using rayon
    glob(path.to_str().unwrap())
        .expect("Failed to read glob pattern")
        .par_bridge()
        .into_par_iter()
        .for_each(|file| {
            let mut local_map = ReportInfo::default();

            let fs = File::open(file.unwrap()).unwrap();
            let reader = BufReader::new(fs);

            //Deserialize the yaml documents using serde
            serde_yaml::Deserializer::from_reader(reader).for_each(|doc| {
                let yaml_value = serde_yaml::Value::deserialize(doc).unwrap();
                if let Some(result) = process_yaml(yaml_value) {
                    increment_report_info(&mut local_map, result);
                }
            });

            let arc_result = global_map.clone();
            let mut locked_map = arc_result.lock().unwrap();

            local_map.passed.iter().for_each(|(pass_name, pass_map)| {
                pass_map.iter().for_each(|(key, value)| {
                    update_pass_map(&mut locked_map.passed, pass_name, (key, value));
                });
            });

            local_map.missed.iter().for_each(|(pass_name, pass_map)| {
                pass_map.iter().for_each(|(key, value)| {
                    update_pass_map(&mut locked_map.missed, pass_name, (key, value));
                });
            });

            local_map.anaylsis.iter().for_each(|(pass_name, pass_map)| {
                pass_map.iter().for_each(|(key, value)| {
                    update_pass_map(&mut locked_map.anaylsis, pass_name, (key, value));
                });
            });
        });

    let locked_map = global_map.clone().lock().unwrap().clone();
    let mut os = File::create(args.output).expect("Unable to create file");

    os.write_all(
        serde_json::to_string_pretty(&locked_map)
            .unwrap()
            .as_bytes(),
    )
    .unwrap();
}

type ReportMap = HashMap<String, HashMap<String, usize>>;

#[derive(Debug, Default, Clone, Serialize, Deserialize)]
struct ReportInfo {
    passed: ReportMap,
    missed: ReportMap,
    anaylsis: ReportMap,
}

#[derive(Debug)]
enum TagType<T> {
    Passed(T),
    Missed(T),
    Analysis(T),
}

fn process_yaml(yaml_value: Value) -> Option<TagType<(String, String)>> {
    match yaml_value {
        Value::Tagged(internal) => match internal.tag.to_string().as_str() {
            "!Missed" => Some(TagType::Missed((
                internal.value["Pass"].as_str().unwrap().into(),
                internal.value["Name"].as_str().unwrap().into(),
            ))),
            "!Passed" => Some(TagType::Passed((
                internal.value["Pass"].as_str().unwrap().into(),
                internal.value["Name"].as_str().unwrap().into(),
            ))),
            "!Analysis" => Some(TagType::Analysis((
                internal.value["Pass"].as_str().unwrap().into(),
                internal.value["Name"].as_str().unwrap().into(),
            ))),
            _ => None,
        },

        _ => None,
    }
}

fn update_type_count(type_map: &mut HashMap<String, usize>, key: &String, value: &usize) {
    if let Some(count) = type_map.get_mut(key) {
        count.add_assign(value);
    } else {
        type_map.insert(key.clone(), value.clone());
    }
}

fn update_pass_map(
    pass_map: &mut HashMap<String, HashMap<String, usize>>,
    pass_name: &String,
    value: (&String, &usize),
) {
    if let Some(type_map) = pass_map.get_mut(pass_name) {
        update_type_count(type_map, &value.0, &value.1);
    } else {
        pass_map.insert(pass_name.clone(), HashMap::new());
        update_pass_map(pass_map, pass_name, value);
    }
}

fn increment_report_info(report_info: &mut ReportInfo, opt_tag: TagType<(String, String)>) {
    match opt_tag {
        TagType::Passed((pass_name, reason)) => {
            update_pass_map(&mut report_info.passed, &pass_name, (&reason, &1));
        }
        TagType::Missed((pass_name, reason)) => {
            update_pass_map(&mut report_info.missed, &pass_name, (&reason, &1));
        }
        TagType::Analysis((pass_name, reason)) => {
            update_pass_map(&mut report_info.anaylsis, &pass_name, (&reason, &1));
        }
    };
}
