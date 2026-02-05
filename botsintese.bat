@echo off
title BotSintese v2.0
echo ========================================
echo    BotSintese v2.0 - Sintese Processual
echo ========================================
echo.

python --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: Python nao encontrado!
    echo Instale Python 3.10+ em https://python.org
    pause
    exit /b 1
)

python "%~dp0botsintese.py" %*

if errorlevel 1 (
    echo.
    echo Ocorreu um erro. Verifique as mensagens acima.
    pause
)
