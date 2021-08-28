#!/bin/bash
set -e

# From github action.yml
INPUT_SCRIPT=${INPUT_SCRIPT:-echo 'No script provided. Pass INPUT_SCRIPT.'}

exec /bin/bash -c "$INPUT_SCRIPT"
