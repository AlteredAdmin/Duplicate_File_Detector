# Duplicate File Detector

This repository contains scripts for detecting duplicate files in a specified directory. The scripts use hash functions to identify duplicates by comparing file contents, ensuring accuracy regardless of file names. Available for Bash, PowerShell, and Python environments.


**Author:** Altered Admin  
**Website:** [Altered Admin's Site](https://alteredadmin.github.io)  
**Twitter:** [@Alt3r3dAdm1n](https://twitter.com/Alt3r3dAdm1n)  

## Scripts

- `DuplicateFileDetector.sh`: Bash script for Unix/Linux systems.
- `DuplicateFileDetector.ps1`: PowerShell script for Windows systems.
- `DuplicateFileDetector.py`: Python script for cross-platform usage.

## Features

- **Efficiency**: Quickly scans directories by calculating file hashes.
- **Accuracy**: Detects duplicates based on file content, not names.
- **Convenience**: Generates a CSV file listing all duplicate files with their paths.
- **Flexibility**: Offers versions for multiple operating systems and environments.

## Usage

### Bash (Unix/Linux)

1. Ensure you have execution permission: `chmod +x DuplicateFileDetector.sh`
2. Run the script: `./DuplicateFileDetector.sh`
3. Enter the directory path when prompted.

### PowerShell (Windows)

1. Open PowerShell with administrative privileges.
2. Execute the script: `.\DuplicateFileDetector.ps1`
3. Follow the on-screen instructions.

### Python (Cross-Platform)

1. Ensure Python is installed on your system.
2. Run the script: `python DuplicateFileDetector.py`
3. Input the directory path as prompted.

## Requirements

- Bash script requires `sha256sum` and standard Unix utilities.
- PowerShell script requires Windows PowerShell 5.1 or higher.
- Python script requires Python 3.x.


### Support the Developer

If you found this helpful, please consider:

- **Buymeacoffee:** [Link](http://buymeacoffee.com/alteredadmin)

<!---
---
### Support the Developer

If you found this helpful, please consider:

- **Buymeacoffee:** [Link](http://buymeacoffee.com/alteredadmin)
- **BTC:** `bc1qhkw7kv9dtdk8xwvetreya2evjqtxn06cghyxt7`
- **LTC:** `ltc1q2mrh9s8sgmh8h5jtra3gqxuhvy04vuagpm3dk9`
- **ETH:** `0xef053b0d936746Df00C9CCe0454b7b8afb1497ac`

-->