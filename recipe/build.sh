#!/bin/bash
set -euxo pipefail

export CFLAGS="-I${PREFIX}/include -DSQLITE_ENABLE_COLUMN_METADATA=1 ${CFLAGS}"
export LDFLAGS="-L${PREFIX}/lib -Wl,-rpath,${PREFIX}/lib ${LDFLAGS}"

cat >> setup.apsw << 'EOF'

[build_ext]
use_system_sqlite_config = True
enable = column_metadata,rtree,fts5
EOF

$PYTHON -m pip install . -vv --no-deps --no-build-isolation