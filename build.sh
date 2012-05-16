!/bin/bash
make
make install
sudo killall sshd
sudo /home/mandar/ssh-mod/sbin/sshd
