# Pull from Base GAWC Image
FROM ghcr.io/nano-dna-studios/gawc-base:latest

# Define the Dotnet Version
ENV DOTNET_VERSION=8.0.415

# Switch to root
USER root

# Set the Working Directory
WORKDIR /home/GitWorker

# Install .NET SDK
RUN curl -fsSL https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh | bash -s -- --install-dir /usr/share/dotnet --channel LTS --version ${DOTNET_VERSION}

# Set environment variables so dotnet is accessible
ENV DOTNET_ROOT="/usr/share/dotnet"
ENV PATH="/usr/share/dotnet:$PATH"

# Ensure DOTNET is in global environment
RUN echo "export DOTNET_ROOT=/usr/share/dotnet" >> /etc/profile
RUN echo "export PATH=$PATH:/usr/share/dotnet" >> /etc/profile
RUN echo "export DOTNET_ROOT=/usr/share/dotnet" >> /etc/environment
RUN echo "export PATH=$PATH:/usr/share/dotnet" >> /etc/environment

# Give GitWorker access to .NET directory
RUN chown -R GitWorker:GitWorker /usr/share/dotnet

# Switch to GitWorker
USER GitWorker

# Set the Working Directory to the Action Runner Directory
WORKDIR /home/GitWorker/ActionRunner

# Run the Worker
CMD ["/bin/sh", "-c", "./config.sh --url $REPO --token $TOKEN --name $RUNNERNAME --runnergroup $RUNNERGROUP --labels $RUNNERLABELS --work $RUNNERWORKDIR --unattended && ./run.sh"]