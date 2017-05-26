## Installs kerl - doesn't install any erlang build, though;
## please use this cookbook's resources for that

kerl_instance node['kerl2']['version']

# TODO wkpo remove the rest

kerl_build '18.3' do
  release '18.3'
end
