#!/usr/bin/env bash

# References used:
# - https://unix.stackexchange.com/questions/609287/bash-array-appending-element-issue/609293#609293
# - https://stackoverflow.com/questions/51306244/list-files-with-git-status/70721980#70721980

function custom_find_folders() {
  # find all folders in the current directory, excluding certain paths
  result=$(find "$1" -maxdepth 1 -type d -not -path '*/.git*' -not -path '*/_dev*' -not -path '*/.devcontainer*' -not -path '*/.venv*' -not -path '*/__pycache__*' -not -path '*/.mypy_cache*' -not -path '*/.pytest_cache*' -not -path '*/.vscode*' -not -path '*/.idea*' -not -path '*/.ipynb_checkpoints*' -not -path '*/*.egg-info*' -not -path '*/*build*' -not -path '*/*static*' -not -path '*/dist*' )
  echo "$result"
}

function list_files_in_a_single_folder_with_git_status() {
  for FILE in *
  do
    if [[ -f $FILE ]]
    then
      if ! [[ $(git status -s $FILE) ]]
      then
        # first two simbols below is a two-letter status code
        echo "   $FILE"
      else
        git -c status.relativePaths=true status -s "$FILE"
      fi
    fi
    if [[ -d $FILE ]]
    then
      # first two symbols just selected as status code for directories
      echo "__ $FILE"
    fi
  done
}

function walk_folders_recursive() {
  local folder="$1"

  echo -e "\nFolder: $folder"
  pushd "$folder" > /dev/null || return
  list_files_in_a_single_folder_with_git_status

  while IFS= read -r subfolder; do
    [[ "$subfolder" == "." ]] && continue
    walk_folders_recursive "$subfolder"
  done < <(custom_find_folders .)

  popd > /dev/null || return
}

folders=$(custom_find_folders $1)

for folder in $folders; do
  walk_folders_recursive "$folder"
done