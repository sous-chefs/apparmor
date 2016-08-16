apt_update 'update' if platform_family?('debian')

include_recipe 'apparmor::default'

apparmor_policy 'my_policy' do
  action :add
end
