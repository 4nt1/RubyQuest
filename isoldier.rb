#encoding: UTF-8
#coding: UTF-8
require './weapon'
require './magic'
require './character'

class ISoldier < Character
  
  attr_accessor :name, :characterClass, :attack, :agility, :defense, :power, :intelligence, :level, \
   :experience, :hp, :mp, :endturn, :items, :magics, :weapons, :magicDefense, :hpMax, :mpMax, :luck
  
  def initialize(name)
    super(name)
    @characterClass = "Soldat"
    @name =  name
    @level = 1
    @experience = 0
    @agility = 30+Random.rand(5)
    @attack = 30+Random.rand(5)
    @tir  = 30+Random.rand(5)
    @defense = 30+Random.rand(5)
    @magicDefense = 25+Random.rand(5)
    @intelligence = 25+Random.rand(5)
    @power  = 30+Random.rand(5)
    @mp = @mpMax = 20+Random.rand(5)
    @hp = @hpMax = 45+Random.rand(5)
    @items = []
    @magics = []
    @weapons = [Weapon.new("Epee courte", 10)]
    @luck = 0
  end

  def to_s
    return self.name + " [" + self.characterClass + "] " +  self.hp.to_s + "/" + self.hpMax.to_s + " HP - " + self.mp.to_s + "/" + self.mpMax.to_s +  " MP"
  end

	
  def move()
    return self.agility / 10
  end



  def chooseAction()
    if self.magics.empty? == false
      if self.magics[0].mpcost <= self.mp
        if self.class == IMagician
          return self.magics[0]
        else 
         	auHasard = Random.rand(100)
      	  if auHasard > 75
            return self.magics[0]
          else
           return self.weapons[0]
          end
        end      
      end
    else
      return self.weapons[0]
    end
  end
    
    def criticalHit?
      r = Random.rand(99)
      if r + self.luck > 94
        return true
      else
        return false
      end
  end    

    def isHit()
    puts "#{self.name} est touche !"
    gets
    touchScream = File.readlines('./ifTouched.txt')[Random.rand(30)].chomp
    puts touchScream
    gets
  end

  def escape()
      puts "#{self.name} esquive !"
      gets
      escapeScream = File.readlines('./ifEscaped.txt')[Random.rand(30)].chomp
      puts escapeScream
      gets
  end


  def spellCast(usedSpell)
    if usedSpell.type == "Attack"
      puts "Attaque avec #{usedSpell.name} "
      gets
      scream = File.readlines('./magicScreams.txt')[Random.rand(30)].chomp
      puts scream
      gets
      self.mp -= usedSpell.mpcost
      return self.intelligence+Random.rand(10)
    
    elsif usedSpell.type == "Defense"
      puts "#{usedSpell.name}"
      gets
      scream = File.readlines('./magicScreams.txt')[Random.rand(30)].chomp
      puts scream
      gets
      self.mp -= usedSpell.mpcost
      return 1
    end
  end

  def slash(usedWeapon)
    puts "Attaque avec #{usedWeapon.name} "
    gets
    scream = File.readlines('./attackScreams.txt')[Random.rand(40)].chomp
    puts scream
    gets
    return self.attack + Random.rand(10)
  end

  def defend(item)
    if item.class == Weapon
      return self.agility + Random.rand(5)
    elsif item.class < Spell
      return self.intelligence + Random.rand(5)
    end
  end
end