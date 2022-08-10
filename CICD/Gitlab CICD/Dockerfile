FROM centos:7
RUN yum update -y; yum clean all
RUN yum install -y \
                    make \
                    wget \
                    tar \
                    gcc \
                    openssl-devel \
                    bzip2-devel \
                    libffi-devel \
                    zlib-devel \
                    xz-devel 1>/dev/null \
       && cd /tmp/ \
       && wget https://www.python.org/ftp/python/3.7.11/Python-3.7.11.tgz  1>/dev/null \
       && tar xzf Python-3.7.11.tgz 1>/dev/null \
       && cd Python-3.7.11 \
       && ./configure --enable-optimizations 1>/dev/null \
       && make altinstall 1>/dev/null \
       && ln -sfn /usr/local/bin/python3.7 /usr/bin/python3.7 \
       && ln -sfn /usr/local/bin/pip3.7 /usr/bin/pip3.7 \
       && cd /tmp && rm -rf Python*
RUN pip3.7 install flask flask-jsonpify flask-restful \
    && mkdir /mnt/python_api
WORKDIR /mnt/python_api
COPY python_api/python-api.py /mnt/python_api
EXPOSE 80
RUN echo /etc/hosts >> ipa && cat ipa && ls -la 
ENTRYPOINT ["python3.7", "/mnt/python_api/python-api.py" ]
