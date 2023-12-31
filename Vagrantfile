# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Configuration options
VM_NAME = "compass_public_vm"
VM_DEFAULT_BOX = "ubuntu/trusty64"

# Note: make matching entries in /etc/hosts to access this VM by hostname
VM_DEFAULT_HOSTNAME = "compasspublic"
VM_PRIVATE_IP = "192.168.50.120"
HOST_PORT = 9000
GUEST_PORT = 80

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define VM_NAME do |config|


    # Use `BOX=<box_name> vagrant up` on command line to save time
    config.vm.box = ENV['BOX'] || VM_DEFAULT_BOX


    # Use salt to provision the vm
    config.vm.synced_folder "vm/salt/", "/srv/salt"
    config.vm.synced_folder "vm/salt/pillar/", "/srv/pillar"
    config.vm.synced_folder "vm/salt/minion.d/", "/etc/salt/minion.d"
    config.vm.provision :salt do |salt|
      # salt.bootstrap_script = "vm/salt/install_salt.sh"
      salt.always_install = true
      salt.run_highstate = true
      salt.verbose = true
      salt.install_type = "stable"
      salt.bootstrap_options = "-P"
    end


    # Configure network
    config.vm.hostname = ENV['HOSTNAME'] || VM_DEFAULT_HOSTNAME
    config.vm.network "forwarded_port", guest: GUEST_PORT, host: HOST_PORT
    config.vm.network "private_network", ip: VM_PRIVATE_IP


    # also place our code in the home folder of the server
    # This is required for our salt configs to work properly
    config.vm.synced_folder ".", "/home/vagrant/compass"


    config.vm.provider "virtualbox" do |v|
      # We can afford to beef up the VM a bit
      v.customize ["modifyvm", :id, "--memory", "1024"]
      v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
      # Really necessary to prevent slow port forwarding and slow internet inside vm
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      #v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end


  end

end
