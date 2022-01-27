# Create SSH key and set authorized keys
ssh-keygen -t ed25519 -f /root/.ssh/id_ed25519 -P ""
echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config

# Start SSH service
sysrc sshd_enable="YES"
service sshd start

# Setup bash
chsh -s /usr/local/bin/bash
echo 'PS1="\[\e[32m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\]:[\[\e[35m\]\W\[\e[m\]]: "' >> /etc/profile
