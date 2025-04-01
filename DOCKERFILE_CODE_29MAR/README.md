# 🚀 Docker Learning - Interactive README

## 📅 Today's Learning: Dockerfile & Building Docker Images
📌 *Date: March 29, 2025*

Hey there, Docker enthusiast! 🎉 Today, we dive into **Dockerfiles** and how to build Docker images like a pro! Let's get started! 🐳

---

## 🛠️ Dockerizing a Python Web Application

### 📝 Sample Code: `app.py`
```python
import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def main():
    return "Welcome to Batch15! 🎊"

@app.route('/how are you')
def hello():
    return 'I am good, how about you? 😊'

if __name__ == "__main__":
    app.run()
```

🔹 **Let's run this manually first!** 🚀
```bash
yum update -y
yum install python3 python3-pip pip -y
pip install flask
FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
```

---

## 🏗️ Creating a Dockerfile

### **Option 1: Amazon Linux**
```dockerfile
FROM amazonlinux
LABEL maintainer="MADHU KIRAN <devopstraininghub@gmail.com>"
RUN yum install python3 python3-pip pip -y
RUN pip install flask
COPY app.py /opt/app.py 
CMD FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
EXPOSE 8080
```
📌 *Use this if you're working with Amazon Linux!*

### **Option 2: Ubuntu**
```dockerfile
FROM ubuntu:latest
LABEL maintainer="KIRAN <devopstraininghub@gmail.com>"
RUN apt-get update -y && apt-get install -y python3 python3-pip
RUN pip3 install flask
COPY app.py /opt/app.py
CMD FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
EXPOSE 8080
```
💡 *Perfect for Ubuntu lovers!* ❤️

### **Option 3: Python Base Image**
```dockerfile
FROM python:3.9
COPY app.py /opt/app.py
ENV FLASK_APP=/opt/app.py
EXPOSE 8080
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
```
✅ *Best choice for Python-based projects!* 🐍

---

## 🔍 Deep Dive into Dockerfile Instructions

| Instruction | What it Does |
|------------|-------------|
| `FROM` | Sets the base image 🎨 |
| `RUN` | Executes commands at build time 🏗️ |
| `COPY` | Copies local files to the container 📂 |
| `ADD` | Like COPY, but supports remote URLs & archives 🌍 |
| `CMD` | Default command for the container (can be overridden) 🚀 |
| `ENTRYPOINT` | Defines how the container should run (not overridden) 🎯 |
| `WORKDIR` | Sets the working directory 🏢 |
| `LABEL` | Adds metadata 🏷️ |
| `EXPOSE` | Documents ports used by the container 🔌 |
| `ARG` | Defines build-time variables 🔢 |
| `ENV` | Defines environment variables 🌎 |

💡 **Quick Tip:** `RUN` is used during **image building**, while `CMD` is used when **container starts**! 🚀

---

## 🎯 Must-Know Docker Interview Questions & Answers

🔹 **1. What is Docker, and why should we use it?**
> 🏆 *Docker is a containerization platform that helps developers package apps with all dependencies. It ensures consistency across different environments.*

🔹 **2. What is the difference between Docker Image and Container?**
> 🖼️ *Docker Image = Blueprint 📜*
> 🏗️ *Docker Container = Running Instance 🚀*

🔹 **3. How is `RUN` different from `CMD` in Dockerfile?**
> - `RUN` is executed **during image build** (used for installing dependencies). 📦
> - `CMD` is executed **when the container starts** (used for running apps). 🎬

🔹 **4. What’s the difference between `COPY` and `ADD`?**
> - `COPY` only supports local files. 🏠
> - `ADD` supports remote URLs and extracts compressed files. 📦

🔹 **5. What is `ENTRYPOINT`, and how is it different from `CMD`?**
> `ENTRYPOINT` ensures the container runs as an executable, while `CMD` provides default arguments (which can be overridden). 🏗️

🔹 **6. What does `EXPOSE` do in a Dockerfile?**
> `EXPOSE` documents the port that the container listens on, but it doesn't actually open it! 🚪

🔹 **7. How can you remove unused Docker images and containers?**
```bash
docker image prune -a   # Remove all unused images
docker container prune  # Remove all stopped containers
```
🎯 *Pro Tip: Use these commands often to free up space!* 🚀

🔹 **8. How do you run a container in detached mode?**
```bash
docker run -d -p 8080:8080 mycontainer
```
✅ *Detached mode runs the container in the background! 🏃‍♂️*

🔹 **9. What’s the difference between `docker stop` and `docker kill`?**
> 🚦 `docker stop` gracefully stops the container, allowing cleanup.
> ❌ `docker kill` immediately terminates it without cleanup.

🔹 **10. How do you persist data in Docker containers?**
> Use **Volumes or Bind Mounts**! 📂
```bash
docker run -v /host/path:/container/path mycontainer
```

---

## 🎉 Final Thoughts
This README is your **one-stop guide** for learning **Docker concepts, commands, and interview questions**! 🚀

✅ **Bookmark this file and keep learning!** 🔥

👨‍💻 **Happy Dockerizing!** 🐳 🎊
