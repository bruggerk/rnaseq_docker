# rnaseq_docker

This is a single container version docker of [nf-core/rnaseq](https://github.com/nf-core/rnaseq), with the only differences being that the pipeline and 
pipeline framework being added to the container

How to use this image
=====================

Extensive description on how to use the pipeline can be found [on the project page](https://github.com/nf-core/rnaseq/blob/master/docs/usage.md).
However as this is a containerised version "docker run bruggerk/rnaseq:latest" is identical with "nextflow pull nf-core/rnaseq". However as this is a 
container version of the pipeline you will need to make the local disk available with in the container. 

```bash
# To run docker mounting your current working directory in /run, and execute the program in /run
docker run -v`pwd`:/run/ -w /run bruggerk/rnaseq:latest 

```
