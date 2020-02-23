class Cult
    attr_accessor :slogan
    attr_reader :name, :location, :founding_year

    def initialize(name, location, founding_year)
        @name = name
        @location = location
        @founding_year = founding_year
    end

    def recruit_follower(follower)
        BloodOath.new(follower, self)
    end

    def followers
        oaths = BloodOath.all.select {|oath| oath.cult == self}
        oaths.collect {|oath| oath.follower}
    end

    def cult_population
        self.followers.length
    end

    def recruit_follower(follower)
        BloodOath.new(follower, self)
    end

    def average_age
        ages = self.followers.collect {|follower| follower.age}
        ages.sum / self.cult_population
    end

    def followers_mottos
        self.followers.each {|follower| puts follower.life_motto}
    end

    def self.all
        BloodOath.all.collect {|oath| oath.cult}.uniq      
    end

    def self.find_by_name(name)
        oath = BloodOath.all.find {|oath| oath.cult.name == name}
        oath.cult
    end

    def self.find_by_location(location)
        oaths = BloodOath.all.find_all {|oath| oath.cult.location == location}
        oaths.collect {|oath| oath.cult}.uniq
    end

    def self.find_by_year(year)
        oaths = BloodOath.all.find_all {|oath| oath.cult.founding_year == year}
        oaths.collect {|oath| oath.cult}.uniq
    end

    def self.least_popular
        self.all.min {|a, b| a.cult_population <=> b.cult_population}
    end

    def self.locations
        self.all.collect {|cult| cult.location}.uniq
    end

    def self.most_common_location
        self.locations.max do |a, b|
            self.find_by_location(a).length <=> self.find_by_location(b).length
        end
    end
end