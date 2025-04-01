# Docker Learning - README

## 🚀 Docker Learning Journal - March 29, 2025

### 🛠️ Today’s Learning: Dockerfile & Building Docker Images

We learned how to build a Docker image using `docker commit` and `Dockerfile`. Below are various methods to **Dockerize a Python Flask application** using different base images.

---

## 🐍 Dockerizing a Sample Python Web Application

### **📌 Code: /opt/app.py**
```python
import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def main():
    return "Welcome to Batch15!"

@app.route('/how are you')
def hello():
    return 'I am good, how about you?'

if __name__ == "__main__":
    app.run()
```

### **🔧 Commands to Run the Flask App Without Docker**
```bash
yum update -y
yum install python3 python3-pip pip -y
pip install flask
FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
```

---

## 🐳 Dockerfile Variations

### **1️⃣ Using Amazon Linux**
```dockerfile
FROM amazonlinux
LABEL maintainer="MADHU KIRAN <devopstraininghub@gmail.com>"
RUN yum install python3 python3-pip pip -y
RUN pip install flask
COPY app.py /opt/app.py 
CMD FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
EXPOSE 8080
```

### **2️⃣ Using Ubuntu**
```dockerfile
FROM ubuntu:latest
LABEL maintainer="KIRAN <devopstraininghub@gmail.com>"
RUN apt-get update -y && apt-get install -y python3 python3-pip
RUN pip3 install flask
COPY app.py /opt/app.py
CMD FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
EXPOSE 8080
```

### **3️⃣ Using Python Base Image**
```dockerfile
FROM python:3.9
COPY app.py /opt/app.py
ENV FLASK_APP=/opt/app.py
EXPOSE 8080
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
```

---

## 📖 Deep Dive into Dockerfile Instructions

| Instruction | Description |
|------------|-------------|
| `FROM` | Defines base image |
| `RUN` | Executes commands during image build |
| `COPY` | Copies files from local machine to container |
| `ADD` | Like COPY, but supports remote URLs & archives |
| `CMD` | Default command for container execution (can be overridden) |
| `ENTRYPOINT` | Defines executable container behavior (cannot be overridden) |
| `WORKDIR` | Sets working directory inside container |
| `LABEL` | Adds metadata to the image |
| `EXPOSE` | Documents the port the container will use |
| `ARG` | Defines build-time variables |
| `ENV` | Defines environment variables |

### **RUN vs CMD vs ENTRYPOINT**
- `RUN`: Executes during **image build**.
- `CMD`: Default command during **container creation** (can be overridden).
- `ENTRYPOINT`: Defines container execution behavior (appended, not overridden).

Example:
```dockerfile
FROM amazonlinux 
RUN yum install iputils -y
ENTRYPOINT ["ping"]
CMD ["www.google.com"]
```

---

## ❓ Important Docker Interview Questions & Answers

### **1️⃣ What is Docker, and why is it used?**
**Answer:** Docker is a containerization platform that allows developers to package applications and their dependencies into a container, ensuring consistency across different environments.

### **2️⃣ What is the difference between Docker Image and Container?**
**Answer:**
- A **Docker Image** is a blueprint (template) used to create containers.
- A **Docker Container** is a running instance of an image.

### **3️⃣ How is `RUN` different from `CMD` in Dockerfile?**
**Answer:**
- `RUN` executes commands **during image build** (e.g., installing software).
- `CMD` specifies **default execution command** when the container starts.

### **4️⃣ What is the difference between `COPY` and `ADD`?**
**Answer:**
- `COPY` copies local files to the container.
- `ADD` does everything COPY does but also extracts archives and downloads remote files.

### **5️⃣ What is the role of `ENTRYPOINT`?**
**Answer:** `ENTRYPOINT` allows the container to run as an executable. Unlike `CMD`, it cannot be completely overridden.

### **6️⃣ What is the purpose of `EXPOSE` in Dockerfile?**
**Answer:** `EXPOSE` documents the port the container listens on, but it doesn’t actually open the port.

### **7️⃣ How to remove unused Docker images and containers?**
**Answer:**
```bash
docker image prune -a   # Remove all unused images
docker container prune  # Remove all stopped containers
```

### **8️⃣ How do you run a container in detached mode?**
**Answer:**
```bash
docker run -d -p 8080:8080 mycontainer
```

### **9️⃣ What is the difference between `docker stop` and `docker kill`?**
**Answer:**
- `docker stop`: Gracefully stops the container (allows cleanup).
- `docker kill`: Forcefully stops the container immediately.

### **🔟 How do you persist data in Docker containers?**
**Answer:** Use volumes or bind mounts.
```bash
docker run -v /host/path:/container/path mycontainer
```

---

## 🎯 Conclusion
This README.md serves as a **quick reference guide** for Docker concepts, `Dockerfile` instructions, and **essential interview questions**. Keep practicing and experimenting with different configurations!

🔥 **Happy Dockerizing!** 🐳
