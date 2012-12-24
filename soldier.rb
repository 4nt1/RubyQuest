#encoding: UTF-8
#coding: UTF-8
require './weapon'
require './magic'
require './character'
require './item'

class Soldier < Character
  
  attr_accessor :name, :characterClass, :attack, :agility, :defense, :power, :intelligence, :level, \
   :experience, :hp, :mp, :endturn, :items, :magics, :weapons, :magicDefense, :hpMax, :mpMax, :luck, :state
  
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
    @items = [Item.new("Potion de soin", 25, "Le personnage cible recupere 25 HP", "HP", 1)]
    @magics = []
    @weapons = [Weapon.new("Epee courte", 10)]
    @luck = 0
    @state = "Normal"
  end


  def to_s
    return self.name + " [" + self.characterClass + "] " +  self.hp.to_s + "/" + self.hpMax.to_s + " HP - " + self.mp.to_s + "/" + self.mpMax.to_s +  " MP"
  end

	
  def move()
    return self.agility / 10
  end

  #Renvoie true si le coup porté est un coup critique
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
 
  #Choix de l'action
  def chooseAction
    if self.magics.count > 0  and self.items.count > 0
      puts "Utiliser : \n1. une arme \n2. une magie \n3. un item ?"
      choix = gets.to_i
      if choix == 1
        return self.chooseWeapon
      elsif choix == 2
        return self.chooseSpell
      elsif choix == 3
        return self.chooseItem
      else 
        return nil
      end
    elsif self.magics.count > 0 
      puts "Utiliser : \n1. une arme \n2. une magie ?"
      choix = gets.to_i
       if choix == 1
         return self.chooseWeapon
      elsif choix == 2
        return self.chooseSpell
      else
        return nil
      end
    elsif self.items.count > 0
      puts "Utiliser : \n1. une arme \n2. un item ?"
      choix = gets.to_i
       if choix == 1
        return self.chooseWeapon
      elsif choix == 2
        return self.chooseItem
      else
        return nil
      end
    else 
      self.chooseWeapon
    end 
  end

  def chooseWeapon
    if self.weapons.count == 1
      selectedWeapon = self.weapons[0]
      puts "#{selectedWeapon.name} selectionnee"
      puts
      return selectedWeapon
    else
      puts "Quelle arme voulez vous utilisez ?"
      (1..self.weapons.count).each do |i|
        puts "#{i} #{self.weapons[i-1].to_s}"
      end
      puts "#{self.weapons.count + 1} Revenir au menu précédent"
      selectedWeapon = self.weapons[gets.to_i - 1]
      puts "#{selectedWeapon.name} selectionnee"
      puts
      return selectedWeapon
    end
  end

  def chooseSpell
    if self.magics.count == 1
      if self.magics[0].mpcost > self.mp
        puts "Vous n'avez pas assez de points de mana pour utiliser un sort."
        return nil
      end
      selectedSpell = self.magics[0]
      puts "#{selectedSpell.name} selectionne"
      puts
      return selectedSpell
    else
      puts "Quelle magie voulez vous utiliser ?"
      (1..self.magics.count).each do |i|
        puts "#{i} #{self.magics[i-1].to_s}"
      end
      puts "#{self.magics.count + 1} Revenir au menu précédent"
      choice = gets.to_i - 1
      if self.magics[choice].mpcost > self.mp
        puts "Vous n'avez pas assez de points de mana pour utiliser ce sort."
        return nil
      else
        selectedSpell = self.magics[choice]
        puts "#{selectedSpell.name} selectionne"
        puts
        return selectedSpell
      end
    end
  end

  def chooseItem
    puts "Quelle item voulez vous utiliser ?"
      (1..self.items.count).each do |i|
        puts "#{i} #{self.items[i-1].to_s}"
      end
      puts "#{self.items.count + 1} Revenir au menu précédent"
      return self.items[gets.to_i-1]
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

  def useItem(usedItem)
    puts "#{self.name} utilise #{usedItem.name}"
    gets
    usedItem.quantite -= 1
      if usedItem.quantite == 0
        self.items.delete(usedItem)
        self.items.compact!
      end
    return 1
  end
end