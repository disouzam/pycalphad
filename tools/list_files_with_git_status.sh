#!/usr/bin/env bash

function custom_find_folders() {
  # find all folders in the current directory, excluding certain paths
  result=$(find . -maxdepth 1 -type d -not -path '*/.git*' -not -path '*/_dev*' -not -path '*/.devcontainer*' -not -path '*/.venv*' -not -path '*/__pycache__*' -not -path '*/.mypy_cache*' -not -path '*/.pytest_cache*' -not -path '*/.vscode*' -not -path '*/.idea*' -not -path '*/.ipynb_checkpoints*' -not -path '*/*.egg-info*' -not -path '*/*build*' -not -path '*/*static*' -not -path '*/dist*' )
  echo "$result"
}

function list_files_with_git_status() {
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

folders=$(custom_find_folders .)

for folder in $folders; do
  echo -e "\nFolder: $folder"
  pushd "$folder" > /dev/null || continue
  list_files_with_git_status
  subfolders=$(custom_find_folders .)
  echo ${subfolders[@]}
  popd > /dev/null || continue
done