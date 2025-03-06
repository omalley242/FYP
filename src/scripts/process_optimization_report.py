import sys
from ruamel.yaml import YAML

yaml = YAML()
count = 0
with open(sys.argv[1], 'r') as file:
    data = file.read()
    reports = yaml.load_all(data)
    for report in reports:
        if report['Name'] == "FYP":
            if count < int(report["Args"][1]['String'][-1]):
                count = int(report["Args"][1]['String'][-1])


print(count)