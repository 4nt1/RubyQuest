#encoding: UTF-8
#coding: UTF-8
class Item

	attr_accessor :name, :power, :resume, :type, :quantite
	def initialize(name, power, resume, type, quantite)
		@name = name
		@power =power
		@resume = resume
		@type = type
		@quantite = quantite
	end

	def to_s
		return self.name + "[" + self.quantite.to_s + "]" + " ( " + self.resume + ")"

	end
end
