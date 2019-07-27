# 基于centos基础镜像
FROM centos:7.2.1511

# 安装常用命令
RUN yum install -y curl \
    && yum install -y wget \
    && yum install -y zip \
    && yum install -y unzip \
    && yum install -y tar \
    && yum install -y lsof \
    && yum install -y git \
    && yum install -y which


#设置工作目录
WORKDIR /home

# 拷贝JDK安装包到容器中
COPY file/jdk-8u211-linux-x64.rpm /home
# 安装JDK
RUN rpm --rebuilddb && yum install -y jdk-8u211-linux-x64.rpm \
    && java -version
# 设置JAVA_HOME环境变量
ENV JAVA_HOME /usr/java/jdk1.8.0_211-amd64

# kotlin编译环境
RUN curl -s https://get.sdkman.io | bash
RUN chmod a+x "$HOME/.sdkman/bin/sdkman-init.sh"
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install kotlin


# 拷贝android tools到容器中
COPY file/sdk-tools-linux-4333796.zip /home
# 解压android tools
RUN mkdir -p /opt/app/android-sdk
RUN unzip -d /opt/app/android-sdk sdk-tools-linux-4333796.zip

# 安装需要的platforms和build-tools版本
RUN yes | /opt/app/android-sdk/tools/bin/sdkmanager "platforms;android-28"
RUN yes | /opt/app/android-sdk/tools/bin/sdkmanager "build-tools;28.0.3"

# 设置JAVA_HOME环境变量
ENV ANDROID_HOME /opt/app/android-sdk