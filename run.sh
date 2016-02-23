#!/bin/bash

docker run -d -v $(pwd):/srv -p 2015:2015 ludovicc/caddy-hugo
