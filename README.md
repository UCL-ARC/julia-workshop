# Julia workshop for the Festival of Digital Research & Scholarship

This repository contains the material for the [Festival of Digital Research & Scholarship](https://www.ucl.ac.uk/advanced-research-computing/events/2024/jun/festival-digital-research-scholarship).

## Running the notebook

## Locally

This is our recommended option, as you will more easily be able to keep playing with the notebook afterwards.

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

### Using a Docker container

We also provide a [Docker image](https://github.com/UCL-ARC/arc-drs-2024-julia-workshop/pkgs/container/arc-drs-2024-julia-workshop) (built for `linux/amd64` and `linux/arm64`) for running the notebook, which you can pull with

```
docker pull ghcr.io/ucl-arc/arc-drs-2024-julia-workshop:main
```

and then run the notebook with

```
docker run -p 1234:1234 -ti ghcr.io/ucl-arc/arc-drs-2024-julia-workshop:main julia -e 'using Pluto; Pluto.run(; host="0.0.0.0", port=1234)'
```

You will need to load the notebook saved at `/root/notebook.jl`.

## GitHub Codespaces

You can also take advantage of the ability of [GitHub Codespaces](https://github.com/features/codespaces) to run custom web apps.
Go go the [Codespaces page of this repository](https://github.com/UCL-ARC/arc-drs-2024-julia-workshop/codespaces), click on the green button on the top right "Create codespace on main" and wait a few seconds for the codespace to start.
In the bottom panel, go to the "Terminal" tab (other tabs should be "Problems", "Output", "Debug console", "Ports") and when you see the message (this can take a few seconds to appear after the codespace started, hold on)

```
[ Info: Loading...
┌ Info:
└ Go to http://localhost:1234/ in your browser to start writing ~ have fun!
```

then go to the "Ports" tab, right click on the "Pluto server (1234)" port and click on "Open in browser" (alternatively, click on the globe-shaped button under the "Forwarded Addressses" column).
This will open the Pluto landing page in a new tab in your browser and from there you can open the existing notebook saved at `notebook.jl`.

If you want to make your app accessible to others (but make sure there's no sensitive or private data in it!), in the "Ports" tab right click on the "Pluto server (1234)" port and then "Port visibility" -> "Public".

The `.devcontainer` has been adapted from [Zero-setup R workshops with GitHub Codespaces](https://github.com/revodavid/devcontainers-rstudio) repository presented at [rstudio::conf 2022](https://rstudioconf2022.sched.com/event/11iag/zero-setup-r-workshops-with-github-codespaces).
