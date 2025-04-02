# 🚀 Automating Web Deployment with Dockerized Tomcat & Jenkins

## 🔥 Real-World Problem
**"Manual deployments are time-consuming, error-prone, and not scalable."**

### Solution: **Automated CI/CD Pipeline using Docker, Tomcat & Jenkins**
✅ Run **Tomcat inside Docker** for containerized web hosting
✅ Deploy **Jenkins inside Docker** for automated CI/CD
✅ Automate **HTML page deployment via Jenkins pipeline**

---

## 🏗️ Project Overview
### **Tech Stack**: 
- 🐳 **Docker** (Containerization)
- ☕ **Tomcat** (Web Server)
- 🔧 **Jenkins** (CI/CD)
- 🌍 **Amazon Linux** (Base OS for Tomcat container)

### **Step 1: Provision EC2 Instance**
```bash
# Launch EC2 Instance (Amazon Linux 2) with t2.medium
```

### **Step 2: Create & Run Tomcat Docker Container**
#### **Dockerfile for Tomcat**
```dockerfile
FROM amazonlinux:latest
LABEL maintainer="madhu <devopstraininghub@gmail.com>"
RUN yum install java -y && yum install tar gzip -y
WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.tar.gz .
RUN tar -xvf apache-tomcat-9.0.102.tar.gz && rm apache-tomcat-9.0.102.tar.gz
RUN sed -i 's/"127\\.\\d+\\.\\d+\\.\\d+|::1|0:0:0:0:0:0:0:1"/".*"/g' /opt/apache-tomcat-9.0.102/webapps/manager/META-INF/context.xml
CMD ["/opt/apache-tomcat-9.0.102/bin/catalina.sh", "run"]
EXPOSE 8080
```
#### **Build & Run**
```bash
docker build -t my-tomcat .
docker run -d -p 8080:8080 my-tomcat
```

### **Step 3: Run Jenkins in a Docker Container**
```bash
docker pull jenkins/jenkins:lts
docker run -d -p 8081:8080 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

### **Step 4: Automate Deployment via Jenkins Pipeline**
**Create a Jenkinsfile for CI/CD:**
```groovy
pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/your-repo/sample-web-app.git'
            }
        }
        stage('Deploy to Tomcat') {
            steps {
                sh 'cp -r * /opt/apache-tomcat-9.0.102/webapps/'
            }
        }
    }
}
```

### **🎯 Expected Outcome**
- **Jenkins pulls the latest HTML files** from GitHub
- **Deploys them automatically to Tomcat Server**
- **No manual intervention needed** for new deployments!

---

## 🏛️ **GitHub Repository Structure**
```bash
📂 dockerized-tomcat-jenkins
 ├── 📂 jenkins_pipeline
 │   ├── Jenkinsfile
 │   ├── deployment_script.sh
 │
 ├── 📂 tomcat_docker
 │   ├── Dockerfile.tomcat
 │   ├── README.md
 │   ├── start_tomcat.sh
 │
 ├── 📂 web_app
 │   ├── index.html
 │   ├── styles.css
 │
 ├── 📜 README.md
```
---

## 📌 **Key Takeaways**
✔️ **Containers** ensure consistency across environments
✔️ **Automated CI/CD** reduces deployment errors
✔️ **Tomcat & Jenkins integration** streamlines web hosting

📢 **Star the repo if this helped!** ⭐
