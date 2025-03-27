
from argparse import ArgumentParser, Namespace
import importlib.resources
from pathlib import Path

from . import test
from . import validate


# config
# ==============================================================================

def find_model(name: str) -> Path:
  if name != "k-ecoli74.xml":
    raise NotImplementedError(f"unknown model: {name}")
  return importlib.resources.files("v2Ecoli.metab.model") / name


# dispatch
# ==============================================================================

def dispatch(args: Namespace):
  globals()[f"{args.cmd}"].main(find_model(args.model), args)


def make_parser() -> ArgumentParser:
  # top-level
  parser = ArgumentParser(
    prog="v2em", description="""
      Experimental metabolism module for the `v2Ecoli` whole cell model.""")
  parser.add_argument(
    "-j", "--jobs", type=int, default=1, metavar="N",
    help="number of processes (default: 1)")
  subparsers = parser.add_subparsers(
    metavar="CMD", dest="cmd", title="commands by category", required=True)

  # commands
  p_test = subparsers.add_parser(
    "test",
    help="run an example Vivarium process for COPASI simulation")
  p_validate = subparsers.add_parser(
    "validate",
    help="compare Vivarium vs. COPASI simulations under varying ICs")

  # command arguments
  for p_cmd in [p_test, p_validate]:
    p_cmd.set_defaults(func=dispatch)
    p_cmd.add_argument(
      "model", type=str, nargs="?", default="k-ecoli74.xml",
      metavar="MODEL", help="SBML model (default: k-ecoli74.xml)")
    p_cmd.add_argument(
      "-t", "--time", type=float, default=300.0,
      metavar="T", help="total simulation time (default: 300)")
  return parser
