default['LAMP']['Apache2']['document_root'] = '/srv/apache/www/'
default['LAMP']['Apache2']['site80'] = 'site80'
default['LAMP']['Apache2']['server_name'] = 'localhost'
default['LAMP']['Apache2']['alias'] = '/'
override['apache']['listen_ports'] = %w(80)

# MySQL information
default['LAMP']['MySQL']['host'] = 'localhost'
default['LAMP']['MySQL']['port'] = 3306
default['LAMP']['MySQL']['database'] = 'DevOps'
default['LAMP']['MySQL']['user'] = 'DevOps'
default['LAMP']['MySQL']['password'] = 'justfortest'
normal['mysql']['server_root_password'] = 'justfortest'
