#encoding: UTF-8
#coding: UTF-8
class Armor
	attr_accessor :name, :physicalDefense, :magicalDefense, :effect

	def initialize
		@name = name
		@physicalDefense = physicalDefense
		@magicalDefense = magicalDefense
		@effect = effect
	end

def to_s
		return self.name + " ( défense physique : " + self.physicalDefense.to_s + " " + self.effect + ")"

end