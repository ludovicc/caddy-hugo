# caddy-hugo-docker
Docker image for Caddy + its Hugo plugin

Usage:

Go to the repository containing your Hugo project, then run

   docker run -d -v $(pwd):/srv -p 2015:2015 -e PORT=2015 ludovicc/caddy-hugo

You need to match the value of the PORT variable to the port exposed by Docker. It's better to keep ports in Docker and out of Docker the same, for example 2015:2015
