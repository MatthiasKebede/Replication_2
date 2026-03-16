#!/bin/bash

output="projects_summary.csv"

# write CSV header
echo "project,bump_breaking_updates,manual_breaking_updates,benchmark_status" > "$output"

for dir in */; do
    project=$(basename "$dir")

    # count json files
    count=$(find "$dir" -maxdepth 1 -name "*.json" | wc -l)

    # check benchmark membership
    case "$project" in
        "mina-sshd"|"dropwizard"|"maven-resolver"|"PGS"|"billy")
            benchmark="in benchmark"
            ;;
        *)
            benchmark="not in benchmark"
            ;;
    esac

    echo "$project,$count,0,$benchmark" >> "$output"
done
