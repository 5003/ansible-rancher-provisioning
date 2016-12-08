boxes = [
  {
    hostname: 'master',
    box: 'bento/centos-7.2',
  },
  {
    hostname: 'kevin.minions',
    box: 'bento/ubuntu-16.04',
  },
  {
    hostname: 'stuart.minions',
    box: 'bento/ubuntu-14.04',
  },
  {
    hostname: 'bob.minions',
    box: 'bento/debian-8.6',
  },
]

Vagrant.configure(2) do |config|
  config.vm.box_check_update = false

    boxes.each.with_index do |opts, num|
      config.vm.define opts[:hostname] do |node|
        node.vm.network :private_network, ip: "172.16.#{num}.18"
        node.vm.box = opts[:box]
        node.vm.hostname = opts[:hostname]
      end
    end

  config.vm.provider :virtualbox do |vbox|
    vbox.memory = ENV['VBOX_MEMORY'] || 480
    vbox.cpus = ENV['VBOX_CPUS'] || 2
    vbox.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vbox.customize ["modifyvm", :id, "--nictype2", "virtio"]
  end
end