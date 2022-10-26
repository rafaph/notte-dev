FROM python:3.11-slim

ENV PORT=3000
ENV VIRTUAL_PORT=$PORT

ARG UID
ARG GID

RUN apt-get update && apt-get -y install gcc curl git bash

RUN groupadd -f -o -r -g $GID notte && useradd -ms /bin/bash -o -u $UID -g $GID notte

HEALTHCHECK --interval=30s --timeout=10s CMD wget -q "http://localhost:$PORT/status" -O /dev/null

USER notte

RUN pip install -U pip setuptools wheel

RUN mkdir -p /home/notte/.local/bin
RUN mkdir -p /home/notte/.local/lib/python3.11/site-packages
RUN chown -R notte:notte /home/notte/.local

COPY --chown=notte:notte entrypoint.sh /usr/local/bin/entrypoint

RUN chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]
