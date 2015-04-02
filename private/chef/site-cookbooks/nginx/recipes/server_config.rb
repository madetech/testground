template "#{node.nginx.dir}/conf.d/timed_log_format.conf" do
  source 'timed_log_format.erb'
  mode 0644
  owner node.nginx.user
  group node.nginx.user
  notifies :reload, 'service[nginx]'
end

(node['applications'] || {}).each do |env, config|
  template "#{node.nginx.dir}/sites-available/#{env}" do
    source 'puma_server.conf.erb'
    mode 0644
    owner node.nginx.user
    group node.nginx.user
    variables env: env,
              server_names: config.server_names,
              path: config.path
    notifies :reload, 'service[nginx]'
  end

  nginx_site env
end
