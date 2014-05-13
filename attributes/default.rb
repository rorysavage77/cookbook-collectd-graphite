default["collectd"]["version"]            = "5.4.1"
default["collectd"]["dir"]                = "/opt/collectd"
default["collectd"]["url"]                = "http://fossies.org/linux/privat/collectd-#{node["collectd"]["version"]}.tar.gz"
default["collectd"]["checksum"]           = "cb361deeda00bece54cec2f7a2c368ccea4ac1c4a83388a0dae0435ba8969ee1"
default["collectd"]["interval"]           = 10
default["collectd"]["read_threads"]       = 5
default["collectd"]["name"]               = node["fqdn"]
default["collectd"]["plugins"]            = Mash.new
default["collectd"]["graphite_role"]      = "graphite"
default["collectd"]["graphite_ipaddress"] = "10.0.0.27"
