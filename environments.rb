configure :development do
 set :show_exceptions, true
end

configure :production, :development do
 set :show_exceptions, true
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end
