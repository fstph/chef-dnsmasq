# Maybe those settings are different on RedHat, CentOS etc...
default[:dnsmasq][:service] = "dnsmasq"
default[:dnsmasq][:conf_file] = "/etc/dnsmasq.conf"
default[:dnsmasq][:conf_dir] = "/etc/dnsmasq.d"

default[:dnsmasq][:dns_servers] = [ "8.8.8.8", "8.8.4.4" ]

default[:dnsmasq][:listen_interface] = "br0"
default[:dnsmasq][:domain] = "example.com"

default[:dnsmasq][:dhcp_range_from] = "10.0.0.1"
default[:dnsmasq][:dhcp_range_to] = "10.0.0.255"
default[:dnsmasq][:lease_time] = "infinite"

default[:dnsmasq][:ntp_servers] = []

default[:dnsmasq][:tftp_root] = "/var/ftpd"
default[:dnsmasq][:dhcp_boot_file] = "pxelinux.0"
