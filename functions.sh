# General-purpose functions that can be included in .bashrc or .bash_profile.

# Compare files in the current directory with the same filenames
# in a different directory.
# arguments:
#   directory
#   wildcard string - Enclose this in quotation marks.
function comparedir() {
  directory=$1
  wildcard=$2
  if [ -z $2 ]; then
    wildcard='*'
  fi

  for f in ${wildcard}; do
    echo "Comparing $f"
    diff $f ${directory}/$f
    done
}
