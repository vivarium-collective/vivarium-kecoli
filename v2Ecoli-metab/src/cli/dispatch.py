
from argparse import ArgumentParser, Namespace
import importlib.resources
from pathlib import Path

from . import test
from . import validate


# config
# ==============================================================================

def find_model(name: str | None = None) -> Path:
  default = "k-ecoli74.xml"
  if name is None or not name:
    name = default
  if name != default:
    raise NotImplementedError(f"unknown model: {name}")
  return importlib.resources.files("v2Ecoli.metab.model") / name


# dispatch
# ==============================================================================

def dispatch(args: Namespace):
  return globals()[f"{args.cmd}"].main(find_model(args.model), args)


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
      "model", type=str, nargs="?", default="",
      metavar="MODEL", help="SBML model (default: k-ecoli74.xml)")
    p_cmd.add_argument(
      "-t", "--time", type=float, default=300.0,
      metavar="T", help="total simulation time (default: 300)")
  p_cmd.add_argument(
    "-f", "--factor", type=float, default=2.0,
    metavar="F", help="multiplicative perturbation (default: 2)")
  return parser
