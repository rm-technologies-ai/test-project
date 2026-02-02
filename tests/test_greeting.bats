#!/usr/bin/env bats

# Tests for greeting feature (Issue #1)

@test "greeting with name parameter outputs Hello, <name>!" {
  run ./scripts/greet.sh "Alice"
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, Alice!" ]
}

@test "greeting with different name works" {
  run ./scripts/greet.sh "Bob"
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, Bob!" ]
}

@test "greeting with no parameter defaults to World" {
  run ./scripts/greet.sh
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, World!" ]
}

@test "greeting with name containing spaces" {
  run ./scripts/greet.sh "John Doe"
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, John Doe!" ]
}
