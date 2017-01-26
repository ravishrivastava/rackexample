class Database
  USERS = {
    1 => {id: 1,name: 'Ravi' , Bike: 'Activa', api_key: "1234"},
    2 => {id: 2,name: 'Sanjeev' , Bike: 'Pulsar',api_key: "abcd"}
  }

  def users(user_id)
    USERS.select do |id, _|
      id == user_id
    end
  end

  def add_ride(ride)
    RIDES[RIDES.keys.length+1] =  ride
  end

  RIDES = {
    1 => {user_id: 1,title: 'Morning Commute' , date: '2016-02-03'},
    2 => {user_id: 2,title: 'Evening Commute' , date: '2016-02-02'}
  }

  def rides
    RIDES
  end
  
  def user_by_api_key(key)
    USERS.values.find do |user|
      user[:api_key] = key
    end
  end
end
