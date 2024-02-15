#!/bin/bash

# ----------------------------------
# Ollama Setup Bash Shell Script
# Maintainer: Aman Das <amandas62640@gmail.com>
# Version: 0.0.1
# Date: 2024-02-05
# ----------------------------------

# Variables

model_dir="/var/mnt/Data/Models"

# Functions


# Main Function
main() {
  curl https://ollama.ai/install.sh | sh
}

main "$@"
