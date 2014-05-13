name "collectd-client"
description "This is the collectd client role attributes"
run_list "recipe[ntp]", "recipe[motd]", "recipe[hostsfile]", "recipe[collectd]", ["recipe[collectd::attribute_driven]"]
default_attributes(
  "collectd" => {
    "plugins" => {
      "syslog" => {
        "config" => { "LogLevel" => "Info" }
      },
      "disk"      => { },
      "swap"      => { },
      "memory"    => { },
      "cpu"       => { },
      "interface" => {
        "config" => { "Interface" => "lo", "IgnoreSelected" => true }
      },
      "df"        => {
        "config" => {
          "ReportReserved" => false,
          "FSType" => [ "proc", "sysfs", "fusectl", "debugfs", "devtmpfs", "devpts", "tmpfs" ],
          "IgnoreSelected" => true
        }
      },
      "write_graphite" => {
        "config" => {
          "Prefix" => "servers."
        }
      }
    }
  }
)
