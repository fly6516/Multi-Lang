# Multi-Lang

multi-lang-dev

# 编译

# 创建并启用 Buildx 构建器
docker buildx create --use

# 启动 QEMU 支持的多架构模拟器
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

# 构建并推送多架构 Docker 镜像
# 创建并启用 Buildx 构建器
docker buildx create --use

# 启动 QEMU 支持的多架构模拟器
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

# 构建并推送多架构 Docker 镜像