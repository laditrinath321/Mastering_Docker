#!/bin/bash

# Step 1: Navigate to /opt directory
cd /opt

# Step 2: Download Apache Tomcat 9
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.tar.gz

# Step 3: Extract the downloaded archive
sudo tar -xvf apache-tomcat-9.0.102.tar.gz

# Step 4: Modify context.xml to allow remote access
cd /opt/apache-tomcat-9.0.102/webapps/manager/META-INF
sudo sed -i 's/127\.\d+\.\d+\.\d+|\[::1\]|0:0:0:0:0:0:0:1//g' context.xml

# Step 5: Backup the existing tomcat-users.xml
cd /opt/apache-tomcat-9.0.102/conf
sudo mv tomcat-users.xml tomcat-users_bkup_$(date +%d%m%Y).xml

# Step 6: Create a new tomcat-users.xml with manager credentials
sudo bash -c 'cat > tomcat-users.xml <<EOF
<?xml version="1.0" encoding="utf-8"?>
<tomcat-users>
    <role rolename="manager-gui"/>
    <user username="tomcat" password="tomcat" roles="manager-gui, manager-script, manager-status"/>
</tomcat-users>
EOF'

# Step 7: Modify server.xml to change default port from 8080 to 8090 (Optional)
sudo sed -i 's/Connector port="8080"/Connector port="8090"/g' server.xml

# Step 8: Start Apache Tomcat
sudo /opt/apache-tomcat-9.0.102/bin/startup.sh

echo "Apache Tomcat 9 setup completed successfully!"
