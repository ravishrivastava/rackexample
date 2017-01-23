class Database
  USERS = {
    1 => {name: 'Ravi' , Bike: 'Activa'},
    2 => {name: 'Sanjeev' , Bike: 'Pulsar'}
  }

  def self.users
    USERS
  end

  def self.add_ride(ride)
    RIDES[RIDES.keys.length+1] =  ride
  end

  RIDES = {
    1 => {user_id: 1,title: 'Morning Commute' , date: '2016-02-03'},
    2 => {user_id: 2,title: 'Evening Commute' , date: '2016-02-02'}
  }

  def self.rides
    RIDES
  end
end
