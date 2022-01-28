# Create SSH key and set authorized keys
ssh-keygen -t ed25519 -f /root/.ssh/id_ed25519 -P ""
echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config
curl https://gist.githubusercontent.com/memoryleak/7cb22281ad91269c74d942af6c72e07b/raw/047d27ff8e274fcde5a3e3ced9cebb3a100c440b/authorized_keys -so /root/.ssh/authorized_keys

# Start SSH service
sysrc sshd_enable="YES"
service sshd start

# Setup bash
chsh -s /usr/local/bin/bash
echo 'PS1="\[\e[32m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\]:[\[\e[35m\]\W\[\e[m\]]: "' > /usr/local/etc/profile
