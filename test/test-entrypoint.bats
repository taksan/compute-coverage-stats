#!/usr/bin/env ./libs/bats/bin/bats
load 'libs/bats-support/load'
load 'libs/bats-assert/load'

@test "should compute correct coverage and color" {
	run ../entrypoint.sh resources/unified.lcov
    assert_output --partial "::set-output name=coverage::90.3"
    assert_output --partial "::set-output name=coverage-color::green"
}
