define :dnsmasq,
:interfaces => "",
:dns_servers => [ "8.8.8.8", "8.8.4.4" ],
:dhcp_range => ["10.0.0.1", "10.0.0.255"],
:dhcp_lease => "infinite",
:ntp_servers => nil,
:enable_tftp => true,
:fixed_address_hosts => nil do

  file "#{node[:dnsmasq][:conf_dir]}/10_domain" do
    content "domain=#{params[:name]}\n"
    notifies :restart, resources(:service => "dnsmasq")
  end

  template "#{node[:dnsmasq][:conf_dir]}/10_default" do
    source "10_default.erb"
    cookbook "dnsmasq"
    notifies :restart, resources(:service => "dnsmasq")
    variables(
              :dns_servers => params[:dns_servers],
              :interfaces => params[:interfaces],
              :dhcp_range => params[:dhcp_range],
              :dhcp_lease => params[:dhcp_lease]
              )
  end

  file "#{node[:dnsmasq][:conf_dir]}/10_ntp" do
    content "dhcp-option=option:ntp-server,#{params[:ntp_servers].join(",")}\n"
    notifies :restart, resources(:service => "dnsmasq")
  end if params[:ntp_servers]

  template "#{node[:dnsmasq][:conf_dir]}/20_fixed_address_hosts" do
    source "20_fixed_address_hosts.erb"
    cookbook "dnsmasq"
    notifies :restart, resources(:service => "dnsmasq")
    variables(
              :data => params[:fixed_address_hosts],
              :dhcp_lease => params[:dhcp_lease]
              )
  end if params[:fixed_address_hosts]
 
  include_recipe "dnsmasq::tftp" if params[:enable_tftp]
end
