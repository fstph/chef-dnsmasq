# Maybe those settings are different on RedHat, CentOS etc...
default["dnsmasq"]["service"] = "dnsmasq"
default["dnsmasq"]["conf_file"] = "/etc/dnsmasq.conf"
default["dnsmasq"]["conf_dir"] = "/etc/dnsmasq.d"

default["dnsmasq"]["tftp_root"] = "/var/ftpd"
default["dnsmasq"]["dhcp_boot_file"] = "pxelinux.0"
