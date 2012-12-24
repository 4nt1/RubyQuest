#encoding: UTF-8
#coding: UTF-8
require './character'
require './isoldier'
require './ihero'
require './imagician'
require './ibarbarian'
require './iarcher'
require './soldier'
require './hero'
require './magician'
require './barbarian'
require './archer'

class ITeam
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


  def recrute(nbChoisi)
    puts "\e[H\e[2J"
	self.add(IHero.new(File.readlines('./names.txt')[Random.rand(442)].tr("\n","")))
	nbRecrute = 0
	until nbRecrute == nbChoisi
		name = File.readlines('./names.txt')[Random.rand(442)].tr("\n","")
		auHasard = Random.rand(4)
		case auHasard 
			when 0
				self.add(ISoldier.new(name))
				puts "#{name} a ete engage"
				nbRecrute += 1
			when 1
				self.add(IMagician.new(name))
				puts "#{name} a ete engage"
				nbRecrute += 1
			when 2
				self.add(IBarbarian.new(name))
				puts "#{name} a a ete engage"
				nbRecrute += 1
			when 3
				self.add(IArcher.new(name))
				puts "#{name} a ete engage"
				nbRecrute += 1
	    end
	end
	puts
    puts "L'equipe ennemie se compose de :"
    self.characters.each do |c|
      puts c.to_s
	end
	gets.chomp
  end
end
	
	
	
