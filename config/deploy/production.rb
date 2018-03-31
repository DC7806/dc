set :stage, :production

server '128.199.229.103', user: 'deploy', roles: %w{web app db}