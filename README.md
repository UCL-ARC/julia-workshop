# Julia workshop for the Festival of Digital Research & Scholarship

This repository contains the material for the [Festival of Digital Research & Scholarship](https://www.ucl.ac.uk/advanced-research-computing/events/2024/jun/festival-digital-research-scholarship).

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
