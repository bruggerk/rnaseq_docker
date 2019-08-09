FROM nfcore/rnaseq

RUN mkdir -p  /scratch /refs/ /cluster /work /tsd /projects /net

RUN apt-get install --assume-yes -qq graphviz && apt-get clean

RUN curl -fsSL get.nextflow.io | bash
RUN chmod 755 /nextflow


RUN curl -Lo /tmp/rnaseq.tar.gz https://github.com/nf-core/rnaseq/archive/1.3.tar.gz && \
    mkdir /rnaseq && \
    tar zxvf /tmp/rnaseq.tar.gz -C /rnaseq/ --strip 1 && \
    rm /tmp//rnaseq.tar.gz

ENV HOST_USER 'Docker' 
ENV USER 'Docker' 

ENTRYPOINT ["/nextflow", "run", "/rnaseq/main.nf"]
