import argparse

parser = argparse.ArgumentParser(description="Generate path to config file given input")
parser.add_argument('vars', nargs='+')

args = parser.parse_args()

result = '-'.join(args.vars)
print(result)
