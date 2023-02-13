#!/usr/bin/env bash

# Mount the PWD and the /work mount dir to enable access in try_run commands
exec ${WASMER_DIR}/bin/wasmer run --dir=. --dir=$PWD --dir=/work/ "$@"
