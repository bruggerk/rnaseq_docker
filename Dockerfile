FROM nfcore/rnaseq

RUN mkdir -p  /scratch /refs/ /cluster /work /tsd /projects /net

RUN apt-get install --assume-yes -qq graphviz && apt-get clean

RUN mkdir -p  /scratch /refs/ /cluster /work /tsd /projects /net


RUN useradd -U -m -s /bin/bash  nextflow && \
    echo 'PATH="/opt/conda/bin:/opt/conda/condabin:/opt/conda/envs/nf-core-rnaseq-1.3/bin:/opt/conda/bin:/usr/local/bin:/usr/bin:/bin"' >> ~nextflow/.profile


RUN cd /usr/local/bin/ && curl -fsSL get.nextflow.io | bash && chmod 755 nextflow
RUN su - nextflow -c 'nextflow pull nf-core/rnaseq'

ENV HOST_USER nextflow
ENV USER nextflow
USER nextflow
WORKDIR /home/nextflow/

ENTRYPOINT ["nextflow", "run", "nf-core/rnaseq"]
