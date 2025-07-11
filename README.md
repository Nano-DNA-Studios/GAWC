# GAWC
Repository storing Numerous Dockerfiles for creating GitHub Action Worker Containers or GAWC's for Short.

These Docker Containers are used for Local Automated GitHub Actions Workflows.

The Docker Images created and published by this Repo are designed to work out of the Box with [GitHubAPICLI](https://github.com/Nano-DNA-Studios/GitHubAPICLI) and [GitHubSelfRunner](https://github.com/Nano-DNA-Studios/GitHubSelfRunner).

There is a Base Image called GAWC-Base, this is used by downstream variants to Install Dependencies and Configure the Container to work with Programming Languages and Frameworks for Automated Workflows.

# Requirements
- Docker is Installed
- 2+ GB of Storage

# Using the Containers
While being Configured and Developed to be used with [GitHubAPICLI](https://github.com/Nano-DNA-Studios/GitHubAPICLI) and [GitHubSelfRunner](https://github.com/Nano-DNA-Studios/GitHubSelfRunner), the Containers can still be used locally with ease. To run any of them locally without the tools you can use the following command in your Terminal.

**Replace anything within Curly Braces ({value}) with a Value.**

## Downloading Containers
Downloading any of the Containers within this Repository can be done by using the following command.

```bash
docker pull ghcr.io/nano-dna-studios/{gawc-name}:{version}
```

Example :

```bash
docker pull ghcr.io/nano-dna-studios/gawc-base:0.1.0
```

## Basic Command

```bash
docker run --name {name-of-container} -e REPO={link-to-repo} -e TOKEN={github-action-worker-token} -e RUNNERGROUP={group} -e RUNNERNAME={name} -e RUNNERLABELS={runner-labels} -e RUNNERWORKDIR={workdir} ghcr.io/nano-dna-studios/{gawc-name}:{version}
```

Example : 

```bash
docker run --name gawc-runner -e REPO=https://github.com/Nano-DNA-Studios/GAWC -e TOKEN={token-given-by-github} -e RUNNERGROUP="" -e RUNNERNAME=GAWC_TEST -e RUNNERLABELS="" -e RUNNERWORKDIR=WorkDir ghcr.io/nano-dna-studios/gawc-base:0.1.0
```

## Variables

### Name
---
Name of the Docker Container, Must be unique, used to identify the Docker Container on the local device using ``docker ps``

### Docker Image
---
GAWC Docker Image to use for the Runner, this is the last Value in the Command, replace the Name and Version according to your needs.

GAWC-Name must be all **Lower-Case** with no spaces.

GAWC-Name can be set to ``gawc-base`` if you want a basic fresh image, if you want a Specific Language or Framework, consult with the list below (#GAWC Variants).

Version of the Image can be set to ``:latest`` if you want the latest version.

### REPO
---
Link to the Repository the GAWC will be registered to.

### TOKEN
---
The GitHub Action Worker Token that GitHub Will give you when you want to create a new Worker.

New Tokens can be Dynamically requested through the GitHub API by using the following HTTP Request. Must add Username/UserAgent and GitHub Personal Access Token (PAT) to the Web Request for Authorization purposes.

```
https://api.github.com/repos/{ownerName}/{repositoryName}/actions/runners/registration-token
```

### RUNNERGROUP
---
Name of the Runner Group the GAWC will belong to. Method of Organizing many GitHub Action Workers into closely related Clusters for large automation Tasks. Typically can be left empty.

### RUNNERNAME
---
Unique Display Name of the GAWC. Visible on GitHub Website when looking at Registered Runners. Used to Identify and Differentiate GAWC's.

### RUNNERLABELS
---
List of Unique Labels to Categorize GitHub Action Worker. 

These Labels can be used in Workflows to Filter and Specifiy a Specific GAWC to Run a Workflow. 

For Example, if you use many of the GAWC's at the same time, you can add the Framwork or Language they use as a Label, and then tell the Workflow to Target Runners with that Tag.

This is done in the Following way.

```yaml
jobs:
  setup:
    runs-on: ["self-hosted", "{custom-label-here}"] # <-- Input other Custom Labels Here for Targetting
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4
```

Default labels are : self-hosted, {operating-system} (Linux), {computer-architecture} (X64)

### RUNNERWORKDIR
---
The Root Work Directory the GAWC uses, All Workflows that run using the GAWC will Clone their Repositories to this Directory.

Default Value is the same as where the Executable is held : WorkDir

# GAWC Variants
There are a few GAWC Variants currently hosted by the Repository.

## Base Containers
The following base containers have basic packages installed and basic setup related to their Base OS Images, these are typically meant to be used to create more complex GAWC's at a later stage.

### GAWC-Base
---
A Base GAWC Image, has basic Linux Packages installed and the latest version of GitHub Actions Worker for Linux.

## Variants
The following containers all inherit from GAWC-Base, they each have installations and configurations for Languages or Frameworks. These are used for Automayted Builds for Projects using those Languages or Frameworks.

### GAWC-Dotnet
---
Has the latest version of Dotnet installed, used for C# or DotNet (.NET) Related Projects.

### GAWC-Node
---
Has the latest version of Node JS Installed, used for Node JS and Web Development Projects.

### GAWC-Python
---
Has the latest version of Python3 Installed, used for Python Related Projects.

# Support
For Additional Support, Contact MrDNAlex through the email : ``Mr.DNAlex.2003@gmail.com``.