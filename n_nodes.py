import argparse

parser = argparse.ArgumentParser(description="Determine the number of nodes")
parser.add_argument('vars', type=int, nargs='+')

args = parser.parse_args()

print(args.vars[0] / args.vars[1] + 1)
