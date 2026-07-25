#!/bin/bash
function get_commits_not_merged_into_develop() {
    local branch=$1
    local commit_hash=$(git rev-parse ${branch})
    local merge_base=$(git merge-base develop ${commit_hash})
    git log --pretty=fuller --raw --boundary ${merge_base}..${commit_hash} > "${branch}_commits.diff"
}

for i in "$@"; do
    get_commits_not_merged_into_develop "$i"
done