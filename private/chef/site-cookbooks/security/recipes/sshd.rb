openssh_server node['sshd']['config_file'] do
  PasswordAuthentication 'no'
  X11Forwarding 'no'
end
