# Multi-Lang

multi-lang-dev

# 编译

# 创建并启用 Buildx 构建器
docker buildx create --use

# 启动 QEMU 支持的多架构模拟器
docker run --rm --privileged fly6516.synology.me:8080/multiarch/qemu-user-static --reset -p yes

# 构建并推送多架构 Docker 镜像
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/ppc64le,linux/s390x,linux/mips64le -t fly6516.synology.me:8080/multilang:latest . --push