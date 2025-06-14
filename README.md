# GAWC
Repository storing Numerous Dockerfiles for creating GitHub Action Worker Containers or GAWC's for Short

Stores a Base Dockerfile for creating the Base Linux GAWC. Once built it is used in Downstream Variants Language or Framework Configurations

This Repo is designed to work with another Nano-DNA-Studios project : GitHubAPICLI and GitHubSelfRunner

These tools utilize the GAWC's to run Workflows locally in a System that Replicates the Official Cloud version of GitHub Actions


# GAWC Variants
There are a few GAWC Variants currently hosted by the Repository

## Base Containers
The following base containers have basic packages installed and basic setup related to their Base OS Images, these are typically meant to be used to create more complex GAWC's at a later stage

GAWC-Base : A Base GAWC Image, has basic Linux Packages installed and the latest version of GitHub Actions Worker for Linux.

## Variants
The following containers all inherit from GAWC-Base, they each have installations and configurations for Languages or Frameworks. These are used for Automayted Builds for Projects using those Languages or Frameworks

GAWC-Dotnet : Has the latest version of Dotnet installed, used for C# or DotNet (.NET) Related Projects

GAWC-Node : Has the latest version of Node JS Installed, used for Node JS and Web Development Projects

GAWC-Python : Has the latest version of Python3 Installed, used for Python Related Projects