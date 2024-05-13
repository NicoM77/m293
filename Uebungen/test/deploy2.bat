@echo off
setlocal

REM FTP-Zugangsdaten
set "ftp_host=m293.bplaced.net"
set "ftp_username=m293"
set "ftp_password=6lxvxAkhfz3UrycM"

REM Verbindung zum FTP-Server herstellen
echo open %ftp_host%> ftpcmd.dat
echo %ftp_username%>> ftpcmd.dat
echo %ftp_password%>> ftpcmd.dat
echo lcd %cd%>> ftpcmd.dat
echo cd www>> ftpcmd.dat
echo prompt>> ftpcmd.dat
echo mdelete *.*>> ftpcmd.dat
echo cd ..>> ftpcmd.dat
echo rmdir www>> ftpcmd.dat
echo mkdir www>> ftpcmd.dat
echo binary>> ftpcmd.dat

REM FTP-Befehle ausführen
ftp -n -s:ftpcmd.dat

REM Lokales Verzeichnis auswählen
set "local_directory="
for /F "delims=" %%I in ('powershell -noprofile "(new-object -COM 'Shell.Application').BrowseForFolder(0,'Select a folder:',0x00000020,0).Self.Path"') do set "local_directory=%%I"
if not defined local_directory exit /b

REM Upload des Verzeichnisses
echo open %ftp_host%> ftpcmd.dat
echo %ftp_username%>> ftpcmd.dat
echo %ftp_password%>> ftpcmd.dat
echo lcd %local_directory%>> ftpcmd.dat
echo cd www>> ftpcmd.dat
echo mput *.*>> ftpcmd.dat
echo cd ..>> ftpcmd.dat
echo quit>> ftpcmd.dat

REM FTP-Befehle ausführen
ftp -n -s:ftpcmd.dat

REM Temporäre Datei löschen
del ftpcmd.dat

endlocal
