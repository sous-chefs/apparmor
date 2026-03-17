# frozen_string_literal: true

apt_update 'update' if platform_family?('debian')

apparmor_service 'default'

apparmor_policy 'my_policy' do
  action :add
end

apparmor_policy 'my_policy' do
  action :remove
end
