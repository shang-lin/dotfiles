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

# Uses Perl to change Windows line endings to Unix line endings.
# Backs up the original file as filename.bak and temporarily
# saves the changed file as filename.tmp.
function win2unix() {
  filename=$1
  if [ -z $1 ]; then
    echo "No argument provided."
  else
    cp ${filename} ${filename}.bak
    perl -pe 's/\r\n/\n/g' ${filename} >${filename}.tmp
    mv ${filename}.tmp ${filename}
  fi
}
