@echo off
setlocal

pyinstaller pipeline.py --name pipeline --onefile --icon=4797421.ico

REM Bestimme den aktuellen Verzeichnispfad
set "current_dir=%~dp0"

REM Bestimme den Pfad zum "dist"-Verzeichnis
set "dist_dir=%current_dir%dist"

REM Überprüfe, ob das "dist"-Verzeichnis existiert
if not exist "%dist_dir%" (
    echo Das "dist"-Verzeichnis existiert nicht.
    exit /b
)

REM Durchsuche das "dist"-Verzeichnis nach der .exe-Datei und der pipeline.spec-Datei
set "exe_file="
set "spec_file="
for %%i in ("%dist_dir%\*.exe") do (
    set "exe_file=%%~fi"
)
for %%i in ("%dist_dir%\pipeline.spec") do (
    set "spec_file=%%~fi"
)

REM Überprüfe, ob eine .exe-Datei gefunden wurde
if not defined exe_file (
    echo Keine .exe-Datei im "dist"-Verzeichnis gefunden.
    exit /b
)

REM Kopiere die .exe-Datei in das aktuelle Verzeichnis
copy /Y "%exe_file%" "%current_dir%"
echo .exe-Datei erfolgreich kopiert.

REM Lösche den "dist"-, "build"- und "pipeline.spec"-Ordner
set "build_dir=%current_dir%build"
if exist "%build_dir%" (
    rd /s /q "%build_dir%"
    echo "build"-Ordner erfolgreich gelöscht.
)

rd /s /q "%dist_dir%"
echo "dist"-Ordner erfolgreich gelöscht.

if defined spec_file (
    del /f /q "%spec_file%"
    echo pipeline.spec erfolgreich gelöscht.
)
del pipeline.spec

endlocal
pause