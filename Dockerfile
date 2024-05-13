# syntax=docker/dockerfile:1
ARG platform=linux/amd64
ARG julia_cpu_target
FROM --platform=${platform} julia:1.10.3

# Set `JULIA_CPU_TARGET` to same value as default Julia builds, to ensure we
# don't specialise pkgimages to the current host CPU:
ENV JULIA_CPU_TARGET=${julia_cpu_target}

# Instantiate Julia project
RUN mkdir -p /root/.julia/environments/v1.10
COPY Project.toml  /root/.julia/environments/v1.10/Project.toml
COPY Manifest.toml /root/.julia/environments/v1.10/Manifest.toml
RUN julia -e 'using InteractiveUtils; versioninfo(; verbose=true)'
RUN julia --color=yes -e 'using Pkg; Pkg.instantiate()'

# Copy notebook
COPY notebook.jl /root/notebook.jl

# Precompile notebook environment
RUN julia --color=yes -e '\
using Pkg;\
using Pluto;\
Pluto.activate_notebook_environment("/root/notebook.jl");\
Pkg.instantiate()'
