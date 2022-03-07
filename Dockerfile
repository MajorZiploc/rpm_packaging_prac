FROM fedora:latest
WORKDIR /workspace/app/

RUN dnf -y update

# This is likely not needed. It increases the image size by a large amount
RUN dnf -y groupinstall "Development Tools" "Development Libraries"

# For making rpms
RUN dnf install -y rpmdevtools rpmlint

# dev debugging container
RUN dnf install -y vim

EXPOSE 3000
