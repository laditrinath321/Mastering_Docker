# Docker Learning - Volumes, Bind Mounts, and HTTPD on Amazon Linux

## 🚀 Overview
This repository contains practical examples and concepts related to Docker volumes, bind mounts, and building a custom Docker image for Apache HTTPD using Amazon Linux. It also demonstrates how to build and run a simple web application inside a container.

---

## 📌 Topics Covered
1. **Docker Volumes**
2. **Bind Mounts**
3. **Creating a Dockerfile for HTTPD (Amazon Linux as Base Image)**
4. **Building a Docker Image**
5. **Running an Application (index.html) Inside a Container**

---

## 🛠 Commands Used
### 🔹 Docker Volumes
```bash
# Listing Docker volumes
docker volume ls

# Inspecting a specific volume
docker volume inspect vol1

# Creating a Docker volume
docker volume create test

# Removing unused volumes
docker volume prune

# Removing specific volumes
docker volume rm vol1 vol2
```

### 🔹 Bind Mounts
```bash
# Running a container with a bind mount
docker run -it --name cont3 -v /opt:/app/logs amazonlinux
```

### 🔹 Building a Docker Image for HTTPD (Amazon Linux)
```bash
# Writing the Dockerfile
vim Dockerfile

# Dockerfile Content
cat Dockerfile

# Building the Docker image
docker build -t testimg:v1 -f Dockerfile .
```

### 🔹 Running the HTTPD Container
```bash
# Running a container with the built image
docker run -it --name ct1 -p 8082:80 testimg:v1
```

### 🔹 Publishing the Image to Docker Hub
```bash
# Tagging the image
docker build -t devopshubg333/batch15d:httpd_amazonlinux -f Dockerfile .

# Pushing the image to Docker Hub
docker push devopshubg333/batch15d:httpd_amazonlinux
```

---

## 📂 Project Structure
```
├── Dockerfile    # Custom Dockerfile for HTTPD (Amazon Linux)
├── index.html    # Simple HTML file for testing
└── README.md     # This documentation
```

---

## 🎯 Next Steps
✅ Experiment with additional configurations for HTTPD.  
✅ Automate the build and push process with CI/CD.  
✅ Deploy the containerized application using Kubernetes.  

---

## 💡 Author
**DevOps Enthusiast** | 🚀 Follow for more Docker and Kubernetes content!

---

🔥 If you find this useful, give it a ⭐ on GitHub! 😎