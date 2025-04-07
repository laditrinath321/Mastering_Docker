# 🐳 Docker Quiz & Interview Questions Cheat Sheet

Welcome to the **Docker Quiz & Interview Questions Guide**! This is your ultimate reference to ace your Docker fundamentals and intermediate concepts. Below, you'll find **multiple-choice questions with answers**, **key architectural concepts**, **frequently asked interview questions**, and **real-world Docker usage tips**. Perfect for DevOps engineers, cloud professionals, and developers!

---

## 📘 Section 1: MCQs with Answers & Explanations

### 1. What command is used to build a Docker image from a Dockerfile?
**✅ Answer:** `B. docker build`
- **Explanation:** `docker build` is used to create a Docker image from a Dockerfile and context (e.g., code).

### 2. What is the purpose of Docker Hub?
**✅ Answer:** `B. To provide cloud storage for Docker images`
- **Explanation:** Docker Hub is a cloud-based registry for sharing and storing Docker images.

### 3. How can you stop all running Docker containers?
**✅ Answer:** `B. docker stop $(docker ps -q)`
- **Explanation:** This command stops all running containers by using command substitution to get container IDs.

### 4. How can you remove a Docker container?
**✅ Answer:** `C. docker rm <container_id>`

### 5. What is the purpose of the `-d` flag in the `docker run` command?
**✅ Answer:** `B. Detaches the container and runs it in the background`

### 6. What is the purpose of the `docker pull` command?
**✅ Answer:** `C. Downloads a Docker image from a registry`

### 7. How can you list all Docker images on your system?
**✅ Answer:** `B. docker images`

### 8. What does the command `docker ps` display?
**✅ Answer:** `A. Running containers`

### 9. How can you run a command inside an existing Docker container?
**✅ Answer:** `a) docker exec`

### 10. Which of the following commands logs you into Docker Hub from the CLI?
**✅ Answer:** `a) docker login`

### 11. Which Docker command shows the history and intermediate layers of an image?
**✅ Answer:** `c) docker history <imagename>`

### 12. Which command is used to view the logs of a running Docker container?
**✅ Answer:** `a) docker logs CONTAINER_ID/NAME`

### 13. How do you map a host port to the container port?
**✅ Answer:** `B) docker run -p 8000:80 imagename`

### 14. Which sentence describes Docker best?
**✅ Answer:** `B) Build once, run everywhere`

### 15. Docker main features are:
**✅ Answer:** `C) Lightweight, Scalable, Fast`

### 16. Docker registry is used for:
**✅ Answer:** `Storing Docker images`

### 17. Which Dockerfile instruction is used to install binaries?
**✅ Answer:** `RUN`

### 18. Which instruction informs Docker that the container listens on the specified network ports at runtime?
**✅ Answer:** `EXPOSE`

### 19. In which language is Docker written?
**✅ Answer:** `Go`

### 20. How can you copy files from the local machine to the Docker image in a Dockerfile?
**✅ Answer:** `B. COPY`

### 21. Which instruction is used to set the base image in a Dockerfile?
**✅ Answer:** `A. FROM`

### 22. What is the difference between a Docker image and a Docker container?
**✅ Answer:** `A) A Docker image is a blueprint; a container is a running instance.`

### 23. What does the `.` (dot) represent in the Docker build command?
**✅ Answer:** `B) It indicates the current directory as the build context.`

### 24. What is the use of Docker stats?
**✅ Answer:** `A) To view the resource usage of a Docker container`

### 25. Security best practices for Dockerfiles:
**✅ Answer:** `All the above`

---

## 💡 Section 2: Interview Questions & Answers

### 1. Key components of Docker Architecture:
- **Docker Client**
- **Docker Daemon (dockerd)**
- **Docker Images**
- **Docker Containers**
- **Docker Registry (Docker Hub)**
- **Docker Objects: Volumes, Networks, Plugins**

### 2. Docker Container vs Virtual Machine:
- **Docker:** Shares host OS, lightweight, fast startup.
- **VM:** Has full OS, heavier, slower to boot.

### 3. Linux features essential for containerization:
- **Namespaces** (Process, Network, PID, Mount, IPC)
- **Control Groups (cgroups)**
- **UnionFS** (e.g., OverlayFS)

### 4. Docker Image vs Container:
- **Image:** Blueprint.
- **Container:** Running instance.

### 5. Can you delete an image while a container is running?
- ❌ No, you must stop the container first.

### 6. Docker vs Docker Swarm:
- **Docker:** Container engine.
- **Swarm:** Orchestration tool for clustering containers.

### 7. Command to create a Docker container:
```bash
docker create <image_name>
```

### 8. Check IP address of a container:
```bash
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id>
```

### 9. Lifecycle of a Docker container:
`Create → Start → Run → Pause/Stop → Restart/Remove`

### 10. Delete all unused containers, networks, images:
```bash
docker system prune -a --volumes
```

### 11. Docker Volumes:
```bash
docker volume create myvol
```
- **Advantages:** Persistence, sharing data, managed by Docker.

### 12. Save a running container to a tar file:
```bash
docker export <container_id> > container.tar
```

### 13. Import tar as image:
```bash
docker import container.tar imagename:tag
```

### 14. Convert image to tar:
```bash
docker save -o image.tar imagename:tag
```

### 15. Common Dockerfile Instructions:
- `FROM`, `COPY`, `RUN`, `CMD`, `EXPOSE`, `ENV`, `ENTRYPOINT`, `WORKDIR`

### 16. COPY vs ADD:
- `COPY`: Simple file copy.
- `ADD`: Can fetch from URLs and auto-extract archives.

### 17. Use of EXPOSE:
- Documents ports, helpful for Docker Compose & orchestration.

### 18. CMD vs ENTRYPOINT:
- **CMD:** Default args.
- **ENTRYPOINT:** Fixed executable.
- ✅ Can use both together.

### 19. ENV vs ARG:
- `ENV`: Persistent.
- `ARG`: Only during build time.

### 20. Dangling Images:
- Unused images without tags, can be deleted to save space.

### 21. Multiple RUN instructions?
- ✅ Good for layer management.
- ❌ Too many RUNs increase image size; combine wisely.

### 22. Save Docker Images:
- Local registry, private/public Docker Hub, or tar backup.

### 23. Use private registry on-prem?
- ✅ Yes, via Harbor, Docker Registry, etc.

### 24. Docker Hub vs Docker Registry:
- **Hub:** SaaS public registry.
- **Registry:** On-prem/private registry.

### 25. Pass secrets securely:
- Use Docker Secrets (in Swarm)
- Or environment variables (not recommended for sensitive data)
- 🔐 Use external secrets manager like HashiCorp Vault, AWS Secrets Manager

---

## ✅ Tips for Better Docker Usage
- Use `.dockerignore` to optimize builds
- Use multi-stage builds to reduce image size
- Avoid running containers as root
- Regularly scan images for vulnerabilities

---

> ⭐ Star this repo and use it as your quick Docker reference before interviews or when brushing up your DevOps skills!

---

Made with 💙 by [Your Name] | DevOps | Cloud | Docker | Kubernetes |

Feel free to contribute! 🚀

