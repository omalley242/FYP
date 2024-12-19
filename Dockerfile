#use the latest version of ubuntu LTS
FROM ubuntu:latest

#Download the required admin and script tools
RUN apt-get update && \
    apt-get -y install sudo && \
    apt-get -y install adduser && \
    apt-get -y install bc

#Add a docker user with no password and the gecos flag set to skip finger print information
RUN adduser --disabled-password --gecos '' docker

#Make the docker user have sudo permissions
RUN adduser docker sudo

#Any one within the sudo group can run any command without password authenication
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#Change into the docker user
USER docker

#Download the required build tools to build llvm and clang
RUN sudo apt -y install ninja-build && \
    sudo apt -y install cmake && \
    sudo apt -y install lld && \
    sudo apt -y install clang

#Copy the source files from the repo into opt dir
COPY ./source /opt/
