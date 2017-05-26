## Compiles and installs a version of erlang with kerl

# older versions of Chef don't support require_relative...
require ::File.join(::File.dirname(__FILE__), '../libraries/shell_out')
include CookbookKerl2::ShellOut

resource_name :kerl_erlang

property :name, String, name_property: true, required: true
property :release, String, default: lazy { name }
property :install_basedir, String, default: lazy { node['kerl2']['erlangs_path'] }
property :install_basename, String, default: lazy { name }

default_action :install

load_current_value do
  current_release = ''

  # TODO wkpo from there

  kerl_shell_out!('list installations').each do |line|
    build_name = line.split(' ').first

    if build_name == name
      current_release = build_release
      break
    end
  end
  
  release current_release
end
