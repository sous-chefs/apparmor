if defined?(ChefSpec)
  def add_apparmor_policy(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apparmor_policy, :add, resource_name)
  end
  
  def remove_apparmor_policy(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apparmor_policy, :remove, resource_name)
  end
end
