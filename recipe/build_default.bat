REM Specifying the XEUS_PYTHONHOME_RELPATH to the general prefix.

cmake -G "NMake Makefiles" ^
  -D CMAKE_BUILD_TYPE=Release ^
  -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -D PYTHON_EXECUTABLE=%PYTHON% ^
  %SRC_DIR%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

REM Copying kernelspec to the general prefix for Jupyter to pick it up.

md %PREFIX%\share\jupyter\kernels\xrobot
xcopy %LIBRARY_PREFIX%\share\jupyter\kernels\xrobot %PREFIX%\share\jupyter\kernels\xrobot /F /Y
