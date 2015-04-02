(node['users'] || []).each do |user|
  file "/home/#{user}/.ssh/id_rsa.pub" do
    action :delete
  end
end
