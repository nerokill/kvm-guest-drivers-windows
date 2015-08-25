@echo off
: Param1 - Win10 | Win8 | Win7
: Param2 - x86|x64
: Param3 - file name
 
if "%2"=="x64" set %%2=amd64

if /i "%1"=="Win7" goto :checkarch
if /i "%1"=="Win8" goto :checkarch
if /i "%1"=="Win10" goto :checkarch
goto :printerr
:checkarch
if /i "%2"=="x86" goto :makeinstall
if /i "%2"=="x64" goto :makeinstall
:printerr
echo wrong parameters (1)%1 (2)%2 (3)%3
pause
goto :eof

:makeinstall
set INST_OS=%1
set INST_ARC=%2
set FILE_NAME=%3

if /i "%INST_ARC%"=="x86" goto :startcopy

set INST_ARC=amd64

:startcopy
set EXE_PATH_AND_NAME=Release\%~2\%FILE_NAME%.exe
set PDB_PATH_AND_NAME=Release\%~2\%FILE_NAME%.pdb

echo makeinstall %1 %2 %3
mkdir ..\Install\%INST_OS%\%INST_ARC%
del /Q ..\Install\%INST_OS%\%INST_ARC%\%FILE_NAME%.*
copy /Y %EXE_PATH_AND_NAME% ..\Install\%INST_OS%\%INST_ARC%
copy /Y %PDB_PATH_AND_NAME% ..\Install\%INST_OS%\%INST_ARC%

set INST_OS=
set INST_ARC=
set FILE_NAME=
set EXE_PATH_AND_NAME=
set PDB_PATH_AND_NAME=


