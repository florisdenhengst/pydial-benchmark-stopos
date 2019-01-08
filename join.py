import argparse

parser = argparse.ArgumentParser(description="Generate path to config file given input")
parser.add_argument('vars', nargs='+')

args = parser.parse_args()

# The last item of vars contains the random seed
result = '-'.join(args.vars[:-1])
print(result)
