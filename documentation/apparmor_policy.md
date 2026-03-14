# apparmor_policy

[Back to resource list](../README.md#custom-resources)

Adds or removes AppArmor policy files.

## Actions

| Action    | Description                                                       |
|-----------|-------------------------------------------------------------------|
| `:add`    | Adds a new AppArmor policy using a provided policy file (default) |
| `:remove` | Removes a specified AppArmor policy                               |

## Properties

| Property          | Type   | Default       | Description                                                         |
|-------------------|--------|---------------|---------------------------------------------------------------------|
| `name`            | String | Resource name | The name of the policy as stored in `/etc/apparmor.d/`              |
| `source_cookbook` | String |               | Cookbook to source the policy file from if not in the same cookbook |
| `source_filename` | String |               | Name of the source file if it doesn't match the resource name       |

## Examples

### Basic usage

```ruby
apparmor_policy 'my_super_app'
```

### Policy from a different cookbook

```ruby
apparmor_policy 'my_super_app' do
  source_cookbook 'acme_apparmor_profiles'
  source_filename 'my_super_app_am_policy'
end
```

### Remove a policy

```ruby
apparmor_policy 'my_super_app' do
  action :remove
end
```
