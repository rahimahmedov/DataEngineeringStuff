FROM hadoopbasenode:0.1-ra
MAINTAINER Rahim Ahmedov  <rahim.ahmedov@gmail.com>

## zeppelin related
ENV Z_VERSION="0.8.2"
ENV LOG_TAG="[ZEPPELIN_${Z_VERSION}]:" \
    Z_HOME="/zeppelin" \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

# should install conda first before numpy, matploylib since pip and python will be installed by conda
RUN echo "$LOG_TAG Install miniconda2 related packages" && \
    yum  -y --nogpg install bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion && \
    echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget  https://repo.continuum.io/miniconda/Miniconda2-4.2.12-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh
ENV PATH /opt/conda/bin:$PATH

RUN echo "$LOG_TAG Install python related packages" && \
    yum  -y --nogpg install python-dev python-pip gfortran  \
    # numerical/algebra packages
    libblas-dev libatlas-dev liblapack-dev  \
    # font, image for matplotlib
    libpng-dev libfreetype6-dev libxft-dev  \
    # for tkinter
    apython-tk libxml2-dev libxslt-dev zlib1g-dev && \
    conda config --set always_yes yes --set changeps1 no && \
    conda update -q conda && \
    conda info -a && \
    conda config --add channels conda-forge && \
    conda install -q numpy=1.13.3 pandas=0.21.1 matplotlib=2.1.1 pandasql=0.7.3 ipython=5.4.1 jupyter_client=5.1.0 ipykernel=4.7.0 bokeh=0.12.10 && \
    pip install -q scipy==0.18.0 ggplot==0.11.5 grpcio==1.8.2 bkzep==0.4.0


RUN echo "$LOG_TAG Download Zeppelin binary" && \
    wget -O /tmp/zeppelin-${Z_VERSION}-bin-all.tgz http://archive.apache.org/dist/zeppelin/zeppelin-${Z_VERSION}/zeppelin-${Z_VERSION}-bin-all.tgz && \
    tar -zxvf /tmp/zeppelin-${Z_VERSION}-bin-all.tgz && \
    rm -rf /tmp/zeppelin-${Z_VERSION}-bin-all.tgz && \
    mv /zeppelin-${Z_VERSION}-bin-all ${Z_HOME}

RUN yum clean all

EXPOSE 8080

ENTRYPOINT [ "/usr/bin/tini", "--" ]
WORKDIR ${Z_HOME}
CMD ["bin/zeppelin.sh"]