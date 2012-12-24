#encoding: UTF-8
#coding: UTF-8
require './weapon'
require './magic'
require './soldier'
require './character'
require './item'

class Magician < Soldier

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
  @hp = @hpMax = 50+Random.rand(5)
  @weapons = [Weapon.new("Baton", 5)]
  @items = [Item.new("Megamagie", 50, "Le personnage cible recupere 50 MP", "MP", 1)]
  end

end  