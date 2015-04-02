namespace :env do
  desc 'Create .env file'
  task :setup do
    puts 'Could I take your name please?'
    print '> '
    name = STDIN.gets.strip
    puts "Thank you #{name}. Enjoy your day."

    File.open('.env', 'w+') do |f|
      f.write("DEV_DB_SUFFIX=_#{name.downcase}\n")
      f.write("TEST_DB_SUFFIX=_#{name.downcase}\n")
    end
  end
end
