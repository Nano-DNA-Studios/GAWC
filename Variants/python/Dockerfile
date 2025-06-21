# Pull from Base GAWC Image
FROM ghcr.io/nano-dna-studios/gawc-base:latest

# Define Python Version
ENV PYTHON_VERSION=3.13

# Switch to root
USER root

# Set the Working Directory
WORKDIR /home/GitWorker

# Install Python according to the version defined
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python${PYTHON_VERSION} python3-pip && \
    ln -sf /usr/bin/python${PYTHON_VERSION} /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Give GitWorker access to Python
RUN chown -R GitWorker:GitWorker /usr/bin/python${PYTHON_VERSION} /usr/bin/pip3

# Switch to GitWorker
USER GitWorker

# Set the Working Directory to the Action Runner Directory
WORKDIR /home/GitWorker/ActionRunner

# Run the Worker
CMD ["/bin/sh", "-c", "./config.sh --url $REPO --token $TOKEN --name $RUNNERNAME --runnergroup $RUNNERGROUP --labels $RUNNERLABELS --work $RUNNERWORKDIR --unattended && ./run.sh" ]