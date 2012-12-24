#encoding: UTF-8
#coding: UTF-8
class Weapon
	attr_accessor :name, :power

	def initialize(name, power)
		@name = name
		@power = power
	end

	def to_s
		return self.name + " ( puissance : " + self.power.to_s + ")"

	end

end