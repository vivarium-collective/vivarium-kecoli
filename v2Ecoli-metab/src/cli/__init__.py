
from .dispatch import make_parser


def main():
  args = make_parser().parse_args()
  args.func(args)
