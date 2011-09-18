directory node[:dnsmasq][:tftp_root] do
  mode 0744
  owner "root"
  group "root"
end

template "#{node[:dnsmasq][:conf_dir]}/10_tftp" do
  source "10_tftp.erb"
  notifies :restart, resources(:service => "dnsmasq")
end
