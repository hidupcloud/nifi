#!/bin/sh

set -e

if [[ ! -f "${NIFI_HOME}/bin/nifi.sh" ]]
then
  echo "Deploying nifi..."
  tar xfz /tmp/nifi-${VERSION}-bin.tar.gz
  mv ${NIFI_HOME}/nifi-${VERSION}/* ${NIFI_HOME}
  rm -rf ${NIFI_HOME}/nifi-${VERSION}
fi

${NIFI_HOME}/bin/nifi.sh run
