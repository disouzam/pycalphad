#!/bin/bash
function get_commits_not_merged_into_develop() {
    local branch=$1
    local commit_hash=$(git rev-parse ${branch})
    local merge_base=$(git merge-base develop ${commit_hash})
    file_name="${branch}_commits_for_cherry_pick.sh"
    echo "#!/usr/bin/env bash" > "${file_name}"
    git log --oneline --format="#git cherry-pick -x --no-commit %h #%s" ${merge_base}..${commit_hash} --reverse >> "${file_name}"
}

for i in "$@"; do
    get_commits_not_merged_into_develop "$i"
done