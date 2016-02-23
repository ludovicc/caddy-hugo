# caddy-hugo-docker
Docker image for Caddy + its Hugo plugin

Usage:

Go to the repository containing your Hugo project, then run

   docker run -d -v $(pwd):/srv -p 2015:2015 ludovicc/caddy-hugo

