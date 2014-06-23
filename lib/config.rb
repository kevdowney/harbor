# Code and idea taken from Laravel Homestead
# http://laravel.com/docs/homestead?version=4.2

class Harbor
    def Harbor.configure(config, settings)

        # Configure The Box
        config.vm.box = "senary/harbor"
        config.vm.hostname = "harbor"

        # Configure A Private Network IP
        config.vm.network :private_network, ip: settings["ip"] ||= "192.168.22.22"

        # Configure A Few VirtualBox Settings
        config.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", settings["memory"] ||= "2048"]
            vb.customize ["modifyvm", :id, "--cpus", settings["cpus"] ||= "1"]
            vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        end

        # Configure Port Forwarding To The Box
        settings["ports"].each do |port|
            config.vm.network "forwarded_port", guest: port["from"], host: port["to"]
        end

        # Configure The Public Key For SSH Access
        config.vm.provision "shell" do |s|
            s.inline = "echo $1 | tee -a /home/vagrant/.ssh/authorized_keys"
            s.args = [File.read(settings["authorize"])]
        end

        # Copy The SSH Private Keys To The Box
        settings["keys"].each do |key|
            config.vm.provision "shell" do |s|
                s.privileged = false
                s.inline = "echo \"$1\" > /home/vagrant/.ssh/$2 && chmod 600 /home/vagrant/.ssh/$2"
                s.args = [File.read(key), key.split('/').last]
            end
        end

        # Copy The Bash Aliases
        config.vm.provision "shell" do |s|
            s.inline = "cp /vagrant/aliases /home/vagrant/.bash_aliases"
        end

        # Register All Of The Configured Shared Folders
        settings["folders"].each do |folder|
            config.vm.synced_folder folder["from"], folder["to"]
        end

        # Install All The Configured Nginx Sites
        settings["sites"].each do |site|
            config.vm.provision "shell" do |s|
                s.inline = "bash /vagrant/lib/serve.sh $1 $2"
                s.args = [site["url"], site["root"]]
            end
        end
    end
end
