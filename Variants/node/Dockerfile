# Pull from Base GAWC Image
FROM ghcr.io/nano-dna-studios/gawc-base:latest

# Switch to root
USER root

# Install Node.js 20 and latest npm
RUN apt-get update && \
    apt-get install -y curl gnupg ca-certificates && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest && \
    ln -sf $(which node) /usr/local/bin/node && \
    ln -sf $(which npm) /usr/local/bin/npm && \
    apt-get clean

# Ensure all users have access to node and npm
ENV PATH="/usr/bin:/usr/local/bin:$PATH"

# Optional: ensure node and npm are accessible for GitWorker
RUN echo "export PATH=/usr/bin:/usr/local/bin:$PATH" >> /etc/profile \
    && echo "export PATH=/usr/bin:/usr/local/bin:$PATH" >> /etc/environment

# Set the Working Directory to the Action Runner Directory
WORKDIR /home/GitWorker/ActionRunner

# Switch to GitWorker
USER GitWorker

# Run the Worker
CMD ["/bin/sh", "-c", "./config.sh --url $REPO --token $TOKEN --name $RUNNERNAME --runnergroup $RUNNERGROUP --labels $RUNNERLABELS --work $RUNNERWORKDIR --unattended && ./run.sh"]