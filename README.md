## Purpose

Learn how to package rpms

## Resources

Used this guide:
- https://www.redhat.com/sysadmin/create-rpm-package

Extra information:
- https://opensource.com/article/18/9/how-build-rpm-packages

## Development Commands
- Source the just.bash while at the root of this project:
> . ./just.bash

## Workflow
- Start the docker container
> just_container_run

- Connect to docker container (All rpm workflows must happen inside the container, such as the rpm_flow.sh script)
> just_container_connect

- Stop the docker container
> just_container_stop

