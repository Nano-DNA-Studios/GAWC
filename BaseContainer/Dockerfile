# Use Ubuntu 20.04 Image
FROM ubuntu:20.04

# Define GitHub Action Worker Version
ENV WORKERVERSION="2.323.0"
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and Auto Configure Timezone
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    tar \
    bash \
    expect \
    sudo \
    git \
    jq && \
    add-apt-repository -y ppa:git-core/ppa && \
    apt-get update && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Docker properly
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install GitHub CLI properly
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
    dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | \
    tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
    apt-get update && \
    apt-get install -y gh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Add a new GitWorker User and add to Sudoers
RUN useradd -ms /bin/bash GitWorker && \
usermod -aG sudo GitWorker && echo "GitWorker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Go into the Directory
WORKDIR /home/GitWorker/ActionRunner

# Download and Extract the GitHub Action Runner
RUN curl -o GitHubActionWorker-x64-${WORKERVERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${WORKERVERSION}/actions-runner-linux-x64-${WORKERVERSION}.tar.gz && \
tar -xzf ./GitHubActionWorker-x64-${WORKERVERSION}.tar.gz && \
rm -rf GitHubActionWorker-x64-${WORKERVERSION}.tar.gz

# Install the Dependencies
RUN cd bin && chmod +x installdependencies.sh && ./installdependencies.sh

# Set the Permissions
RUN chmod -R 775 /home/GitWorker/ActionRunner && \
    chown -R root:root /home/GitWorker/ActionRunner && \
    mkdir -p /home/GitWorker/ActionRunner/_diag && \
    chown -R GitWorker:GitWorker /home/GitWorker/ActionRunner && \
    chown -R GitWorker:GitWorker /usr/share && \
    chmod -R 775 /home/GitWorker/ActionRunner && \
    touch /home/GitWorker/ActionRunner/.env && chmod 664 /home/GitWorker/ActionRunner/.env

# Copy RunWorker.sh
COPY . .

# Change the to the GitWorker User
USER GitWorker

# Run the Worker
CMD ["/bin/sh", "-c", "./config.sh --url $REPO --token $TOKEN --name $RUNNERNAME --runnergroup $RUNNERGROUP --labels \"$RUNNERLABELS\" --work $RUNNERWORKDIR --unattended && ./run.sh"]