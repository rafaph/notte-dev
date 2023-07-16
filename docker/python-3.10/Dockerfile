FROM python:3.10-slim

ENV PORT=3000
ENV VIRTUAL_PORT=$PORT

ARG UID
ARG GID

RUN apt-get update && apt-get -y install gcc curl git bash

RUN groupadd -f -o -r -g $GID notte && useradd -ms /bin/bash -o -u $UID -g $GID notte

HEALTHCHECK --interval=30s --timeout=10s CMD wget -q "http://localhost:$PORT/status" -O /dev/null

USER notte

RUN pip install --user -U pip setuptools wheel && pip install --user poetry poetry-plugin-up

RUN python -m poetry config virtualenvs.in-project true

COPY --chown=notte:notte entrypoint.sh /usr/local/bin/entrypoint

RUN chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]
