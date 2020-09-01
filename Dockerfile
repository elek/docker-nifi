ARG BASE=latest
FROM flokkr/base:${BASE}
ARG ARTIFACTDIR
WORKDIR /opt/nifi
RUN useradd --uid 1000 nifi --gid 1000 -G flokkr --home /opt/nifi && chown nifi /opt
USER nifi
ADD --chown=nifi:flokkr ${ARTIFACTDIR} /opt/nifi
RUN sudo chown -R nifi.flokkr /opt/nifi
ENV PATH $PATH:/opt/nifi/bin
