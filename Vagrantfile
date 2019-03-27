# -*- mode: ruby -*-
# vi: set ft=ruby :

# Require 'vagrant plugin install vagrant-reload'

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.provider "virtualbox" do |v|
        v.memory = 4096
    end
    config.vm.provision "docker"
    config.vm.network :forwarded_port, guest: 8080, host: 8080
	config.vm.network :forwarded_port, guest: 3128, host: 3128
    config.vm.network :forwarded_port, guest: 2375, host: 2375, host_ip: "127.0.0.1"
    config.vm.hostname="dockerhost"

    #Create Folder and map to a Windows Folder:
    config.vm.provision "shell", inline: "mkdir -p /d/projekte"
    if File.directory?(File.expand_path("D:\\Projekte"))
        config.vm.synced_folder "D:\\Projekte", "/d/projekte"
    end
	
	config.vm.provision "shell", inline: <<-SHELL
    # Update and upgrade the server packages.
    sudo apt-get update
    sudo apt-get -y upgrade
	sudo ntpdate ntp.ubuntu.com
    #Git
	sudo apt-get install -y git
	#NPM
		#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
		#sudo apt-get install -y nodejs
	#Sparkleformation:
	sudo apt-add-repository ppa:brightbox/ruby-ng
	sudo apt-get update
	sudo apt-get install -y ruby2.4
	sudo apt-get install -y ruby2.4-dev
	sudo apt-get install -y build-essential
	sudo gem install bundler
	sudo gem install sfn
	#Stackmaster
	sudo gem install stack_master
	
	SHELL
	
	config.vm.provision :shell, :path => 'pyenv-install.sh', :privileged => false
	
	config.vm.provision "shell", inline: <<-SHELL
	#AWS CLI
	sudo apt-get install -y python-pip
	sudo apt-get update
	sudo pip install awscli --upgrade
	#Ansible
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install -y ansible
	#Sceptre
	sudo pip install sceptre
	
	# kubctl
	sudo apt-get update && sudo apt-get install -y apt-transport-https
	curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
	sudo touch /etc/apt/sources.list.d/kubernetes.list 
	echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
	sudo apt-get update
	sudo apt-get install -y kubectl
	# yq install
	sudo add-apt-repository ppa:rmescandon/yq -y
	sudo apt update
	sudo apt install yq -y	
	SHELL

	# Time update
	config.vm.provision :shell, :inline => "sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime", run: "always"  
 
end
