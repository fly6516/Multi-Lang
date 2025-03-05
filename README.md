
# Multi-Lang / 多语言项目

[English Version](#english-version) | [中文版本](#中文版本)

---

## English Version
<a id="english-version"></a>

### Overview
Multi-Lang is a Docker multi-architecture build project that demonstrates how to build and push Docker images for various platforms. This project leverages Docker Buildx and QEMU for cross-platform builds.

### Prerequisites
- Docker (with Buildx support)
- QEMU for multi-architecture emulation

### Build Instructions

1. **Create and Enable Buildx Builder**  
   Create a new Buildx builder instance and switch to it:
   ```bash
   docker buildx create --use
   ```

2. **Start QEMU Multi-Architecture Emulator**  
   Run the following command to start QEMU with multi-arch support:
   ```bash
   docker run --rm --privileged fly6516.synology.me:8080/multiarch/qemu-user-static --reset -p yes
   ```

3. **Build and Push Multi-Arch Docker Image**  
   Build your Docker image for multiple architectures and push it to the registry:
   ```bash
   docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/ppc64le,linux/s390x,linux/mips64le -t fly6516.synology.me:8080/multilang:latest . --push
   ```

### Usage
After pushing the image, you can deploy it on the supported platforms using your preferred orchestration tools.

---

[中文版本](#中文版本)

---

## 中文版本
<a id="中文版本"></a>

### 概述
Multi-Lang 是一个 Docker 多架构构建项目，展示了如何利用 Docker Buildx 与 QEMU 构建并推送支持多种平台的 Docker 镜像。

### 前提条件
- 安装支持 Buildx 的 Docker
- 配置 QEMU 以支持多架构模拟

### 编译步骤

1. **创建并启用 Buildx 构建器**  
   创建一个新的 Buildx 构建器实例并切换到该实例：
   ```bash
   docker buildx create --use
   ```

2. **启动 QEMU 多架构模拟器**  
   执行以下命令以启动 QEMU 多架构支持：
   ```bash
   docker run --rm --privileged fly6516.synology.me:8080/multiarch/qemu-user-static --reset -p yes
   ```

3. **构建并推送多架构 Docker 镜像**  
   针对多个平台构建 Docker 镜像，并将其推送到镜像仓库：
   ```bash
   docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/ppc64le,linux/s390x,linux/mips64le -t fly6516.synology.me:8080/multilang:latest . --push
   ```

### 使用方法
镜像推送成功后，您可以使用您偏好的编排工具在各个平台上进行部署。

---

[English Version](#english-version)
```
