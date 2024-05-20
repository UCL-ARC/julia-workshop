# Julia workshop for the Festival of Digital Research & Scholarship

This repository contains the material for the [Festival of Digital Research & Scholarship](https://www.ucl.ac.uk/advanced-research-computing/events/2024/jun/festival-digital-research-scholarship).

## Running the notebook locally

After [installing Julia](https://julialang.org/downloads/), start it with
```
julia --project=.
```

and then inside the Julia REPL you can run the notebook with

```julia
# Necessary only the first time, to instantiate the environment
using Pkg
Pkg.instantiate()

# Run the notebook
using Pluto
Pluto.run()
```

You will need to load the notebook saved at `/root/notebook.jl`.

## Running the notebook in the Docker container

We also provide a [Docker image](https://github.com/UCL-ARC/arc-drs-2024-julia-workshop/pkgs/container/arc-drs-2024-julia-workshop) (built for `linux/amd64` and `linux/arm64`) for running the notebook, which you can pull with

```
docker pull ghcr.io/ucl-arc/arc-drs-2024-julia-workshop:main
```

and then run the notebook with

```
docker run --network=host -ti ghcr.io/ucl-arc/arc-drs-2024-julia-workshop:main julia -e 'using Pluto; Pluto.run()'
```

The `--network=host` option is necessary to expose to the host the port inside the container where the Pluto server is running.
Note that the [host network driver](https://docs.docker.com/network/drivers/host/) is currently available for Docker by default only on Linux systems, but it is available as a [beta feature on Docker Desktop](https://docs.docker.com/network/drivers/host/#docker-desktop) v4.29+ after signing in Docker Hub.
There should be [alternative ways](https://stackoverflow.com/a/30116292) to achieve the same result, your mileage may vary.
