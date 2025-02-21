# jupyter-docker

## Overview
Run Jupyter Lab in a Docker container.

No need to install Jupyter Lab or any other dependencies on the host machine.

OS: Debian Bookworm
Python Version: 3.13.x

## Quick Reference

## Usage

```bash
# assumes notebook directory exists in the current directory
# assumes PORT is 8899
make run
```

## Configuration

```bash
# Override PORT and NOTEBOOKS_DIR
make run PORT=8899 NOTEBOOKS_DIR=./notebooks
```
