#encoding: UTF-8
#coding: UTF-8
require './character'
require './soldier'
require './hero'
require './magician'
require './barbarian'
require './archer'
require './isoldier'
require './ihero'
require './imagician'
require './ibarbarian'
require './iarcher'

class Team
    attr_accessor :characters
  def initialize
    @characters = []
  end
  def add(character)
    @characters.push(character)
  end
  def remove(character)
    @characters.delete(character)
  end


  def recrute(nb)
    puts "\e[H\e[2J"
    puts "Quel nom porte le hero ?"
    self.add(Hero.new(STDIN.gets.chomp))
    puts
    puts "#{self.characters[0].name} a ete cree"
    gets

    puts "**********************************"
    puts "*     Recrutez votre equipe      *"
    puts "**********************************"
    puts


    nb.times do |it|
      puts "Equipier #{(it + 1).to_s} / #{nb.to_s}"
      name = File.readlines('./names.txt')[Random.rand(442)].chomp
  	  puts "Voulez vous engager \n1 - un soldat \n2 - un magicien \n3 - un barbare \n4 - un archer"
  	  choix = gets.to_i
  	  case choix 
    		when 1
    			self.add(Soldier.new(name))
    			puts "#{name} a ete engage"
    		when 2
    			self.add(Magician.new(name))
    			puts "#{name} a ete engage"
    		when 3
    			self.add(Barbarian.new(name))
    			puts "#{name} a ete engage"
    		when 4
    			self.add(Archer.new(name))
    			puts "#{name} a ete engage"
    	end
  	  puts	
    end
	puts
    puts "Votre equipe se compose de :"
    self.characters.each do |c|
      puts c.to_s
    end
    gets.chomp
  end
  
end
