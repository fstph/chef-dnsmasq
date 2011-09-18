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
