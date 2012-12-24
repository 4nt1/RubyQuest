#encoding: UTF-8
#coding: UTF-8
require './weapon'
require './magic'
require './isoldier'
require './character'



class IHero < ISoldier

  def initialize(name)
    super(name)
  @characterClass = "Heros"
  @magics = [FireSpell.new(1)]
  @attack = 35+Random.rand(5)
  @agility = 35+Random.rand(5)
  @tir  = 35+Random.rand(5)
  @defense = 35+Random.rand(5)
  @magicDefense = 35+Random.rand(5)
  @intelligence = 35+Random.rand(5)
  @power  = 35+Random.rand(5)
  @mp = @mpMax = 35+Random.rand(5)
  @hp = @hpMax = 55+Random.rand(5)
  @weapons = [Weapon.new("Epee longue", 15)]
  end


end