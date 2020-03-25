FROM fedora:31
LABEL maintainer "Darcy Westfall@cloudpractice.ca"
ENV STI_SCRIPTS_PATH=/usr/libexec/s2i \
    SOURCE_DIR=/opt/juno
LABEL io.k8s.description="Builder image for compiling and testing juno" \
      io.k8s.display-name="juno-builder}" \
      io.openshift.s2i.scripts-url=image://${STI_SCRIPTS_PATH}
COPY ./s2i/bin/ ${STI_SCRIPTS_PATH}
RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel tomcat tomcat-lib maven git
RUN mkdir ${SOURCE_DIR} && chmod 0777 ${SOURCE_DIR}
RUN chmod g=u /etc/passwd
WORKDIR ${SOURCE_DIR}
USER 1001

CMD ["/usr/libexec/s2i/usage"]
