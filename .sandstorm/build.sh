#!/bin/bash
set -xeuo pipefail
cd /opt/app
mkdir -p build
cd build
cmake ..
make -j

cd ../upty
make
go build main.go

