FROM nfcore/rnaseq

RUN apt-get install --assume-yes -qq graphviz && apt-get clean

RUN useradd -U -m -s /bin/bash  nextflow && \
    echo 'PATH="/opt/conda/bin:/opt/conda/condabin:/opt/conda/envs/nf-core-rnaseq-1.3/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"' >> ~nextflow/.profile


RUN cd /home/nextflow && su - nextflow -c 'curl -fsSL get.nextflow.io | bash'


RUN su - nextflow -c '/home/nextflow/nextflow pull nf-core/rnaseq'

ENV HOST_USER nextflow
ENV USER nextflow
USER nextflow

ENTRYPOINT ["/home/nextflow/nextflow", "run", "nf-core/rnaseq"]
