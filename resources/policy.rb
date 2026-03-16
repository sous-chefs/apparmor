# frozen_string_literal: true

provides :apparmor_policy
unified_mode true

property :source_cookbook, String
property :source_filename, String

action :add do
  cookbook_file "/etc/apparmor.d/#{new_resource.name}" do
    cookbook new_resource.source_cookbook if new_resource.source_cookbook
    source new_resource.source_filename if new_resource.source_filename
    owner 'root'
    group 'root'
    mode '0644'
    notifies :reload, 'service[apparmor]', :immediately
  end

  service 'apparmor' do
    supports status: true, restart: true, reload: true
    action [:nothing]
  end
end

action :remove do
  file "/etc/apparmor.d/#{new_resource.name}" do
    action :delete
    notifies :reload, 'service[apparmor]', :immediately
    notifies :run, 'execute[aa-remove-unknown]', :immediately
  end

  service 'apparmor' do
    supports status: true, restart: true, reload: true
    action :nothing
  end

  execute 'aa-remove-unknown' do
    action :nothing
  end
end
