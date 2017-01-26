class ApiKey
  def initialize(app,opt={})
    @app = app
    @database = opt[:database]
  end

  def call(env)
    user = @database.user_by_api_key(env["HTTP_API_KEY"])
    puts "user:  "+user.inspect
    if user.nil?
      [403,{},["Forbidden"]]
    else 
      env["rides_app.user_id"] = user[:id] 
      @app.call(env)
    end  
  end
end
