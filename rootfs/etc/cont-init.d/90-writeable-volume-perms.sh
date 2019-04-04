#!/usr/bin/with-contenv bash

chown -R "${PUID}:${PGID}" /src/app
chown -R "${PUID}:${PGID}" /src/generated
chown -R "${PUID}:${PGID}" /src/pub
chown -R "${PUID}:${PGID}" /src/var
