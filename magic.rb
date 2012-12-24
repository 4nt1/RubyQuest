#encoding: UTF-8
#coding: UTF-8
class Spell

	attr_accessor :name, :power, :mpcost, :type, :level

	def initialize()
		@name = name
		@power =power**level
		@mpcost= mpcost**level
		@type = type
		@level = level
	end

	def to_s
		return self.name + " " + self.level.to_s + " ( puissance : " + self.power.to_s + ", cout :" + self.mpcost.to_s + ")"

	end
end

class FireSpell < Spell
	attr_accessor :name, :power, :mpcost, :type

	def initialize(level)
		@name = "Brasier"
		@power = 10**level
		@mpcost= 7**level
		@type = "Attack"
		@level = level
	end
end

class ThunderSpell < Spell
	attr_accessor :name, :power, :mpcost, :type

	def initialize(level)
		@name = "Eclair"
		@power = 10**level
		@mpcost= 7**level
		@type = "Attack"
		@level = level
	end
end

class CureSpell < Spell
	attr_accessor :name, :power, :mpcost, :type

	def initialize(level)
		@name = "Soin"
		@power = 10**level
		@mpcost= 7**level
		@type = "Defense"
		@level = level
	end
end

