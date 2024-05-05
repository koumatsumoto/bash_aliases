# git reset branches
function xgrb() {
  local base_branch="${1:-main}"
  local current_branch=$(git branch --contains | cut -d " " -f 2)
  
  if [ -z "$current_branch" ]; then
    # If git is not enabled.
    # In this case, the error message is already output.
    return
  fi

  if [ $base_branch != $current_branch ]; then
    git switch $base_branch
  fi

  git pull
  git branch | grep -v $base_branch | xargs git branch -D
}
