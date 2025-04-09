# 🚀 DevOps Learning - 08 APR 2025 | Trinath Ladi

## 📌 Topics Covered
- ✅ **SonarQube (Static Code Analysis)**
- ✅ **Trivy (Container Security Scan)**
- ✅ **CI/CD with Jenkins**
- ✅ **Docker & Image Security**

---

## 🧪 SonarQube Setup & Scan

### 🔧 Maven Build
```bash
mvn clean install
```

### 🔍 SonarQube Scan Command
```bash
mvn sonar:sonar \
  -Dsonar.host.url=http://ec2-18-234-233-210.compute-1.amazonaws.com:9000 \
  -Dsonar.login=squ_fb5fdb469f3cbfe23a88554ae7cd3ba7e3c29263
```

### 🧪 Jenkinsfile Stage (Sonar)
```groovy
stage('sonarqube scan') {
    steps {
        echo 'Scanning project'
        sh 'ls -ltrh'
        sh '''
            mvn sonar:sonar \
              -Dsonar.host.url=http://ec2-18-234-233-210.compute-1.amazonaws.com:9000 \
              -Dsonar.login=squ_fb5fdb469f3cbfe23a88554ae7cd3ba7e3c29263
        '''
    }
}
```

---

## 🔐 Trivy - Image & Filesystem Scanner

### 📥 Installation (RPM for RHEL/CentOS)
```bash
rpm -ivh https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.rpm
```

### 🐳 Scan Docker Image
```bash
trivy image <image_name>
```

### 📁 Scan Filesystem
```bash
trivy fs <directory_path>
```

### 📄 Output in JSON Format
```bash
trivy image <image_name> --format json --output results.json
```

### 🚨 Scan for High/Critical
```bash
trivy image <image_name> --severity HIGH,CRITICAL
```

---

## 🧰 Jenkins Installation (Ubuntu)
```bash
sudo apt update
sudo apt install -y openjdk-17-jdk

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install -y jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkins
```

---

## 🛠 Docker Setup (Ubuntu)
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo \"${UBUNTU_CODENAME:-$VERSION_CODENAME}\") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

---

## 🔄 CI/CD Pipeline (Jenkinsfile)
```groovy
pipeline {
    agent any

    tools {
        maven 'Maven_3.9.9'
    }

    stages {

        stage('CLONE GITHUB CODE') {
            steps {
                echo 'In this stage code will be cloned'
                git branch: 'main', url: 'https://github.com/devopstraininghub/mindcircuit15d.git'
            }
        }

        stage('SONARQUBE SCAN') {
            steps {
                echo 'Scanning project with SonarQube'
                sh '''
                  mvn sonar:sonar \
                    -Dsonar.host.url=http://54.196.131.171:9000/ \
                    -Dsonar.login=squ_53a360a5b17e012b147c32860a8d223d30449f76
                '''
            }
        }

        stage('BUILD') {
            steps {
                echo 'Building project'
                sh 'mvn clean install'
            }
        }

        stage('DOCKER BUILD') {
            steps {
                sh 'docker build -t devopshubg333/mc14:v1 .'
            }
        }

        stage('TRIVY SCAN') {
            steps {
                sh 'trivy image --format json --output results.json devopshubg333/mc14:v1'
            }
        }

        stage('PUSH TO DOCKER HUB') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                        sh 'docker login -u devopshubg333 -p ${dockerhub}'
                        sh 'docker push devopshubg333/mc14:v1'
                    }
                }
            }
        }

        stage('DEPLOY TO TOMCAT') {
            steps {
                echo 'Deploying WAR to Tomcat'
                deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://ec2-52-23-168-78.compute-1.amazonaws.com:8082/')],
                    contextPath: 'mcapp',
                    war: '**/*.war'
            }
        }

    }
}
```

---

## 🧠 DevOps Best Practices: Secrets Handling
- 🛡️ Prefer not to pass secrets in image
- 🔐 Use:
  - Docker Secrets (Swarm)
  - Docker Compose Secrets
  - AWS Secrets Manager
  - HashiCorp Vault

---

## 📦 Docker Image & Container Archive
```bash
# Export running container
docker export <container_id> > mycontainer.tar

# Save Docker image
docker save myimage:tag -o myimage.tar

# Import TAR as image
docker import < mycontainer.tar
```

---

> ✅ **Keep Learning. Keep Automating. Keep Securing.**

