require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

heavens_gate = Cult.new("Heaven's Gate", "California", "1974")
rajneesh = Cult.new("Ranjeesh Movement", "Oregon", "1970")
peoples_temple = Cult.new("People's Temple", "California", "1955")
branch_davidians = Cult.new("Branch Davidians", "Texas", "1959")

heavens_gate.slogan = "Drink the Kool-Aid"
rajneesh.slogan = "Vote Rajneesh!"
peoples_temple.slogan = "We're getting outta here"
branch_davidians.slogan = "Texas!"

jane = Follower.new("Jane", 23)
george = Follower.new("George", 25)
joan = Follower.new("Joan", 20)
jim = Follower.new("Jim", 28)
roger = Follower.new("Roger", 26)

jane.life_motto = "Oop there it is"
george.life_motto = "Cowabunga Charlie"
joan.life_motto = "Hippopotabus"
jim.life_motto = "Kombuchaya"
roger.life_motto = "Whoopsy"

heavens_gate.recruit_follower(jane)
heavens_gate.recruit_follower(george)
heavens_gate.recruit_follower(jim)

jim.join_cult(rajneesh)
joan.join_cult(rajneesh)
roger.join_cult(rajneesh)
jane.join_cult(rajneesh)

peoples_temple.recruit_follower(roger)
peoples_temple.recruit_follower(jane)

branch_davidians.recruit_follower(jim)
branch_davidians.recruit_follower(george)

BloodOath.all[3].initiation_date = "1976-12-28"
BloodOath.all[4].initiation_date = "1984-02-14"
BloodOath.all[6].initiation_date = "1976-05-04"

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
