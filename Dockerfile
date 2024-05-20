# syntax=docker/dockerfile:1
FROM julia:1.10.3

# Docker is awful and doesn't allow conditionally setting environment variables in a decent
# way, so we have to keep an external script and source it every time we need it.
COPY julia_cpu_target.sh /julia_cpu_target.sh

RUN julia --color=yes -e 'using InteractiveUtils; versioninfo()'

# Instantiate Julia project
RUN mkdir -p /root/.julia/environments/v1.10
COPY Project.toml  /root/.julia/environments/v1.10/Project.toml
COPY Manifest.toml /root/.julia/environments/v1.10/Manifest.toml
RUN . /julia_cpu_target.sh && julia --color=yes -e 'using Pkg; Pkg.instantiate()'

# Copy notebook
COPY notebook.jl /root/notebook.jl

# Precompile notebook environment
RUN . /julia_cpu_target.sh && julia --color=yes -e '\
using Pkg;\
using Pluto;\
Pluto.activate_notebook_environment("/root/notebook.jl");\
Pkg.instantiate()'
