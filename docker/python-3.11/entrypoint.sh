#!/bin/bash

export PATH="$PATH:/home/notte/.local/bin"

if [ -f "requirements.txt" ]; then
  pip install -r requirements.txt
fi

exec "$@"
