#!/bin/bash

# Directory containing logs and repo information
LOGDIR="../logs/reproduced"
JSONDIR="../logs/benchmark"
OUTFILE="../results/results.csv"

# CSV header
echo "repo,commit,pre_build_status,breaking_build_status,reproduced" > "$OUTFILE"

# Loop over all *_pre.log files
for pre in "$LOGDIR"/*_pre.log; do
    base=$(basename "$pre" _pre.log)
    breaking="$LOGDIR/${base}_breaking.log"

    # Expand JSON glob properly
    jsonfile=( "$JSONDIR/${base}"*.json )
    if [[ -f "${jsonfile[0]}" ]]; then
        # Parse JSON without jq
        repo=$(grep -oP '"url"\s*:\s*"\K[^"]+' "${jsonfile[0]}")
        full_commit=$(grep -oP '"breakingCommit"\s*:\s*"\K[^"]+' "${jsonfile[0]}")
    else
        repo="UNKNOWN"
        full_commit="UNKNOWN"
    fi

    # Pre-build status
    if grep -q "BUILD SUCCESS" "$pre"; then
        pre_result="SUCCESS"
    else
        pre_result="FAIL"
    fi

    # Breaking-build status
    if grep -q "BUILD SUCCESS" "$breaking"; then
        breaking_result="SUCCESS"
    else
        breaking_result="FAIL"
    fi

    # Reproduction check
    if [[ "$pre_result" == "SUCCESS" && "$breaking_result" == "FAIL" ]]; then
        reproduced="YES"
    else
        reproduced="NO"
    fi

    # Append row to CSV
    echo "$repo,$full_commit,$pre_result,$breaking_result,$reproduced" >> "$OUTFILE"
done

echo "Detailed CSV written to $OUTFILE"
