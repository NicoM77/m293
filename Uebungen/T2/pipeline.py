import os
import ftplib
from tkinter import Tk, filedialog

def select_folder():
    """ Öffnet ein Dialogfenster, um einen Ordner auszuwählen. """
    root = Tk()
    root.withdraw()  # Versteckt das Hauptfenster von Tk
    folder_selected = filedialog.askdirectory()
    root.destroy()
    return folder_selected

def ftp_upload_directory(ftp, local_path, remote_path):
    """ Lädt den gesamten Inhalt eines lokalen Verzeichnisses in ein entferntes Verzeichnis hoch. """
    try:
        ftp.cwd(remote_path)
    except ftplib.error_perm:
        # Verzeichnis existiert nicht, versuche es zu erstellen
        ftp.mkd(remote_path)
        ftp.cwd(remote_path)
    
    for item in os.listdir(local_path):
        local_item_path = os.path.join(local_path, item)
        if os.path.isfile(local_item_path):
            with open(local_item_path, 'rb') as file:
                ftp.storbinary(f'STOR {item}', file)
        elif os.path.isdir(local_item_path):
            ftp_upload_directory(ftp, local_item_path, item)

def main():
    # FTP-Zugangsdaten
    import os
import ftplib
from tkinter import Tk, filedialog

def select_folder():
    """ Öffnet ein Dialogfenster, um einen Ordner auszuwählen. """
    root = Tk()
    root.withdraw()  # Versteckt das Hauptfenster von Tk
    folder_selected = filedialog.askdirectory()
    root.destroy()
    return folder_selected

def ftp_upload_directory(ftp, local_path, remote_path):
    """ Lädt den gesamten Inhalt eines lokalen Verzeichnisses in ein entferntes Verzeichnis hoch. """
    try:
        ftp.cwd(remote_path)
    except ftplib.error_perm:
        # Verzeichnis existiert nicht, versuche es zu erstellen
        ftp.mkd(remote_path)
        ftp.cwd(remote_path)
    
    for item in os.listdir(local_path):
        local_item_path = os.path.join(local_path, item)
        if os.path.isfile(local_item_path):
            with open(local_item_path, 'rb') as file:
                ftp.storbinary(f'STOR {item}', file)
        elif os.path.isdir(local_item_path):
            new_remote_path = f"{remote_path}/{item}"
            try:
                ftp.mkd(new_remote_path)
            except ftplib.error_perm:
                pass  # Verzeichnis existiert bereits
            ftp_upload_directory(ftp, local_item_path, new_remote_path)

def empty_ftp_directory(ftp, directory):
    """ Löscht den gesamten Inhalt eines Verzeichnisses auf dem FTP-Server. """
    try:
        ftp.cwd(directory)
        files = ftp.nlst()
        for file in files:
            try:
                ftp.delete(file)
            except Exception as e:
                continue
        ftp.cwd('..')  # Zurück zum übergeordneten Verzeichnis
    except ftplib.error_perm as e:
        return

def main():
    # FTP-Zugangsdaten
    ftp_host = 'm293.bplaced.net'
    ftp_username = 'm293'
    ftp_password = '6lxvxAkhfz3UrycM'
    
    # Verbindung zum FTP-Server herstellen
    ftp = ftplib.FTP(ftp_host, ftp_username, ftp_password)
    
    # Prüfen, ob der Ordner 'www' existiert und ihn entsprechend behandeln
    try:
        ftp.cwd('www')
        empty_ftp_directory(ftp, '/www')  # Den Inhalt des Verzeichnisses löschen
        ftp.cwd('/')  # Gehe zurück zum Wurzelverzeichnis
        ftp.rmd('www')  # Entferne den Ordner
    except ftplib.error_perm as e:
        return
    
    ftp.mkd('www')  # Erstelle den Ordner neu
    
    # Ordnerauswahl durch den Benutzer
    local_directory = select_folder()
    if local_directory:
        ftp_upload_directory(ftp, local_directory, 'www')
        return
    else:
        return

    # FTP-Verbindung schließen
    ftp.quit()

if __name__ == '__main__':
    main()

