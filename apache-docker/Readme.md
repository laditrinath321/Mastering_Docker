# 🚀 Custom Apache HTTPD Docker Image

## 📌 Overview
This project demonstrates how to create a **custom Apache HTTPD Docker image** with a personalized web page. The containerized Apache server will serve a simple HTML page.

## 🔥 Features
- Uses **official Apache HTTPD** image.
- Includes a **custom index.html** page.
- Runs on **port 8080** (mapped to container's port 80).
- Fully containerized web server.

## 📂 Project Structure
```
apache-docker/
│── Dockerfile          # Docker configuration file
│── index.html          # Custom webpage content
│── README.md           # Project documentation
```

## 🛠 Setup & Usage
### **1️⃣ Clone the Repository**
```bash
git clone <your-repo-url>
cd apache-docker
```

### **2️⃣ Build the Docker Image**
```bash
docker build -t my-apache-server .
```

### **3️⃣ Run the Container**
```bash
docker run -d -p 8080:80 my-apache-server
```

### **4️⃣ Access the Web Page**
Open your browser and go to:  
🔗 **http://localhost:8080**

## 📜 Dockerfile Explanation
```dockerfile
# Use official Apache HTTPD image
FROM httpd:2.4

# Copy custom index.html to Apache's document root
COPY index.html /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
```

## 🎯 Next Steps
- Modify `index.html` to create a more advanced webpage.
- Push this image to **Docker Hub** using `docker push`.
- Deploy it on **AWS EC2** using Docker.

## 📢 Contribute & Share
If you find this useful, **star this repo ⭐** and share it on **LinkedIn**! 🚀