# LAMP Cookbook for Try Chef

This repository will help you to setup a Chef development environment in your local machine, and try to use the provided cookbook to provision a LAMP server

## Installation
### VirtualBox

- Download the VirtualBox installation package depends on your platform from [official website](https://www.virtualbox.org/wiki/Downloads) 

- Install package by below command

	```
	# Red Hat Enterprise Linux
	~$ sudo rpm -ivh /Path to the rpm package/#{Package Name}.rpm
	# Ubuntu
	~$ sudo dpkg -i /Path to the rpm package/#{Package Name}.deb

	# OS X or Windows
	Just double click the download package
	```
  
### Vagrant
- Download the Vagrant installation package depends on your platform from [official website](https://www.vagrantup.com/downloads.html)

- Install package by below command
	```
	# Red Hat Enterprise Linux
	~$ sudo rpm -ivh /Path to the rpm package/#{Package Name}.rpm

	# Ubuntu
	~$ sudo dpkg -i /Path to the rpm package/#{Package Name}.deb

	# OS X or Windows
	Just double click the download package
	```
	
- Install some necessary Vagrant plugins from command line mode
	```
	~$ vagrant plugin install vagrant-omnibus
	~$ vagrant plugin install vagrant-berkshelf
	~$ vagrant plugin install vagrant-cachier
	~$ vagrant plugin install vagrant-vbguest

	# if you install one plugin successfully, then you could see wording like below
	Installing the '#{Package Name}' plugin. This can take a few minutes...
	Installed the plugin '#{Package Name} (#{Version})'!
	```
	
- Prepare the Vagrant box
	```
	~$ vagrant box add --insecure bento/ubuntu-14.04 https://atlas.hashicorp.com/bento/ubuntu-14.04
	# choose virtualbox as the provider
	```
	
### ChefDK
- Download ChefDK installation package from [official site](https://downloads.chef.io/chef-dk/)

- Install package by below command
	```
	# Red Hat Enterprise Linux
	~$ sudo rpm -ivh /Path to the rpm package/#{Package Name}.rpm

	# Ubuntu
	~$ sudo dpkg -i /Path to the rpm package/#{Package Name}.deb

	# OS X or Windows
	Just double click the download package
	```
	
- Verify the ChefDK by below command
	```
	~$ chef verify
	Running verification for component '...'
	..........
	---------------------------------------------
	Verification of component '...' succeeded.
	```
	
- Set System Ruby
	- Linux Based OS
		```
		~$　echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile
		~$ . ~/.bash_profile
		~$ which ruby
		# that will return
		/opt/chefdk/embedded/bin/ruby
		```
	
	- Windows
		```
		Add  "C:\opscode\chefdk\bin"  into Path variable in environment variable
		```

### Git
- Linux
	```
	# Red Hat Enterprise Linux
	~$ sudo yum install git
	# Ubuntu
	~$ sudo apt-get install git
	```
	
- Mac
	```
	~$ brew install git
	```
	
- Windows
	- Download Git installation package from [official site](https://git-scm.com/downloads)
	- During the installation process, please chooes **"Use Git from the Windows Comand Prompt"**, when Adjusing your PATH environment

## Download Dependency Cookbook

- Get the dependency cookbook from chef supermarket

	```
	~$ git clone https://github.com/smalltown/LAMP.git
	~$ cd LAMP
	~$ berks install
	```
- If you encounter the SSL issue during using berks, you could disable it by adding a config
	- Linux based OS
	
		```
		~$ vim ~/.berkshelf/config.json
		# add below content
		{"ssl":{"verify": false }}
		```
	- Windows
	
		```
		Add the config.json in anywhere you like, and the content is {"ssl":{"verify": false }}
		Then specific the config file during execute berks install
		~$ berks install -c /Path to config file/config.json
		```

                            
