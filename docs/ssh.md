ssh-copy-id -i $HOME/.ssh/id_rsa.pub vivek@server1.cyberciti.biz

sudo vi /etc/ssh/sshd_config

Find ChallengeResponseAuthentication and set to no:

ChallengeResponseAuthentication no
Next, find PasswordAuthentication set to no too:

PasswordAuthentication no
Search for UsePAM and set to no, too:

UsePAM no --> problem with systemctl over ssh!! Set it to yes instead and make sure both ChallengeResponseAuthentication and PasswordAuthentication is set to no
Finally look for PermitRootLogin and set it to no too:

PermitRootLogin no
PermitRootLogin prohibit-password
Save and close the file. Reload or restart the ssh server on Linux:
/etc/init.d/ssh reload

We can use the systemctl command for systemd based Linux distros:
sudo systemctl reload ssh

One can use the following on RHEL/CentOS Linux:
/etc/init.d/sshd reload

Again for systemd based distro such as CentOS/RHEL 7.x or the latest version of Fedora, try the following commands to restart (reload) sshd:
sudo systemctl reload sshd

Step 5 – Verification
Try to login as root:
ssh root@server1.cyberciti.biz
Permission denied (publickey).

Try to login with password only:
ssh vivek@server1.cyberciti.biz -o PubkeyAuthentication=no
Permission denied (publickey).

Do check the following manual pages using the man command:

man sshd_config
man ssh

TODO

UsePAM no or yes???
AuthenticationMethods publickey
