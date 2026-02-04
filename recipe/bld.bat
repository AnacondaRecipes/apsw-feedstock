set "CL= -DSQLITE_ENABLE_COLUMN_METADATA=1"

echo "
[build_ext]
use_system_sqlite_config = True" >> setup.apsw

%PYTHON% setup.py build --enable=column_metadata,rtree,fts5
if errorlevel 1 exit 1
%PYTHON% setup.py install --single-version-externally-managed --record record.txt
if errorlevel 1 exit 1
%PYTHON% setup.py test
if errorlevel 1 exit 1