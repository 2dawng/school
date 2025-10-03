from ftplib import FTP


host = "127.0.0.1"
username = "dawng"
password = "1234"

import sys
from ftplib import all_errors

def debug_step(step):
    print(f"\n[DEBUG] {step}...")
    sys.stdout.flush()

try:
    debug_step("Creating FTP object")
    with FTP() as ftp:
        debug_step(f"Connecting to {host}:21 with timeout=10")
        ftp.connect(host, 21, timeout=10)
        debug_step(f"Logging in as {username}")
        ftp.login(username, password)
        debug_step("Setting passive mode ON")
        ftp.set_pasv(True)
        debug_step("Getting current directory")
        print("Current dir: ", ftp.pwd())

        debug_step("Uploading readme.txt as test.txt")
        with open("readme.txt", "rb") as f:
            ftp.storbinary("STOR test.txt", f)
        print("File uploaded successfully.")

        debug_step("Listing files in directory")
        ftp.retrlines("LIST")

        debug_step("Downloading test.txt")
        with open("test.txt", "wb") as f:
            ftp.retrbinary("RETR test.txt", f.write)
        print("File downloaded successfully.")
except all_errors as e:
    print(f"[ERROR] FTP error at step: {e.__class__.__name__}: {e}")
except Exception as e:
    print(f"[ERROR] General error: {e.__class__.__name__}: {e}")