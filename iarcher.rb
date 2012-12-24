#encoding: UTF-8
#coding: UTF-8
require './weapon'
require './magic'
require './isoldier'
require './character'

class IArcher < ISoldier
def initialize(name)
    super(name)
	@characterClass = "Archer"
	@agility = 35+Random.rand(5)
    @attack = 20+Random.rand(5)
	@tir  = 35+Random.rand(5)
	@defense = 25+Random.rand(5)
	@magicDefense = 25+Random.rand(5)
	@intelligence = 25+Random.rand(5)
	@power  = 25+Random.rand(5)
	@mp = @mpMax = 20+Random.rand(5)
    @hp = @hpMax = 45+Random.rand(5)
    @items = []
    @magics = []
    @weapons = [Weapon.new("Arc", 10)]
  end
end