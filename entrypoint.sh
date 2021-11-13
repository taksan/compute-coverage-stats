#!/bin/sh -e

FILE="$1"

COVERAGE=$(lcov --summary "$FILE" |grep --color=none lines| sed 's/.*: \([^%]*\)%.*/\1/')
echo "::set-output name=coverage::${COVERAGE}"

COLOR=$(
echo | awk "{
    if ( $COVERAGE > 90 ) { print \"green\" }
    if ( $COVERAGE >= 80 && $COVERAGE < 90) {print \"yellow\"}
    if ( $COVERAGE < 80 ) {print \"red\"}
}
"
)
echo "::set-output name=coverageColor::${COLOR}"
