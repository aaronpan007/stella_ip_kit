@echo off
setlocal

set "TARGET=%~1"
if "%TARGET%"=="" (
    powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"
) else (
    powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1" "%TARGET%"
)
