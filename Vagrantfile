# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.define "centos" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.provider "virtualbox" do |vb|
      vb.name = "HuebshCentos"
      vb.customize ["modifyvm", :id, "--memory", 512, "--cpus", 1, "--cpuexecutioncap", "30"]
    end
    centos.vm.synced_folder ".", "/vagrant"
  end

  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/focal64"
    ubuntu.vm.provider "virtualbox" do |vb|
      vb.name = "HuebshUbuntu"
      vb.customize ["modifyvm", :id, "--memory", 512, "--cpus", 1, "--cpuexecutioncap", "30"]
    end
    ubuntu.vm.synced_folder ".", "/vagrant"
  end

  config.vm.define "fedora" do |fedora|
    fedora.vm.box = "fedora/33-cloud-base"
    fedora.vm.provider "virtualbox" do |vb|
      vb.name = "HuebshFedora"
      vb.customize ["modifyvm", :id, "--memory", 1024, "--cpus", 1, "--cpuexecutioncap", "50"]
    end
    fedora.vm.synced_folder ".", "/vagrant"
  end


end


