worker_processes ENV['COUNT'] || 3
timeout ENV['TIMEOUT'] || 30

preload_app true

before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect!
  # ConfigurationManager::Redis.disconnect

  old_pid = "#{server.config[:pid]}.oldbin"
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
  # ConfigurationManager::Redis.connect
  # ConfigurationManager::Sidekiq.configure_client

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
end
