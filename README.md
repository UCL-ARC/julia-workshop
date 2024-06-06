# Julia workshop for the UCL Festival of Digital Research & Scholarship 2024

This repository contains the material for the [UCL Festival of Digital Research & Scholarship 2024](https://www.ucl.ac.uk/advanced-research-computing/events/2024/jun/festival-digital-research-scholarship).

## Running the notebook

### Locally

> [!NOTE]
> This is our recommended option, as you will more easily be able to keep playing with the notebook afterwards.

Clone this repository (make sure to [install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)) and then enter inside the new directory by running the following commands in a terminal (we recommend using [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.4) if on Windows):

```sh
git clone https://github.com/UCL-ARC/julia-workshop
cd julia-workshop
```

After [installing Julia](https://julialang.org/downloads/), start it with
```sh
julia --project=.
```

and then inside the Julia [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) you can run [Pluto](https://plutojl.org/), the interactive notebook environment we will be using, with

```julia
# Necessary only the first time, to instantiate the environment
using Pkg
Pkg.instantiate()

# Run the notebook
using Pluto
Pluto.run()
```

This should open a tab in your default browser showing the Pluto interface. From there find the `Open a notebook` section and click on the `Enter path or URL...` field and select `notebook.jl` from the drop-down and then click the `Open` button to open the example notebook we will be using.

> [!NOTE]
> The notebook will initially be opened in _Safe preview_ mode which allows you to view and edit the notebook content but not run any code, or view the rendered outputs. This is a security measure to prevent malicious notebooks being run automatically that may try to steal data. To exit from _Safe preview_ mode either click the _Safe preview ⓘ_ information button at the bottom of the interface and click `run this notebook` or click on the `Run notebook code` link in the top-right of the interface.

### Using a Docker container

We also provide a [Docker image](https://github.com/UCL-ARC/julia-workshop/pkgs/container/julia-workshop) (built for `linux/amd64` and `linux/arm64`) for running the notebook, which you can pull with

```sh
docker pull ghcr.io/ucl-arc/julia-workshop:main
```

and then run [Pluto](https://plutojl.org/), the interactive notebook environment we will be using, with (if on MacOS or Linux)

```sh
docker run -p 1234:1234 -ti ghcr.io/ucl-arc/julia-workshop:main julia -e 'using Pluto; Pluto.run(; host="0.0.0.0", port=1234)'
```

or if using PowerShell on Windows run

```PowerShell
docker run -p 1234:1234 -ti ghcr.io/ucl-arc/julia-workshop:main julia -e 'using Pluto; Pluto.run(; host=""""0.0.0.0"""", port=1234)'
```

This will launch Pluto within the container, and if successful you should see a message similar to

```
[ Info: Loading...
┌ Info:
└ Go to http://0.0.0.0:1234/?secret=hgY7as1X in your browser to start writing ~ have fun!
```

where `hgY7as1X` in the URL will be replaced with another random alphanumeric string. The Pluto notebook environment is accessed as a web app, so you should open a browser window and navigate to the URL indicated in the message to open the Pluto interface. If you get `Unable to connect` message or similar when trying to open the URL, you may need to replace the `0.0.0.0` component with `localhost`, so for the example above you would navigate to `http://localhost:1234/?secret=hgY7as1X`. 

Once you have the Pluto interface open in your browse,u will need to load the notebook saved at `/root/notebook.jl`, to open the notebook, find the `Open a notebook` section in the Pluto interface and click on the `Enter path or URL...` field and select `root/` and then `notebook.jl` from the drop-down file naviagtor and then click the `Open` button to open the example notebook we will be using.

### GitHub Codespaces

You can also take advantage of the ability of [GitHub Codespaces](https://github.com/features/codespaces) to run custom web apps.
Go go the [Codespaces page of this repository](https://github.com/UCL-ARC/julia-workshop/codespaces), click on the green button on the top right "Create codespace on main" and wait a few seconds for the codespace to start.
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
