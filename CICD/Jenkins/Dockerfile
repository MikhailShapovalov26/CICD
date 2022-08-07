FROM centos:7
RUN yum update -y && yum install -y java-11-openjdk wget curl \
    && wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo \
    && rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key \
    && yum install -y jenkins openssh-server
RUN yum install -y git http
RUN yum install -y yum-utils device-mapper-persistent-data lvm2 
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y epel-release && yum install -y ansible
RUN yum install -y docker-ce docker-ce-cli containerd.io
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]