class BloodOath
    attr_accessor :initiation_date
    attr_reader :follower, :cult
    @@all = []

    def initialize(follower, cult)
        @follower = follower
        @cult = cult
        @initiation_date = Time.now.to_s.slice(0..9)
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        self.all.min do |a, b|
            a.date_to_int <=> b.date_to_int
        end.follower
    end

    def date_to_int
        self.initiation_date.split("-").join.to_i
    end
end