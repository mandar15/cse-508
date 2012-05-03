!/bin/bash
make
make install
sudo killall sshd
sudo /home/grub/school/ns/ssh2/sbin/sshd
