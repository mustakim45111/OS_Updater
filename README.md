# OS_Updater

OS_Updater is a cross-platform system update project.  
It contains scripts for Linux and Windows to automate system updates, clean unnecessary files, and maintain logs.

---

## Contents

- `linux_updater.sh` : Linux updater script
- `windows_updater.ps1` : Windows updater script

---

## Commands

- `Linux users`:

Allow script to run in current session:

    chmod +x linux_updater.sh

Run the Linux updater script:
    
    ./linux_updater.sh


- `Windows users`:

Allow script to run in current session:

    Set-ExecutionPolicy Bypass -Scope Process -Force

Run the Windows updater script:

    .\windows_updater.ps1

## Note:

Linux and Windows Notes:

Run the script according to your operating system ("linux_updater.sh" for Linux and "windows_updater.ps1" for Windows).

Windows PowerShell should be run as administrator (recommended).

Script usage notes:

Do not change the script name; use the original file name.

Recommended terminal:

Linux: Bash shell required

Windows: PowerShell 5.1 or higher