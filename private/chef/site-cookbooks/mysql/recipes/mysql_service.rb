mysql_service 'default' do
  port '3306'
  bind_address '127.0.0.1'
  version '5.5'
  socket '/var/run/mysqld/mysqld.sock'
  initial_root_password 'root'
  action [:create, :start]
end

mysql_client 'default' do
  action :create
end

service 'mysql-default' do
  action :start
end
