# Jellfish attributes
# We do not use version 2 as we are primarily interested in using this for
# building Kraken databases. Version 2 is not compatible with Kraken, and is hosted completely differently
default['Jellyfish']['version'] = '1.1.11'
default['Jellyfish']['base_name'] = 'jellyfish-' + node['Jellyfish']['version']
default['Jellyfish']['archive'] = node['Jellyfish']['base_name'] + '.tar.gz'
default['Jellyfish']['install_dir'] = '/usr/local'
default['Jellyfish']['dir'] = node['Jellyfish']['install_dir'] + '/' + node['Jellyfish']['base_name']
default['Jellyfish']['download_url'] = 'http://www.cbcb.umd.edu/software/jellyfish/' + node['Jellyfish']['archive']
