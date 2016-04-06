#!/bin/bash

PORT=2015

docker run -d -v $(pwd):/srv -p $PORT:$PORT -e PORT=$PORT ludovicc/caddy-hugo
