## Installs kerl - doesn't install any erlang build, though;
## please use this cookbook's resources for that

kerl_instance node['kerl2']['version'] do
  notifies :run, "ruby_block[kerl_instance_notif]", :immediately
end

ruby_block 'kerl_instance_notif' do
  block do
    p "wkpo!! kerl_instance_notif"
  end
  action :nothing
end

# TODO wkpo remove the rest

kerl_build '18.3' do
  notifies :run, "ruby_block[kerl_build_notif]", :immediately
end

ruby_block 'kerl_build_notif' do
  block do
    p "wkpo!! kerl_build_notif"
  end
  action :nothing
end

kerl_erlang '18.3' do
  notifies :run, "ruby_block[kerl_install_notif]", :immediately
end

ruby_block 'kerl_install_notif' do
  block do
    p "wkpo!! kerl_install_notif"
  end
  action :nothing
end
