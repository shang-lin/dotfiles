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

# Mounts my home directory using sshfs in /tmp.
# arguments:
# servername
# username - 'schen' by default, unless one is specified.
function mount_ssh () {
  if [ -z $1 ]; then
    echo "usage: mount_ssh servername [username]"
    return
  fi
  server=$1
  if [ -z $2 ]; then
    user=schen
  else
    user=$2
  fi

  mountpoint="${HOME}/sshfs/${server}"
  if [ ! -d ${mountpoint} ]; then
    echo "Creating ${mountpoint}"
    mkdir ${mountpoint}
  fi
  echo "Mounting $mountpoint"
  sshfs ${server}:/home/${user} ${mountpoint} -o auto_cache
}

function umount_ssh () {
  host=$1
  pid=$(pgrep -f "sshfs $host")
  if [ -z $pid ]; then
     echo "sshfs process not found for ${host}."
  else
      echo "Killing $pid"
      kill $pid
  fi
}

# Activates the Anaconda environment and starts Jupyter notebook.
# If no argument is provided, run jupyter in the current directory.
# If an argument is provided, change to the directory.
function run_notebook() {
  . ${HOME}/anaconda_env.bash
  if [ -z $1 ]; then
    jupyter notebook
  else
    directory=$1
    . ${HOME}/anaconda_env.bash
    pushd $directory
    jupyter notebook
    popd
  fi
}

# Set the prompt to the working directory and the weather
# from wttr.in.
function set_weather_prompt() {
  weather=$(curl -s -S wttr.in/?format=1)
  if [[ "$?" -eq "0" ]]; then
    export PS1="\h:\W ${weather} $ "
  fi
}

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
