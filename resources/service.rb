# frozen_string_literal: true

provides :apparmor_service
unified_mode true

property :automatic_reboot, [true, false], default: false

action :create do
  package 'apparmor' do
    action :install
  end

  service 'apparmor' do
    supports status: true, restart: true, reload: true
    action [:start, :enable]
  end

  file '/etc/default/grub.d/apparmor.cfg' do
    action :delete
    notifies :run, 'execute[update-grub]'
    not_if { docker? || !::Dir.exist?('/etc/default/grub.d') }
  end

  execute 'update-grub' do
    action :nothing
  end

  reboot 'apparmor_state_change' do
    delay_mins 1
    reason 'Changing the AppArmor state requires a reboot'
    action :nothing
  end
end

action :disable do
  execute 'apparmor_teardown' do
    command '/usr/sbin/service apparmor teardown'
    ignore_failure true
    only_if do
      ::File.exist?('/lib/apparmor/functions') && !docker?
    end
  end

  package 'apparmor' do
    action :remove
  end

  service 'apparmor' do
    supports status: true, restart: true, reload: true
    action [:stop, :disable]
  end

  file '/etc/default/grub.d/apparmor.cfg' do
    content 'GRUB_CMDLINE_LINUX_DEFAULT="$GRUB_CMDLINE_LINUX_DEFAULT apparmor=0"'
    action :create
    notifies :run, 'execute[update-grub]'
    notifies :reboot_now, 'reboot[apparmor_state_change]' if new_resource.automatic_reboot
    not_if { docker? || !::Dir.exist?('/etc/default/grub.d') }
  end

  execute 'update-grub' do
    action :nothing
  end

  reboot 'apparmor_state_change' do
    delay_mins 1
    reason 'Changing the AppArmor state requires a reboot'
    action :nothing
  end
end
