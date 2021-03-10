
node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}

node 'pasture.puppet.vm'{
  include profile::appian::app
}
