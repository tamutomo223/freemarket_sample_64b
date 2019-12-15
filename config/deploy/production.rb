server '3.115.222.173', user: 'ec2-user', roles: %w{app db web}

set :ssh_options, {
  keys: [File.expand_path('~/.ssh/tamutomo223.pem')],
}