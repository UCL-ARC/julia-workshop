# syntax=docker/dockerfile:1

FROM --platform=linux/amd64 julia:1.10.3

# Set `JULIA_CPU_TARGET` to same value as default Julia builds, to ensure we
# don't specialise pkgimages to the current host CPU:
# https://github.com/JuliaCI/julia-buildkite/blob/ea50eb719242bc3e844227a2ebf54a49d308bafc/utilities/build_envs.sh#L25-L32
ENV JULIA_CPU_TARGET="generic;sandybridge,-xsaveopt,clone_all;haswell,-rdrnd,base(1);x86-64-v4,-rdrnd,base(1)"

# Instantiate Julia project
RUN mkdir -p /root/.julia/environments/v1.10
COPY Project.toml  /root/.julia/environments/v1.10/Project.toml
COPY Manifest.toml /root/.julia/environments/v1.10/Manifest.toml
RUN julia --color=yes -e 'using Pkg; Pkg.instantiate()'

# Copy notebook
COPY notebook.jl /root/notebook.jl

# Precompile notebook environment
RUN julia --color=yes -e '\
using Pkg;\
using Pluto;\
Pluto.activate_notebook_environment("notebook.jl");\
Pkg.instantiate()'
