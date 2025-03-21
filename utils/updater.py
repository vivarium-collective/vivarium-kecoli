import numpy as np

from typing import List, Tuple, Dict, Any
def bulk_numpy_updater(
    current: np.ndarray, update: List[Tuple[int | np.ndarray, int | np.ndarray]]
) -> np.ndarray:
    """Updater function for bulk molecule structured array.

    Args:
        current: Bulk molecule structured array
        update: List of tuples ``(mol_idx, add_val)``, where
            ``mol_idx`` is the index (or array of indices) for
            the molecule(s) to be updated and ``add_val`` is the
            count (or array of counts) to be added to the current
            count(s) for the specified molecule(s).

    Returns:
        Updated bulk molecule structured array
    """
    # Bulk updates are lists of tuples, where first value
    # in each tuple is an array of indices to update and
    # second value is array of updates to apply
    result = current
    # Numpy arrays are read-only outside of updater
    result.flags.writeable = True
    for idx, value in update:
        result["count"][idx] += value
    result.flags.writeable = False
    return result