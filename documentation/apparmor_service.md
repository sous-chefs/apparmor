# apparmor_service

[Back to resource list](../README.md#custom-resources)

Manages the AppArmor package and service. Installs and enables AppArmor, or disables and removes it with optional GRUB configuration and reboot.

## Actions

| Action     | Description                                                                                                  |
|------------|--------------------------------------------------------------------------------------------------------------|
| `:create`  | Installs the apparmor package, starts and enables the service (default)                                      |
| `:disable` | Tears down AppArmor, removes the package, stops the service, and configures GRUB to disable AppArmor at boot |

## Properties

| Property           | Type    | Default | Description                                                              |
|--------------------|---------|---------|--------------------------------------------------------------------------|
| `name`             | String  |         | Resource name (not used functionally)                                    |
| `automatic_reboot` | Boolean | `false` | Whether to trigger an immediate reboot after disabling AppArmor via GRUB |

## Examples

### Enable AppArmor (default)

```ruby
apparmor_service 'default'
```

### Disable and remove AppArmor

```ruby
apparmor_service 'default' do
  action :disable
end
```

### Disable AppArmor with automatic reboot

```ruby
apparmor_service 'default' do
  automatic_reboot true
  action :disable
end
```
