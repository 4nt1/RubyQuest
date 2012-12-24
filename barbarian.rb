#encoding: UTF-8
#coding: UTF-8
require './weapon'
require './magic'
require './soldier'
require './character'
require './item'

class Barbarian < Soldier

    def initialize(name)
    super(name)
	@characterClass = "Barbare"
    @agility = 25+Random.rand(5)
    @attack = 35+Random.rand(5)
	@tir  = 20+Random.rand(5)
	@defense = 30+Random.rand(5)
	@magicDefense = 20+Random.rand(5)
	@intelligence = 20+Random.rand(5)
	@power  = 35+Random.rand(5)
	@mp = @mpMax = 20+Random.rand(5)
    @hp = @hpMax = 50+Random.rand(5)
    @magics = []
    @weapons = [Weapon.new("Hache a deux mains", 15)]
  end

end  