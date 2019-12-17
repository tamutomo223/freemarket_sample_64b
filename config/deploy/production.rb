server '3.115.222.173', 
user: 'ec2-user', 
roles: %w{app db web},

ssh_otions: {
  port: 22022,
  keys: %w(~/.ssh/tamutomo223.pem),
  user: "odatakashi",
  forward_agent: true,
}