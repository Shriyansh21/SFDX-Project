#!/usr/bin/env bash

# set this to your active development branch
main_branch="master"
current_branch="$(git rev-parse --abbrev-ref HEAD)"

# only check commit messages on main development branch
[ "$current_branch" != "$main_branch" ] && exit 0

# regex to validate in commit msg
commit_regex='(CRM2021-[0-9]+.* )'
error_msg="ERROR: Commit message requires JIRA key. Example: \"CRM2021-123: Test Commit\""

if ! grep -iqE "$commit_regex" "$1"; then
    echo "$error_msg" >&2
    exit 1
fi