#!/bin/bash
set -euxo pipefail

export CFLAGS="-I${PREFIX}/include -DSQLITE_ENABLE_COLUMN_METADATA=1 ${CFLAGS}"
export LDFLAGS="-L${PREFIX}/lib -Wl,-rpath,${PREFIX}/lib ${LDFLAGS}"

echo "
[build_ext]
use_system_sqlite_config = True" >> setup.apsw

$PYTHON setup.py build --enable=column_metadata,session,preupdate_hook
$PYTHON setup.py install --single-version-externally-managed --record record.txt
$PYTHON setup.py test
