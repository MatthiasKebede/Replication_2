<p style="border:1px; border-style:solid; border-color:black; padding: 1em;">
CS-UH 3260 Software Analytics<br/>
Replication Study Guidelines<br/>
Dr. Sarah Nadi, NYUAD
</p>

# Replication 2 -- CS-UH-3260 Software Analytics


## Overview

This repo contains the scripts and data used for the `Replication 2` assignment, focusing on the paper *BUMP: A Benchmark of Reproducible Breaking Dependency Updates*. The scope of our replication includes `Table II` (covers the distribution of breaking updates across several failure categories), the reproduction of five provided breaking updated commits, and a replication using up-to-date mined data comparing 5 projects from the benchmark against 5 new projects.


### 1. Project Title and Overview

- **Paper Title**: BUMP: A Benchmark of Reproducible Breaking Dependency Updates
- **Authors**: Reyes, Frank and Gamage, Yogya and Skoglund, Gabriel and Baudry, Benoit and Monperrus, Martin
- **Replication Team**: Matthias Kebede and Muhammad Arhum
- **Course**: CS-UH 3260 Software Analytics, NYUAD
- **Brief Description**: 
  - The original study revolves around breaking dependency updates and accordingly offers a benchmark of reproducible real-world cases. Their process includes mining GitHub repositories and identifying potential breaking updates, then attempting to build the pre- and post-commit commits to verify the reproducibility of that specific breaking update.
  - Our partial replication study focuses on RQ1, in which we successfully reproduce their findings for a subset of identified breaking updates and obtain mixed results when reproducing their categorization of breaking updates by failure type. We further investigated whether new breaking dependency updates have appeared after the original dataset cutoff.

### 2. Repository Structure

Document your repository structure clearly. Organize your repository using the following standard structure:

```
README                    # Repository documentation
datasets/                 # Original study data
  - benchmark                 # Raw JSON data
scripts/                  # Original study scripts
replication_scripts/      # Scripts for replication (by us)
  - result.sh                 # Check breaking builds for reproduction
  - table2.py                 # Reproduce Table II by reading `datasets/benchmark` files
logs/                     # Outputs produced by running scripts (incl. our replication data)
  - benchmark                 # Raw JSON data
  - reproduced                # Log files of reproduced pre- and breaking builds
notes/                    # Brief notes
results/                  # Calculated result CSV files
  - results.csv               # Results of checking build breakages
  - table2.csv                # Reproduction data for Table II
```

**For each folder and file, provide a brief description of what it contains.**

### 3. Setup Instructions

- **Prerequisites**:
  - Java 17 or higher
  - Python 3.11 or higher
  - Git and Pip are installed (tested with `git version 2.41.0.windows.1` and `pip 23.1.2`)
- **Installation Steps**: Step-by-step instructions to set up the environment
  - Clone the repository (e.g. `git clone https://github.com/MatthiasKebede/Replication_2`) and navigate to the directory
  - Create a virtual environment and activate it, then install required libraries (only needed to run original study's `scripts/` files):
  ```bash
  python -m venv .venv                   # create venv
  source .venv/bin/activate              # activate venv (`.venv/scripts/activate` on Windows)
  pip install -r requirements.txt        # install libraries
  ```
- **Running Instructions**:
  - To reproduce Table II, simply run `python table2.py` with valid data in the `datasets/benchmark` directory.
  - To run the Java tools (miner and reproducer), check https://github.com/chains-project/bump?tab=readme-ov-file#tools to find specific instructions.

### 4. GenAI Usage

**GenAI Usage**: Briefly document any use of generative AI tools (e.g., ChatGPT, GitHub Copilot, Cursor) during the replication process. Include:
  <!-- - Which tools were used
  - How they were used (e.g., understanding scripts, exploring datasets, understanding data fields, debugging)
  - Brief description of the assistance provided -->

  - **GitHub Copilot**
    - Used to help troubleshoot Java (installation, setup, etc.) and the provided scripts (miner, reproducer)





## Grading Criteria for README

Your README will be evaluated based on the following aspects (Total: 40 points):

### 1. Completeness (10 points)
- [ ] All required sections are present
- [ ] Each section contains sufficient detail
- [ ] Repository structure is fully documented
- [ ] All files and folders are explained
- [ ] GenAI usage is documented (if any AI tools were used)

### 2. Clarity and Organization (5 points)
- [ ] Information is well-organized and easy to follow
- [ ] Instructions are clear and unambiguous
- [ ] Professional writing and formatting
- [ ] Proper use of markdown formatting (headers, code blocks, lists)

### 3. Setup and Reproducibility (10 points)
- [ ] Setup instructions are complete and accurate, i.e., we were able to rerun the scripts following your instructions and obtain the results you reported


## Best Practices

1. **Be Specific**: Include exact versions, paths, and commands rather than vague descriptions
2. **Keep It Updated**: Ensure the README reflects the current state of your repository
3. **Test Your Instructions**: Have someone else (or yourself in a fresh environment) follow the setup instructions
4. **Document AI Usage**: If you used any GenAI tools, be transparent about how they were used (e.g., understanding scripts, exploring datasets, understanding data fields)


## Acknowledgement

This guideline was developed with the assistance of [Cursor](https://www.cursor.com/), an AI-powered code editor. This tool was used to:

- Draft and refine this documentation iteratively
