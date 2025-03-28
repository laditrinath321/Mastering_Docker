Here's the **README.md** for creating a Docker image with **Nginx**. 🚀  

---

## 🐳 **Dockerizing Nginx - Step-by-Step Guide**  

### 📌 **Introduction**  
This guide walks you through creating a **custom Nginx Docker image**, running a container, and serving a static website.  

---

### ⚡ **1. Prerequisites**  
✔ Install **Docker**  
✔ Basic knowledge of **Nginx & Dockerfile**  
✔ A simple **HTML website** (optional)  

---

### 🏗 **2. Create a Project Directory**  
```bash
mkdir nginx-docker && cd nginx-docker
```

---

### 📄 **3. Create a Custom HTML Page (Optional)**  
```bash
mkdir html
echo "<h1>Welcome to My Nginx Docker!</h1>" > html/index.html
```

---

### 📝 **4. Create a Dockerfile**  
Create a `Dockerfile` in the `nginx-docker` directory:  

```Dockerfile
# Use the official Nginx base image
FROM nginx:latest

# Copy custom HTML files to the default Nginx directory
COPY html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
```

---

### 🔨 **5. Build the Docker Image**  
```bash
docker build -t my-nginx .
```
💡 This command creates a Docker image named **my-nginx**.  

---

### 🚀 **6. Run the Nginx Container**  
```bash
docker run -d -p 8080:80 --name nginx-container my-nginx
```
✔ Now visit **http://localhost:8080** in your browser to see your custom Nginx page!  

---

### 📌 **7. Push Image to Docker Hub (Optional)**  
```bash
docker tag my-nginx <your-dockerhub-username>/my-nginx:v1
docker push <your-dockerhub-username>/my-nginx:v1
```

---

