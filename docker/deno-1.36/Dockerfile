FROM denoland/deno:1.36.1

ARG UID
ARG GID

RUN groupmod -o -g $GID deno && usermod -u $UID deno

RUN mkdir -p /home/deno/app

RUN chown -R deno:deno /home/deno

USER deno

WORKDIR /home/deno/app
