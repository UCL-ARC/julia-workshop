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

## Running the notebook in the Docker container

We also provide a [Docker image](https://github.com/UCL-ARC/arc-drs-2024-julia-workshop/pkgs/container/arc-drs-2024-julia-workshop) (built for `linux/amd64`) for running the notebook, which you can pull with

```
docker pull ghcr.io/ucl-arc/arc-drs-2024-julia-workshop:main
```

and then run the container with

```
docker run --network=host -ti ghcr.io/ucl-arc/arc-drs-2024-julia-workshop:main
```

The `--network=host` option is necessary to expose to the host the port inside the container where the Pluto server is running.
There should be [alternative ways](https://stackoverflow.com/a/30116292) to achieve the same result, your mileage may vary.
This has been tested on an x86_64 Arch Linux system.

With the `docker run` command above the Julia REPL should automatically start, at which point you can directly run the Pluto notebook with

```julia
using Pluto
Pluto.run()
```

as the environment has been already instantiated in the image.
