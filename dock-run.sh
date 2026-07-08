#!/bin/bash

docker run --gpus all -it --rm -v $(pwd):/workspace -w /workspace homm3_az_v2 bash
