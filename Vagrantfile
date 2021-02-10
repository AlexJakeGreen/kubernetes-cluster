# -*- mode: ruby -*-
# vi: set ft=ruby :

# vagrant plugin install vagrant-libvirt

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.box_check_update = false

  # Control node
  config.vm.define "kube-control", primary: true do |m|
    m.vm.network :private_network, ip: "192.168.20.10"
    m.vm.hostname = "kube-control"
    m.vm.provider :libvirt do |vb|
      vb.cpus = 2
      vb.memory = 2048
    end

    m.vm.provision :ansible do |ansible|
      ansible.become = true
      ansible.playbook = 'provisioning/kube-control.yml'
    end

  end

  # Worker nodes
  (1..3).each do |i|
    config.vm.define "kube-worker#{i}", autostart: false do |m|
      m.vm.network :private_network, ip: "192.168.20.#{i + 10}"
      m.vm.hostname = "kube-worker#{i}"
      m.vm.provider :libvirt do |vb|
        vb.cpus = 1
        vb.memory = 1024
      end

      m.vm.provision :ansible do |ansible|
        ansible.become = true
        ansible.playbook = 'provisioning/kube-workers.yml'
      end

    end
  end

  # NFS server node
  config.vm.define :nfs, autostart: false do |m|
    m.vm.network :private_network, ip: "192.168.20.50"
    m.vm.hostname = "nfs"
    m.vm.provider :libvirt do |vb|
      vb.cpus = 1
      vb.memory = 1024
    end

    m.vm.provision :ansible do |ansible|
      ansible.become = true
      ansible.playbook = 'provisioning/nfs-server.yml'
    end
  end

end
