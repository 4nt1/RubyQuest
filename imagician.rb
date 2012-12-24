#encoding: UTF-8
#coding: UTF-8
require './weapon'
require './magic'
require './isoldier'
require './character'

class IMagician < ISoldier

  def initialize(name)
    super(name)
    @characterClass = "Magicien"	
    @magics = [ThunderSpell.new(2), CureSpell.new(1)]
    @attack = 20+Random.rand(5)
    @agility = 30+Random.rand(5)
    @tir  = 20+Random.rand(5)
    @defense = 20+Random.rand(5)
    @magicDefense = 40+Random.rand(5)
    @mp = @mpMax = 50+Random.rand(5)
    @power  = 20+Random.rand(5)
    @intelligence = 40+Random.rand(5)
    @hp = @hpMax = 40+Random.rand(5)
    @weapons = [Weapon.new("Baton", 5)]
  end

end  