# netbackup
This is a very simple script that can watch dropped files from network devices on a central server and push them to a git repo, optionally performing modifications.


# Ubiquiti example
* Create the netbackup user and allow SSH password-based logins (it's very hard to use keys on UBNT), you can use ChrootDirectory to ./archive (and ForceCommand internal-sftp, rush or rssh). Have inotify-tools installed.
* Create ./repo and ./archive, connect ./repo to your git repository (things like GitLab have deploy keys for this)
* Setup a systemd service (can be global) with a custom script
* Set up your device to push configs to ./archive
* The script can check if this file matches a given format and modify it if needed, for example renaming it to fit your style
* See profit in your git repo
* If the script fails or anything bad happens you will still find configs in ./archive
