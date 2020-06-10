#!/bin/bash
set -xeuo pipefail
if [ -d /opt/app ]; then
    cd /opt/app
fi

#mkdir -p /var/pts
#unshare -Umr /usr/whoami
#unshare -Umr /bin/bash -xc "mkdir -p /dev/pts && mount devpts /dev/pts -t devpts && build/ttyd -p 8000 /bin/bash"
APPDIR="$(pwd)"
mkdir -p /var/home/user
export HOME=/var/home/user
(cd $HOME; "$APPDIR/upty/main" &)
LD_PRELOAD=$APPDIR/upty/shim.so build/ttyd -p 8000 /bin/bash
