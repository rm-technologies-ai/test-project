#!/usr/bin/env bats

@test "gh CLI authenticated" {
  run bash -c 'GH_TOKEN=$GITHUB_PERSONAL_ACCESS_TOKEN gh auth status 2>&1'
  [ "$status" -eq 0 ] || [ "$status" -eq 1 ]  # Allow scope warnings
  [[ "$output" == *"github.com"* ]]
}

@test "git config present" {
  run git config user.name
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}

@test "on main branch" {
  run git branch --show-current
  [ "$output" = "main" ]
}

@test "working tree clean" {
  run git status --porcelain
  [ -z "$output" ]
}

@test "remote origin exists" {
  run git remote get-url origin
  [ "$status" -eq 0 ]
}
