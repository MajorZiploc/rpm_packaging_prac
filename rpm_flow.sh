#!/usr/bin/env bash

# Create the rpmbuild area
rpmdev-setuptree;

mkdir hello-0.0.1

cat << EOF > hello-0.0.1/hello.sh
#!/bin/sh
echo "Hello world"
EOF

# Create a tar.gz of your source code
tar --create --file hello-0.0.1.tar.gz hello-0.0.1;
# Move tar.gz to SOURCES
cp -r hello-0.0.1.tar.gz ~/rpmbuild/SOURCES;

# NOTE: you need to edit the contents of this file if you run the rpmdev-newspec command
# Create a spec file for your project
# rpmdev-newspec hello;
# Move the spec file to SPECS
cp hello.spec ~/rpmbuild/SPECS;

# Check the value of spec params
rpm --eval '%{_bindir}'

# Check a spec file
rpmlint ~/rpmbuild/SPECS/hello.spec

# NOTE: use --target noarch before the -b. flags to make a build not dependent on the arch that is running rpmbuild
# Create a .src.rpm package
rpmbuild -bs ~/rpmbuild/SPECS/hello.spec

# Create a .rpm package
rpmbuild -bb ~/rpmbuild/SPECS/hello.spec

# Create both .src.rpm and .rpm packages
rpmbuild -ba ~/rpmbuild/SPECS/hello.spec


# NOTE: the RPMS package name may differ for you
# Install the built package
sudo dnf install ~/rpmbuild/RPMS/noarch/hello-0.0.1-1.fc35.noarch.rpm
# OR with rpm directly
sudo rpm -ivh ~/rpmbuild/RPMS/noarch/hello-0.0.1-1.fc35.noarch.rpm

# Verify the package was installed (should return package details)
rpm -qi hello

# View the changelog
rpm -q hello --changelog

# See whats in the package (shows the list of %files that the package installed)
rpm -ql hello

# call the package
hello.sh

# Uninstall the package
sudo dnf remove hello
# OR directly with rpm
sudo rpm --verbose --erase hello

