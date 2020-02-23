class Follower
    attr_accessor :life_motto
    attr_reader :name, :age

    def initialize(name, age)
        @name = name
        @age = age
    end

    def self.all
        BloodOath.all.collect {|oath| oath.follower}.uniq
    end

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age >= age}
    end

    def self.most_active
        self.all.max do |a, b|
            a.cults.length <=> b.cults.length
        end
    end

    def self.top_ten
        self.all.max(10) do |a, b|
            a.cults.length <=> b.cults.length
        end
    end

    def cults
        oaths = BloodOath.all.find_all {|oath| oath.follower == self}
        oaths.collect {|oath| oath.cult}
    end

    def join_cult(cult)
        BloodOath.new(self, cult)
    end

    def my_cults_slogans
        self.cults.each {|cult| puts cult.slogan}
    end
end