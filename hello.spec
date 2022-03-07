Name:           hello
Version:        0.0.1
Release:        1%{?dist}
Summary:        A simple hello world script
BuildArch:      noarch

License:        GPL
Source0:        %{name}-%{version}.tar.gz

Requires:       bash

%description
A demo RPM build

#
%prep
%setup -q

# steps needed before %install
# %pre

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{_bindir}
cp %{name}.sh $RPM_BUILD_ROOT/%{_bindir}
chmod 755 $RPM_BUILD_ROOT/%{_bindir}/%{name}.sh

# For compiling the package if required
# %build

# steps needed after installing files
# %post

# Performed after the install process to remove temp files (after the rpm build process)
%clean
rm -rf $RPM_BUILD_ROOT

# Listing of files that this package installs, used by the uninstall process for removing this package
%files
%{_bindir}/%{name}.sh
# Can also be used to specify permissions and locations of files like so:
# %attr(0744, root, root) /usr/local/bin/*
# %attr(0644, root, root) /usr/local/share/utils/*

# steps after the uninstall process to cleanup steps performed in %post
# %postun


%changelog
* Mon Mar 07 2022 root
-
