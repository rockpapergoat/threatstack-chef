default['threatstack']['repo_enable'] = true
default['threatstack']['repo']['components'] = ['stable']

case node['platform_family']
when 'debian'
  default['threatstack']['repo']['dist'] = node['lsb']['codename']
  default['threatstack']['repo']['url'] = 'https://pkg.threatstack.com/v2/Ubuntu'
  default['threatstack']['repo']['key'] = 'https://app.threatstack.com/APT-GPG-KEY-THREATSTACK'
when 'rhel', 'fedora', 'amazon'
  case node['platform']
  when 'amazon'
    default['threatstack']['repo']['url'] = 'https://pkg.threatstack.com/v2/Amazon'
  when 'centos', 'redhat'
    default['threatstack']['repo']['url'] = "https://pkg.threatstack.com/v2/EL/#{node['platform_version'].to_i}"
  else
    default['threatstack']['repo']['url'] = 'https://pkg.threatstack.com/v2/EL/7'
  end
  default['threatstack']['repo']['key'] = 'https://app.threatstack.com/RPM-GPG-KEY-THREATSTACK'
  default['threatstack']['repo']['key_file'] = '/etc/pki/rpm-gpg/RPM-GPG-KEY-THREATSTACK'
  default['threatstack']['repo']['key_file_uri'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-THREATSTACK'
end
