
from .dispatch import make_parser, find_model


def main(argv=None):
  args = make_parser().parse_args(argv)
  return args.func(args)
