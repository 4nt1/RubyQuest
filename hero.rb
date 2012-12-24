#encoding: UTF-8
#coding: UTF-8
require './weapon'
require './magic'
require './soldier'
require './character'
require './item'



class Hero < Soldier

  def initialize(name)
    super(name)
  @characterClass = "Hero"
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
  @luck = 2
  @weapons = [Weapon.new("Epee longue", 15)]
  @items = [Item.new("Eke Eke", 50, "Le personnage cible recupere 50 HP", "HP", 2), Item.new("Source de magie", 25, "Le personnage cible recupere 25 MP", "MP", 1)]
  end


end