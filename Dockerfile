FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
    wget \
    build-essential \
    zip && \
    wget http://www.mathematik.uni-ulm.de/users/ag/yaze-ag/devel/yaze-ag-2.40.5_with_keytrans.tar.gz && \
    tar -zxvf yaze-ag-2.40.5_with_keytrans.tar.gz && \
    rm -f yaze-ag-2.40.5_with_keytrans.tar.gz

WORKDIR /yaze-ag-2.40.5_with_keytrans

RUN cp Makefile_linux_64_intel_corei7 Makefile && \
    make && \
    make install

WORKDIR /home/yaze

RUN wget http://www.cpm.z80.de/download/cpm22-b.zip \
         http://www.amy.hi-ho.ne.jp/officetetsu/sbc/sbc/devel/MON80.zip && \
    unzip cpm22-b.zip && \
    unzip MON80.zip && \
    rm cpm22-b.zip MON80.zip && \
    yaze -h || true && \
    cp LOAD.COM PIP.COM MON80.ASM ~/cpm/disksort



