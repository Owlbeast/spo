@echo off

set firstpar=%1
set secondpar=%2

:parameters
if "%firstpar%" == "/help" (echo To start type laba1.bat Path_to_folder Path_to_output_file & exit /b)

if not exist "%firstpar%" (set /p firstpar=Insert first parameter & goto parameters)
if not exist "%secondpar%" (set /p secondpar=Insert second parameter & goto parameters)

call :count %firstpar%

exit /b

:count
@echo off

set /a filecount=0
for %%f in ("%*"\*) do (set /a filecount+=1)
echo %* - %filecount% files >> %secondpar%
for /d %%f in ("%*"\*) do (if exist %%f (call :count %%f))

exit /b