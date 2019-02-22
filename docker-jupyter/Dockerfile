FROM ubuntu:latest
MAINTAINER  becivells <becivells@gmail.com> 
RUN apt-get  -y update   &&  apt-get  -y upgrade && apt-get install  -y bzip2 curl wget 

ENV ANACONDA_VERSION 2-4.0.0-Linux-x86_64 
ENV INSTALL_PATH  /opt/anaconda2

RUN cd /tmp/ && wget https://repo.continuum.io/archive/Anaconda${ANACONDA_VERSION}.sh 


RUN  mkdir /jupyter && cd /tmp/ && bash Anaconda${ANACONDA_VERSION}.sh -b -p ${INSTALL_PATH} \
 && ${INSTALL_PATH}/bin/pip install -U pip \
#fix Anacondabug 2-4.0.0-Linux-x86_64
 &&curl https://bootstrap.pypa.io/ez_setup.py -o - | ${INSTALL_PATH}/bin/python \
 &&${INSTALL_PATH}/bin/pip install -U notebook \ 
 && ${INSTALL_PATH}/bin/jupyter notebook --generate-config \
 && echo "c.NotebookApp.ip='*'" >>  ~/.jupyter/jupyter_notebook_config.py \
 && echo "c.NotebookApp.password = u'sha1:eddad9e86314:25592c60bb5b83ebd9ad249af485a292120043be'">>  ~/.jupyter/jupyter_notebook_config.py \
 && echo "c.NotebookApp.open_browser = False" >>  ~/.jupyter/jupyter_notebook_config.py \
 && echo "c.NotebookApp.port =8888"    >>  ~/.jupyter/jupyter_notebook_config.py \
 && echo "c.NotebookApp.notebook_dir ='/jupyter'" >>  ~/.jupyter/jupyter_notebook_config.py \
 && rm -rf  /tmp/* &&  apt-get autoclean && ln -s ${INSTALL_PATH}  /opt/anaconda

EXPOSE 8888

CMD ["/opt/anaconda/bin/jupyter","notebook"]



