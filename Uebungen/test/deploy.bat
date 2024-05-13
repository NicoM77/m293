@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: FTP-Server-Details
SET SERVER=m293.bplaced.net
SET USERNAME=m293
SET PASSWORD=6lxvxAkhfz3UrycM
SET REMOTEDIR=/www
@echo off
setlocal

:: SSH-Server-Details
set SERVER=ssh.example.com
set USERNAME=meinBenutzername
set REMOTEDIR=/www

:: Verzeichnis, in dem die Dateien liegen, die hochgeladen werden sollen
set LOCALDIR=C:\Pfad\zum\lokalen\Verzeichnis\*

:: Löschen der entfernten Dateien (optional, muss über SSH erfolgen)
:: Dieses Kommando entfernt alle Dateien im Zielverzeichnis auf dem Server
:: Hinweis: Das ist ein riskanter Befehl, der mit Vorsicht zu verwenden ist!
plink -i "%PASSWORD%" %USERNAME%@%SERVER% "rm -rf %REMOTEDIR%/*"

:: Dateien hochladen
for %%I in (%LOCALDIR%) do (
    pscp -i "%PASSWORD%" "%%I" %USERNAME%@%SERVER%:%REMOTEDIR%/
)

echo Alle Dateien wurden hochgeladen.
endlocal
