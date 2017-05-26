## Compiles an erlang build with kerl

# older versions of Chef don't support require_relative...
require ::File.join(::File.dirname(__FILE__), '../libraries/shell_out')
include CookbookKerl2::ShellOut

resource_name :kerl_build

property :name, String, name_property: true, required: true
property :release, String, default: lazy { name }
# see https://github.com/kerl/kerl#build-configuration
property :build_env, Hash, default: {}

default_action :build

load_current_value do
  current_release = ''

  kerl_shell_out!('list builds').each do |line|
    build_release, build_name = line.split(',')

    if build_name == name
      current_release = build_release
      break
    end
  end

  p "wkpo current_release = #{current_release} VS #{release} AND #{name}"

  release current_release
end

action :build do
  converge_if_changed do
    kerl_shell_out!('update releases')
    kerl_shell_out!("build #{release} #{name}", env: build_env)
  end
end
