# -*- mode: ruby -*-
# vi: set ft=ruby :

File.delete('provision/join_command') if File.exists?('provision/join_command')
worker_hosts = []

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.box_check_update = false

  config.vm.define :control, primary: true do |m|
    m.vm.network :private_network, ip: "192.168.20.10"
    m.vm.hostname = "control"
    m.vm.provider :libvirt do |vb|
      vb.cpus = 2
      vb.memory = 2048
    end
  end

  N = 3
  (1..N).each do |i|
    config.vm.define "worker#{i}" do |m|
      m.vm.network :private_network, ip: "192.168.20.#{i + 10}"
      m.vm.hostname = "worker#{i}"
      m.vm.provider :libvirt do |vb|
        vb.cpus = 1
        vb.memory = 1024
      end

      worker_hosts.append("worker#{i}")

      if i == N
        m.vm.provision :ansible do |ansible|
          ansible.limit = "all"
          ansible.become = true
          ansible.playbook = 'provisioning/playbook.yml'
          ansible.groups = {
            'worker_hosts' => worker_hosts
          }
        end

      end
    end
  end


end
