#!/usr/bin/env ruby

# what this script does:
#   pull down the git repository
#   change the owner to vagrant
#   import the data from the data repository
#   run bin/deploy
#   run fix_permissions
#   touch the /var/log/whathood.lo
#   copy over whathood.yaml

APP_DIR='/var/www/whathood'
PROVISION_DIR='/vagrant/provision'
CONFIG_DIR="#{PROVISION_DIR}/config"

`chown -R vagrant.vagrant /usr/local`

puts "*      cloning Whathood"
`git clone https://github.com/jimRsmiley/whathood.git #{APP_DIR} > /dev/null 2>&1`
`chown -R vagrant.vagrant #{APP_DIR}`
Dir.chdir APP_DIR

# do NOT run as vagrant
puts "*      importing data"
`sudo -u vagrant #{APP_DIR}/bin/import_db`

`sudo touch /var/log/whathood.log`
`sudo chown vagrant.vagrant /var/log/whathood.log`

`cp #{CONFIG_DIR}/whathood.yaml #{APP_DIR}`

puts "*      deploying Whathood"
`cd #{APP_DIR}`
`sudo -u vagrant #{APP_DIR}/bin/deploy`

`sudo -u vagrant #{APP_DIR}/dev-bin/fix_permissions`

