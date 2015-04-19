#!/usr/bin/env ruby

# what this script does:
#   pull down the git repository
#   change the owner to vagrant
#   import the data from the data repository
#   run bin/deploy
#   run fix_permissions
#   touch the /var/log/whathood.lo
#   copy over whathood.yaml

require "fileutils"
require "net/https"
require "uri"

GIT_BRANCH    = 'wip/transfer'
APP_URL       = 'http://localhost:8080'
SRC_DIR       = '/var/www/whathood'
PROVISION_DIR = '/vagrant/provision'
CONFIG_DIR    = "#{PROVISION_DIR}/config"

`chown -R vagrant.vagrant /usr/local`

get_whathood_src(SRC_DIR,GIT_BRANCH)
run_whathood_deploy(SRC_DIR)
get_db_data(SRC_DIR)
setup_whathood_yaml(SRC_DIR,CONFIG_DIR)
fix_file_permissions(SRC_DIR)
test_live_site(APP_URL)

BEGIN {

    def test_live_site(app_url)
        puts "sleeping for 5 seconds....."
        sleep 5
        puts "checking for site index"
        result = `wget http://localhost:80`
        puts result

        uri = URI.parse(app_url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(uri.request_uri)
        res = http.request(request)

        puts "res.code: #{res.code}"
        if res.code != 200
            puts "WARNING:\n\n**********\n\n\npolling #{app_url} did not return a 200 code"
        end
    end

    def get_whathood_src(src_dir,git_branch)
        unless src_dir
            abort "vagrant:setup_whathood.rb: src_dir must be defined"
        end

        puts "*      cloning whathood source"
        `git clone https://github.com/jimRsmiley/whathood.git #{src_dir} > /dev/null 2>&1`
	Dir.chdir src_dir
        `git checkout #{git_branch}`
        FileUtils.chown_R "vagrant", "vagrant", src_dir

    end

    def run_whathood_deploy(src_dir)
        puts "*      deploying Whathood"
        Dir.chdir src_dir
        `sudo #{src_dir}/bin/deploy --no-prompt`
    end

    # should be run as root, not vagrant
    def fix_file_permissions(src_dir)
        `sudo #{src_dir}/dev-bin/fix_permissions`
    end

    def setup_whathood_yaml(src_dir,config_dir)
        `cp #{config_dir}/whathood.yaml #{src_dir}`
    end

    def get_db_data(src_dir)
        Dir.chdir src_dir
        puts "*      importing data"
        `sudo -u vagrant #{src_dir}/bin/import_db`
    end
}
