#!/usr/bin/env bash

gf_helper_branch_menu_content() {
  echo "${RED}$(git branch --show-current)${NORMAL}"

  # locals sorted by last commit
  GF_BRANCH_LOCAL_BRANCHES="$(git for-each-ref --sort='-committerdate' \
    --format="$GREEN$BOLD%(refname:short)$NORMAL|$MAGENTA%(committerdate:relative)$NORMAL|$CYAN%(committername)$NORMAL" \
    refs/heads | \
    column -t -s'|' \
  )"

  if [ -n "$GF_BRANCH_LOCAL_BRANCHES" ]; then
    echo
    echo "$GF_BRANCH_LOCAL_BRANCHES"
  fi

  if [ -n "$GF_BRANCH_SKIP_REMOTE_BRANCHES" ]; then
    # locals sorted by last commit
    GF_BRANCH_REMOTE_BRANCHES="$(git for-each-ref --sort='-committerdate' \
      --format="$YELLOW$BOLD%(refname:short)$NORMAL|$MAGENTA%(committerdate:relative)$NORMAL|$CYAN%(committername)$NORMAL" \
      refs/remotes | \
      column -t -s'|' \
    )"

    if [ -n "$GF_BRANCH_REMOTE_BRANCHES" ]; then
      echo
      echo "$GF_BRANCH_REMOTE_BRANCHES"
    fi
  fi
}

gf_helper_branch_preview_content() {
  if [ -z "$1" ]; then
    echo "nothing to show"
  else
    if [ "$#" -eq 2 ] && [ "$1" != "$2" ]; then
      # use $2 as the "base" and $1 as the "change"
      # shellcheck disable=2086
      gf_git_command_with_header 1 diff $GF_DIFF_COMMIT_RANGE_PREVIEW_DEFAULTS "$2" "$1" | gf_diff_renderer
    else
      # check against merge-base of the branch under cursor
      # shellcheck disable=2086
      gf_git_command_with_header 1 diff $GF_DIFF_COMMIT_RANGE_PREVIEW_DEFAULTS "$(git merge-base "$GF_BASE_BRANCH" "$1")" "$1" | gf_diff_renderer
    fi
  fi
}

gf_helper_branch_is_local() {
  BRANCH_IF_LOCAL="$(git for-each-ref --format='%(refname:short)' "refs/heads/$1")"
  test -n "$BRANCH_IF_LOCAL"
}

gf_helper_branch_checkout() {
  if [ -z "$1" ]; then
    gf_log_debug "no branch chosen for checkout"
  else
    if git fuzzy helper branch_is_local "$1"; then
      gf_command_logged git checkout "$1"
    else
      STRIPPED_REMOTE="${1#*/}"
      gf_command_logged git checkout -b "$STRIPPED_REMOTE" "$1"
    fi
  fi
}

gf_helper_branch_checkout_files() {
  # TODO currently only diffs
  if [ -z "$1" ]; then
    gf_log_debug "no branch chosen for checkout"
  else
    git fuzzy diff_checkout "$1"
  fi
}

gf_helper_branch_delete() {
  if [ -z "$1" ]; then
    gf_log_debug "no branch chosen for deletion"
  else
    if git fuzzy helper branch_is_local "$1"; then
      gf_command_logged git branch -D "$1"
    else
      STRIPPED_REMOTE="${1#*/}"
      REMOTE="${1%%/*}"
      gf_command_logged git push "$REMOTE" --delete "$STRIPPED_REMOTE"
    fi
  fi
}
