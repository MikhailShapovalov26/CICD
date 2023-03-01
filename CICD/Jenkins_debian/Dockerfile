FROM debian:unstable-slim
RUN apt-get update \
    && apt-get install -y locales \
            openjdk-11-jdk \
            default-jre \
            gnupg2 \
            apt-transport-https \
            wget \
            curl \ 
            openssh-server \
            git \
            ca-certificates \
            gnupg \
            lsb-release \
	&& localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8 \
    && curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null \
    && echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null \
    && apt-get update \
    && apt-get install -y jenkins \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/apk/cache
ENV LANG ru_RU.utf8
VOLUME [ "/sys/fs/cgroup" ]
CMD ["jenkins"]
# ENTRYPOINT ["sleep", "infinity" ]