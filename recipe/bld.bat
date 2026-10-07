set "CL= -DSQLITE_ENABLE_COLUMN_METADATA=1"

echo.>> setup.apsw
echo [build_ext]>> setup.apsw
echo use_system_sqlite_config = True>> setup.apsw
echo enable = column_metadata,rtree,fts5>> setup.apsw

%PYTHON% -m pip install . -vv --no-deps --no-build-isolation
if errorlevel 1 exit 1