# 🚀 **Dockerized Tomcat Web App**  
📅 **Date:** *2nd April 2025*  

---

## 🔥 **My Docker Learnings**  
- ✅ **Deployed** a web app (simple HTML page) manually in **Apache Tomcat**.  
- ✅ **Dockerized** the application using a **multi-stage Docker build**.  
- ✅ **Executed** the app inside a container like a pro! 🐳

---

## 🏗️ **Manual Setup of Apache Tomcat**  

🔧 Use this script to **manually set up** Tomcat on your Linux system:

### 📜 `setup_tomcat.sh`
```bash
#!/bin/bash

cd /opt
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.tar.gz
sudo tar -xvf apache-tomcat-9.0.102.tar.gz

cd /opt/apache-tomcat-9.0.102/webapps/manager/META-INF
sudo sed -i 's/127\.\d+\.\d+\.\d+|\[::1\]|0:0:0:0:0:0:0:1//g' context.xml

cd /opt/apache-tomcat-9.0.102/conf
sudo mv tomcat-users.xml tomcat-users_bkup_$(date +%d%m%Y).xml

sudo bash -c 'cat > tomcat-users.xml <<EOF
<?xml version="1.0" encoding="utf-8"?>
<tomcat-users>
    <role rolename="manager-gui"/>
    <user username="tomcat" password="tomcat" roles="manager-gui, manager-script, manager-status"/>
</tomcat-users>
EOF'

sudo sed -i 's/Connector port="8080"/Connector port="8090"/g' server.xml
sudo /opt/apache-tomcat-9.0.102/bin/startup.sh

echo "✅ Apache Tomcat 9 setup completed successfully!"
```

---

## 🐳 **Multi-Stage Dockerfile Setup**

### 📄 `Dockerfile`
```dockerfile
# 🏗️ Stage 1: Build the application using Maven
FROM maven AS buildstage
RUN mkdir /opt/mindcircuit15d
WORKDIR /opt/mindcircuit15d
COPY . .
RUN mvn clean install

# 🚀 Stage 2: Deploy using Tomcat
FROM tomcat
WORKDIR webapps
COPY --from=buildstage /opt/mindcircuit15d/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
```

---

## 🧪 **Running the App with Docker**

🚧 **Step 1: Build the Docker Image**
```bash
docker build -t my-tomcat-app .
```

🚀 **Step 2: Run the Container**
```bash
docker run -d -p 8080:8080 my-tomcat-app
```

🌐 **Now open your browser** and visit:  
👉 `http://localhost:8080` — your app is live!

---

## 🗂️ **Project Structure**
``
