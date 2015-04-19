#!/usr/bin/env ruby

# should be sudo'd inside the virtual machine

TMP_DIR = '/tmp/chef-jimrsmiley'

puts "*     configuring ubuntu environment with chef"
`git clone https://github.com/jimRsmiley/chef-jimrsmiley.git /tmp/chef-jimrsmiley`

Dir.chdir TMP_DIR
puts "*     checking chef install"
`./install-chef`
puts "*     running configure"
`./run-configure`
