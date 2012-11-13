#
# Installation steps for ReviewBoard on a clean CentOS 5 box
#

# TODO: Find a way to programatically determine the python version
python_version=2.6
reviewboard_branch=1.6
reviewboard_patch=.9
reviewboard_version=$(reviewboard_branch)$(reviewboard_patch)

# TODO: Add targets for mod_ssl and openldap
all: setup-tools py-headers memcached mysql-server mysql-python mod_ssl openldap reviewboard perforce
all: setup-tools mysql-server reviewboard perforce

setup-tools: .setup-tools-done
.setup-tools-done:
	@echo Installing python setup tools
	@yum install python-setuptools
	@easy_install -U setuptools
	@touch $@

py-headers: .py-headers-done
.py-headers-done:
	@echo Installing python headers
	@yum install python-devel
	@touch $@

/etc/yum.repos.d/epel.repo :
	@echo This should already be installed
	#@rpm -Uvh http://mirrors.servercentral.net/fedora/epel/6/x86_64/epel-release-6-7.noarch.rpm

memcached: .memcached-done
.memcached-done: /etc/yum.repos.d/epel.repo
	@yum install memcached
	@yum install python-memcached
	@touch $@

mysql-server: .mysql-server-done
.mysql-server-done:
	@yum install mysql-server
	@touch $@

mysql-python: .mysql-python-done
.mysql-python-done: .setup-tools-done 
	@yum install mysql-devel
	@easy_install mysql-python
	@touch $@

reviewboard: .reviewboard-done
.reviewboard-done: .setup-tools-done .py-headers-done .memcached-done .mysql-python-done
	@easy_install -U http://downloads.reviewboard.org/releases/ReviewBoard/$(reviewboard_branch)/ReviewBoard-$(reviewboard_version)-py$(python_version).egg 	
	@touch $@

perforce: .perforce-done
.perforce-done: .setup-tools-done
	@echo Taken from the perforce target
	@echo Installing P4Python
	@easy_install P4PythonInstaller
	@touch $@

help:
	@echo '-- Settings --'
	@echo Python Version $(python_version)
	@echo ReviewBoard Version $(reviewboard_version)
	@echo
	@echo '-- Targets --'
	@echo all
	@echo setup-tools
	@echo py-headers
	@echo memcached
	@echo mysql-python
	@echo reviewboard
	@echo perforce
