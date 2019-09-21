# netbackup
This is a very simple script that can watch dropped files from network devices on a central server and push them to a git repo, optionally performing modifications.


# Ubiquiti example
* Create the netbackup user and allow SSH password-based logins ([it's very hard to use keys on UBNT](https://community.ui.com/questions/Using-ssh-keys-for-commit-archive/d3e946d6-ce35-4ebd-9591-a74f43dbd900)), you can use [ChrootDirectory to ./archive](https://askubuntu.com/a/134442) and ForceCommand internal-sftp, [rush](https://puszcza.gnu.org.ua/software/rush/manual/html_node/scp.html) or rssh. Have inotify-tools installed.
* Create ./repo and ./archive, connect ./repo to your git repository (things like GitLab have deploy keys for this).
* Setup a systemd service (can be global) with a custom script.
* [Set up your device to push configs to ./archive](https://help.ubnt.com/hc/en-us/articles/204960084-EdgeRouter-Archiving-and-Managing-the-Configuration-Files#2).
* The script can check if this file matches a given format and modify it if needed, for example renaming it to fit your style
* See profit in your git repo.
* If the script fails or anything bad happens you will still find configs in ./archive.
