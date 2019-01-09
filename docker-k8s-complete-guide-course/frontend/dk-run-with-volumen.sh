#!/usr/bin/env bash
# -v without : to keep the dir inside docker, and use -v with : to map the volume.
echo 'dkrun -p 3000:3000 -v /app/node_modules -v $(pwd):/app <container id>'