servers=[
  {
    :hostname => "k8-master-hard",
    :ip => "192.168.31.55",
    :box => "ubuntu/bionic64",
    :ram => 2048,
    :cpu => 2
  },
  {
    :hostname => "k8-node-hard",
    :ip => "192.168.31.56",
    :box => "ubuntu/bionic64",
    :ram => 2048,
    :cpu => 2
  },
  {
  :hostname => "k8-lb",
 :ip => "192.168.31.52",
  :box => "centos/7",
  :ram => 512,
  :cpu => 1
  }
]


Vagrant.configure(2) do |config|
    config.vm.provision "shell",
    inline: "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config && sudo systemctl restart sshd"
    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = machine[:box]
            node.vm.hostname = machine[:hostname]
            node.vm.network "public_network", ip: machine[:ip]
            node.vm.provider "virtualbox" do |vb|
                vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
            end
        end
    end
end
