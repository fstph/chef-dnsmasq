package "dnsmasq" do
  action :upgrade
end

service node[:dnsmasq][:service] do
  action [:enable, :start]
end

directory node[:dnsmasq][:conf_dir] do
  mode 0744
  owner "root"
  group "root"
end

file node[:dnsmasq][:conf_file] do
  mode 0311
  owner "root"
  group "root"
  content "conf-dir=#{node[:dnsmasq][:conf_dir]}\n"
end

template "#{node[:dnsmasq][:conf_dir]}/10_default" do
  source "10_default.erb"
end

template "#{node[:dnsmasq][:conf_dir]}/10_ntp" do
  source "10_ntp.erb"
end if node[:dnsmasq][:ntp_servers] and !node[:dnsmasq][:ntp_servers].empty?

include_recipe "dnsmasq::tftp" if !node[:dnsmasq][:tftp_root].empty?
