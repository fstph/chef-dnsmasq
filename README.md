Description
===========

Sets up dnsmasq as a small DNS and DHCP server. This is mainly intended for use on a VM host.

Attributes
==========

* node["dnsmasq"]["service"] = "dnsmasq"
* node["dnsmasq"]["conf_file"] = "/etc/dnsmasq.conf"
* node["dnsmasq"]["conf_dir"] = "/etc/dnsmasq.d"

* node[:dnsmasq][:tftp_root] = "/var/ftpd"
* node[:dnsmasq][:dhcp_boot_file] = "pxelinux.0"

Usage
=====

Have a CSV of the general form
     
     MAC,IP,HOSTNAME[,CNAME,CNAME...]

like

     11:22:33:44:55:66,10.0.0.1,host11,host12,host13
     22:33:44:55:66:77,10.0.0.2,host21
     33:44:55:66:77:88,10.0.0.3,host31,host32


Then use it like

     require 'csv'
     network = CSV.read('/root/chef/cookbooks/test/files/default/test.csv')

     dnsmasq "oiml" do
     	     interfaces "eth0"
	     enable_tftp true
	     fixed_address_hosts network
	     ntp_servers ["192.168.2.1", "192.168.1.2"]
     end
