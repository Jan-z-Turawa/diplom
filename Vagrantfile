BRIDGE_NET="192.168.56."
DOMAIN="test"
MACHINES = {
  :diplom => {
    :box_name => "ubuntu/focal64",
    :host_name => "Diploms",  
    :ip_addr => BRIDGE_NET + "16",
    :cpu => 2,
    :ram => 2048
  }
}


Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|                  
      config.vm.define boxname do |box|
          box.vm.box = boxconfig[:box_name]               
          box.vm.host_name = boxconfig[:host_name]           
          config.vm.network "private_network", ip: "192.168.56.121"
          box.vm.provider :virtualbox do |vb|
              vb.name = boxconfig[:host_name]
              vb.cpus = boxconfig[:cpu]
              vb.memory = boxconfig[:ram]
              if (vb.name == 'ubuntu')
                vb.customize [ "modifyvm", :id, '--cableconnected1', 'on' ]
              end
          end
          config.vm.provision "shell", inline: <<-SHELL
          echo -e "vagrant\nvagrant" | passwd root
          echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
          sed -in 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
          service ssh restart
      SHELL
      
        config.vm.synced_folder "d:/DevOps/diploms/images", "/tmp/images"
        config.vm.synced_folder "d:/DevOps/diploms/jenkins_home", "/tmp/jenkins_home"
        config.vm.synced_folder "d:/DevOps/diploms/ssh", "/tmp/ssh"
        config.vm.synced_folder "d:/DevOps/diploms/db_init", "/tmp/db_init"
      
        config.vm.provision "docker"
      
        config.vm.provision "shell", path: "install_docker_compose.sh"
        config.vm.provision "shell", path: "load_docker_images.sh"
        config.vm.provision "shell", path: "create_ssh_keys.sh"
        config.vm.provision "shell", path: "clone_repository.sh"
        config.vm.provision "shell", path: "create_environment.sh"
        config.vm.provision "shell", path: "create_jenkins_agent.sh"
        config.vm.provision "shell", path: "db_init.sh"
      end
      config.ssh.username = 'vagrant'
      config.ssh.password = 'vagrant'
      config.ssh.insert_key = false
      config.ssh.forward_agent = true
      config.vm.boot_timeout = 3000
  end
end
