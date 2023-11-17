FROM ubuntu:latest

ARG USERNAME=VBADMIN
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
RUN apt-get update && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
# install python
RUN apt-get update && apt-get install -y python3 python3-dev build-essential
RUN apt-get install -y python3-venv
# RUN python3.9 -m venv /venv

RUN apt-get update -y && \
    apt-get install autotools-dev -y && \
    apt-get install autoconf -y && \
    apt-get install gperf -y && \
    apt-get install build-essential -y
    # apt-get install flex -y
RUN apt-get dist-upgrade -y && \
    apt-get install flex bison -y && \
    apt-get clean -y
    # apt-get install make -y


# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************


WORKDIR /app
# Change the ownership of the working directory to the non-root user "user"
RUN chown -R $USERNAME:$USERNAME /app

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
COPY . .
# # build configuration files
RUN cd /app/iverilog && sh ./autoconf.sh
# configure and install
USER root
RUN cd /app/iverilog && ./configure
RUN cd /app/iverilog && make
RUN cd /app/iverilog && make install


USER $USERNAME
# ENTRYPOINT [ "/usr/bin/bash" ]
CMD [ "echo", "Welcome!"]

