FROM ubuntu:18.04
MAINTAINER Sam<beeso018@umn.edu>
LABEL Description "https://github.com/UMN-EGGL/CustomGeneAnnotation"

# Install the necessary packages ontop of base ubuntu installation 
RUN apt-get -y update && apt-get install -y \
    curl \
	lsb-release \ 
    wget \
    git \
    gcc \
    build-essential \
	apt-transport-https \
    python3 \
    python3-dev \
    python3-pip \
    zlib1g-dev \
    libz-dev

#RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
#RUN python3 get-pip.py
RUN pip3 install ipython
RUN pip3 install snakemake
RUN pip3 install boto3
RUN git clone https://github.com/gpertea/stringtie 
WORKDIR /CustomGeneAnnotation
COPY . CustomGeneAnnotation
RUN cd CustomGeneAnnotation/stringtie; make release

# Build the Container with:
# $ docker build -t customgene:latest .

# Run the Container passing through a port to the host
# $ docker run -p 4000:4000 -it customgene

# Inside the container
# $ cd CustomGeneAnnotation
