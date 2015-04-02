name        'security'
description 'General security recipes'
version     '0.0.1'

recipe 'security::sshd', 'Sets up no password access'
recipe 'security::iptables', 'Sets up 80 and 22 ports only'

depends 'sshd'
