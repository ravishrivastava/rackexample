class UsersApplication
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    response.headers["Content-Type"] = "application/json" 
   if request.path_info == "" 
      response.write(JSON.generate(Database.users))
    elsif request.path_info =~ %r{/\d+}
      id = request.path_info.split('/').last.to_i 
      user = Database.users[id]
      if user.nil?
        response.status = 404
        response.write("No user with id #{id}")
      else     
        response.write(JSON.generate(user))
      end
    else
      response.status = 404
      response.write("Nothing here!")
    end
    response.finish
  end
end
