use clap::Parser;
use sankey::{Sankey, SankeyNodeID, SankeyStyle};
use serde::{Deserialize, Serialize};
use std::{collections::HashMap, fs::File, io::BufReader, path::PathBuf};

/// Simple program to convert a processed json file into a sankey diagram
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    /// location of processed json file
    #[arg(short, long)]
    input: PathBuf,
*
    /// Output path generated sankey diagram
    #[arg(short, long)]
    output: PathBuf,

    /// Draw Options
    #[arg(short, long)]
    draw: DrawOptions,
}

#[derive(Clone, Debug, clap::ValueEnum, PartialEq, Eq)]
enum DrawOptions {
    Analysis,
    Transformation,
    Missed,
    Passed,
    All,
}

type ReportMap = HashMap<String, HashMap<String, usize>>;

#[derive(Debug, Default, Clone, Serialize, Deserialize)]
struct ReportInfo {
    passed: ReportMap,
    missed: ReportMap,
    anaylsis: ReportMap,
}

const LIGHT_RED_NODE: &str = "#F66F";
const LIGHT_RED_EDGE: &str = "#F665";

const LIGHT_GREEN_NODE: &str = "#6B7F";
const LIGHT_GREEN_EDGE: &str = "#6B75";

const LIGHT_BLUE_NODE: &str = "#27BF";
const LIGHT_BLUE_EDGE: &str = "#27B5";

fn main() {
    let args = Args::parse();
    let file = File::open(args.input).unwrap();
    let reader = BufReader::new(file);
    let mut report_info: ReportInfo = serde_json::from_reader(reader).unwrap();

    let mut sankey = Sankey::new();

    let mut analysis_total = 0;
    if args.draw == DrawOptions::Analysis || args.draw == DrawOptions::All {
        analysis_total = reduce_report_map(&report_info.anaylsis);
    }

    let mut passed_total = 0;
    if args.draw != DrawOptions::Analysis && args.draw != DrawOptions::Missed {
        passed_total = reduce_report_map(&report_info.passed);
    }

    let mut missed_total = 0;
    if args.draw != DrawOptions::Analysis && args.draw != DrawOptions::Passed {
        missed_total = reduce_report_map(&report_info.missed);
    }

    let transform_total = passed_total + missed_total;

    // Root Passes Node
    let passes_node = sankey.node(
        Some(transform_total as f64 + analysis_total as f64),
        Some("Passes".to_string()),
        Some(LIGHT_RED_NODE.to_string()),
    );

    // Analysis Processing
    if args.draw == DrawOptions::Analysis || args.draw == DrawOptions::All {
        let analysis_node = sankey.node(
            Some(analysis_total as f64),
            Some("analysis".to_string()),
            Some(LIGHT_GREEN_NODE.to_string()),
        );

        sankey.edge(
            passes_node,
            analysis_node,
            sankey.required_input(analysis_node),
            None,
            Some(LIGHT_GREEN_EDGE.to_string()),
        );

        generate_sankey_output_report_map(
            &mut sankey,
            &mut report_info.anaylsis,
            analysis_node,
            LIGHT_GREEN_NODE,
            LIGHT_GREEN_EDGE,
        );
    }

    // Transformation Processing
    if args.draw != DrawOptions::Analysis {
        let transform_node = sankey.node(
            Some(transform_total as f64),
            Some("transform".to_string()),
            Some(LIGHT_RED_NODE.to_string()),
        );

        sankey.edge(
            passes_node,
            transform_node,
            sankey.required_input(transform_node),
            None,
            Some(LIGHT_RED_EDGE.to_string()),
        );

        // Passed Processing
        if args.draw != DrawOptions::Missed {
            let passed_node = sankey.node(
                Some(reduce_report_map(&report_info.passed) as f64),
                Some("passed".to_string()),
                Some(LIGHT_BLUE_NODE.to_string()),
            );

            sankey.edge(
                transform_node,
                passed_node,
                sankey.required_input(passed_node),
                None,
                Some(LIGHT_BLUE_EDGE.to_string()),
            );

            generate_sankey_output_report_map(
                &mut sankey,
                &mut report_info.passed,
                passed_node,
                LIGHT_BLUE_NODE,
                LIGHT_BLUE_EDGE,
            );
        }

        // Missed Processing
        if args.draw != DrawOptions::Passed {
            let missed_node = sankey.node(
                Some(reduce_report_map(&report_info.missed) as f64),
                Some("missed".to_string()),
                Some(LIGHT_RED_NODE.to_string()),
            );

            sankey.edge(
                transform_node,
                missed_node,
                sankey.required_input(missed_node),
                None,
                Some(LIGHT_RED_EDGE.to_string()),
            );

            generate_sankey_output_report_map(
                &mut sankey,
                &mut report_info.missed,
                missed_node,
                LIGHT_RED_NODE,
                LIGHT_RED_EDGE,
            );
        }
    }

    // Draw Graph
    let style = SankeyStyle {
        number_format: Some(|x| format!("{x}")),
        node_separation: Some(45.0f64),
        node_width: Some(10.0f64),
        font_size: Some(20.0f64),
        ..SankeyStyle::default()
    };

    let svg = sankey.draw(4096.0, 4096.0, style);
    svg::save(args.output, &svg).unwrap();
}

fn reduce_report_map(report_map: &ReportMap) -> usize {
    report_map.iter().fold(0, |total, (_pass_name, pass_map)| {
        total
            + pass_map
                .iter()
                .fold(0, |total, (_reason, count)| return total + count)
    })
}

fn reduce_pass_map(report_map: &HashMap<String, usize>) -> usize {
    report_map
        .iter()
        .fold(0, |total, (_reason, count)| return total + count)
}

fn generate_sankey_output_report_map(
    sankey: &mut Sankey,
    map: &mut ReportMap,
    input_node: SankeyNodeID,
    node_color: &str,
    edge_color: &str,
) {
    let mut node_ids = vec![];

    let mut passes_list: Vec<String> = map.keys().cloned().collect::<Vec<String>>();
    passes_list.sort();

    for pass in passes_list {
        let cur_node = sankey.node(
            Some(reduce_pass_map(&map.get(&pass).unwrap()) as f64),
            Some(pass.to_string()),
            Some(node_color.to_string()),
        );

        node_ids.push(cur_node);

        sankey.edge(
            input_node,
            cur_node,
            sankey.required_input(cur_node),
            None,
            Some(edge_color.to_string()),
        );

        generate_sankey_output_pass_map(
            sankey,
            map.get(&pass).unwrap(),
            cur_node,
            node_color,
            edge_color,
        );
    }
}

fn generate_sankey_output_pass_map(
    sankey: &mut Sankey,
    map: &HashMap<String, usize>,
    input_node: SankeyNodeID,
    node_color: &str,
    edge_color: &str,
) {
    let mut node_ids = vec![];

    let mut reasons_list: Vec<&String> = map.keys().collect::<Vec<&String>>();
    reasons_list.sort();

    for reason in reasons_list {
        let cur_node = sankey.node(
            Some(*map.get(reason).unwrap() as f64),
            Some(reason.to_string()),
            Some(node_color.to_string()),
        );

        node_ids.push(cur_node);

        sankey.edge(
            input_node,
            cur_node,
            sankey.required_input(cur_node),
            None,
            Some(edge_color.to_string()),
        );
    }
}
