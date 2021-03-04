#!/bin/bash
echo "Welcome to Aviatrix OCI Testing Flex VM" >> /etc/motd
echo "" >> /etc/motd
echo "" >> /etc/motd
echo "Run instantclient.sh to install sqlplus" >> /etc/motd
echo "" >> /etc/motd
yum install iperf3 -y

echo "#!/bin/bash" > /home/opc/instantclient.sh
echo "unzip /tmp/instantclient-basiclite-linux.x64-19.8.0.0.0dbru.zip" >> /home/opc/instantclient.sh
echo "unzip /tmp/instantclient-sqlplus-linux.x64-19.8.0.0.0dbru.zip" >> /home/opc/instantclient.sh

echo "export LD_LIBRARY_PATH=/tmp/instantclient_19_8" >> /home/opc/.bash_profile
echo "export PATH=$PATH:/tmp/instantclient_19_8" >> /home/opc/.bash_profile

chmod +x /home/opc/instantclient.sh
chown opc:opc /home/opc/.bash_profile
