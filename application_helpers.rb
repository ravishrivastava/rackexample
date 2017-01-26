module ApplicationHelpers
 
  def error(response,message,status = 400)
      response.status = status
      response.write("ERROR: #{message}")
  end

  def response_with_object(response,object)
    response.write(JSON.generate(object))
  end

end
