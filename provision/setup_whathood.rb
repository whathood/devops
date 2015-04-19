#!/usr/bin/env ruby

# what this script does:
#   pull down the git repository
#   change the owner to vagrant
#   import the data from the data repository
#   run bin/deploy
#   run fix_permissions
#   touch the /var/log/whathood.lo
#   copy over whathood.yaml

APP_DIR       = '/var/www/whathood'
PROVISION_DIR = '/vagrant/provision'
CONFIG_DIR    = "#{PROVISION_DIR}/config"

`chown -R vagrant.vagrant /usr/local`

get_whathood_src(APP_DIR)
get_db_data(APP_DIR)
setup_whathood_yaml(APP_DIR,CONFIG_DIR)
fix_file_permissions(APP_DIR)


BEGIN {

    def get_whathood_src(app_dir)
        puts "*      cloning whathood source"
        `git clone https://github.com/jimRsmiley/whathood.git #{app_dir} > /dev/null 2>&1`
        `git checkout wip/transfer`
        `chown -R vagrant.vagrant #{app_dir}`

        puts "*      deploying Whathood"
        Dir.chdir #{app_dir}
        `sudo -u vagrant #{app_dir}/bin/deploy --no-prompt`
    end

    def fix_file_permissions(app_dir)
        `sudo -u vagrant #{app_dir}/dev-bin/fix_permissions`
    end

    def setup_whathood_yaml(app_dir,config_dir)
        `cp #{config_dir}/whathood.yaml #{app_dir}`
    end

    def get_db_data(app_dir)
        Dir.chdir app_dir
        puts "*      importing data"
        `sudo -u vagrant #{app_dir}/bin/import_db`
    end
}
