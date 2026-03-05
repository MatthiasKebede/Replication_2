import json
import os
import csv
from collections import Counter

path = "datasets/benchmark"
output_file = "results/table2.csv"
counts = Counter()

for file in os.listdir(path):
    if file.endswith(".json"):
        with open(os.path.join(path, file)) as fp:
            data = json.load(fp)
            counts[data["failureCategory"]] += 1

total = sum(counts.values())

with open(output_file, mode="w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["Failure category", "Number of breaking updates", "Percentage"])
    
    for category, count in counts.items():
        percentage = round(count / total * 100, 2)
        writer.writerow([category, count, f"{percentage}%"])

    writer.writerow(["TOTAL", total, "100%"])

print(f"Results written to {output_file}")
print("TOTAL", total)
