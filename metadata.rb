name              "collectd"
maintainer        "Rory Savage"
maintainer_email  "rory.christina.savage@gmail.com"
description       "Auto-installation for collectd"
version           "0.4.1"
recipe            "collectd", "Auto-installation for collectd"
recipe            "collectd::attribute_driven", "Installs collectd plugins via node attributes"
recipe            "collectd::packages", "Installs collectd via packages"
recipe            "collectd::recompile", "Attempts to recompile collectd"

%w{ build-essential yum-epel }.each do |d|
  depends d
end

%w{ amazon centos fedora redhat scientific ubuntu }.each do |os|
    supports os
end
