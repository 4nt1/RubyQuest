#encoding: UTF-8
#coding: UTF-8
require './team'
require './iteam'

class Battle

	attr_accessor :currentAttacker, :indexEnnemi, :indexHeros, :ennemis, :heros, :currentTarget
  

	def initialize
	    @currentAttacker = nil
	    @indexEnnemi = 0
	    @indexHeros = 0
		@ennemis = nil
		@heros = nil
		@currentTarget = nil
	end

	def start

	    self.heros = Team.new
	    puts "**********************************"
		puts "*    Definissez votre equipe     *"
		puts "**********************************"
		puts
		puts "Combien de personnages  voulez vous recruter ?"
	    self.heros.recrute(gets.to_i)
	    self.ennemis = ITeam.new
	    puts "Combien d'ennemis voulez vous affronter ?"
	    nb = gets.to_i
	    if nb == 0
	    	puts "Vous etes sur ? Ca va etre vite plie cette histoire..."
	    	gets
	    	puts "Alors, combien d'ennemis ? Plus de 0 ce coup ci..."
	    	nb = gets.to_i
	    	if nb == 0
	    		puts "OK, d'accord..."
	    	else
			    self.ennemis.recrute(nb - 1)
				until self.ennemis.characters.count == 0 or self.heros.characters.count == 0
			      self.newround()
			    end
			    puts "La bataille est terminee !!"
			    gets
	    	end
	    else
	    	self.ennemis.recrute(nb - 1)
			until self.ennemis.characters.count == 0 or self.heros.characters.count == 0
		      self.newround()
		    end
		    puts "La bataille est terminee !!"
		    gets
	    end
	end

	def chooseTarget
		puts "Voulez vous cibler : \n1 Un ennemi \n2 Un allie \n3 Revenir au menu précédent"
		choice = gets.to_i
		if choice == 2
			(1..self.heros.characters.count).each do |i|
				puts "#{i} #{self.heros.characters[i-1].to_s}"
			end
			puts "#{self.heros.characters.count + 1} Revenir au menu precedent"
			target = self.heros.characters[gets.to_i-1]
		elsif choice == 3
			target = nil			
		else
			(1..self.ennemis.characters.count).each do |i|
				puts "#{i} #{self.ennemis.characters[i-1].to_s}"
			end
			puts "#{self.ennemis.characters.count + 1} Revenir au menu precedent"
			target = self.ennemis.characters[gets.to_i-1]
			puts target.to_s
		end
		return target
	end
	
	

	def getDamages(item)
		if item.class == Weapon
			damages = self.currentAttacker.power+item.power-self.currentTarget.defense+Random.rand(5)
			self.currentTarget.hp -= damages
			if self.currentAttacker.criticalHit? 
				puts "Coup critique !"
				damages += damages
			end
			puts "#{damages} points de degats !"
			if self.currentTarget.hp > 0
			  puts "#{self.currentTarget.name} a  #{self.currentTarget.hp} points de vie."
			end
			gets
		elsif item.class < Spell
			if item.type == "Attack"
				damages = self.currentAttacker.intelligence+item.power-self.currentTarget.magicDefense+Random.rand(5)
				self.currentTarget.hp -= damages
				puts "#{damages} points de degats !"
				if self.currentTarget.hp > 0
				  puts "#{self.currentTarget.name} a  #{self.currentTarget.hp} points de vie."
				end
				gets
			elsif item.type == "Defense"
				bonus = (self.currentAttacker.intelligence/2) + item.power
				self.currentTarget.hp += bonus
				puts "#{self.currentTarget.name} recupere #{bonus} points de vie !"
			end			
		elsif item.class == Item
			if item.type == "HP"
				self.currentTarget.hp += item.power
				puts "#{self.currentTarget.name} recupere #{bonus} points de vie !"
				if currentTarget.hp > currentTarget.hpMax
					currentTarget.hp = currentTarget.hpMax
				end
			elsif item.type == "MP"
				self.currentTarget.mp += item.power
				puts "#{self.currentTarget.name} recupere #{bonus} points de mana !"
				if currentTarget.mp > currentTarget.mpMax
					currentTarget.mp = currentTarget.mpMax
				end
			end
		end
	end


	def newround()
	  
		#revenir au premier personnage de la team
	    if self.indexHeros > heros.characters.count - 1
	      self.indexHeros = 0
	    end
		
		#definir le personnage actif
	    self.currentAttacker = self.heros.characters[self.indexHeros]
	    puts "\e[H\e[2J"
	    puts "#{self.currentAttacker.to_s} commence son tour"
		gets
		
		# choix d'une arme, d'une magie ou d'un item
		item = nil
		self.currentTarget = nil
		

		begin
			#choix de l'action
			item = self.currentAttacker.chooseAction
			# choix de la cible
			self.currentTarget = self.chooseTarget
			
		end while (item == nil or self.currentTarget == nil)


		if item.class == Weapon
			if self.currentAttacker.slash(item) > self.currentTarget.defend(item)
				self.currentTarget.isHit()
				self.getDamages(item)
			else
				self.currentAttacker.escape
		    end
		elsif item.class < Spell
			if self.currentAttacker.spellCast(item) > self.currentTarget.defend(item)
				self.currentTarget.isHit()
				self.getDamages(item)
			else
				self.currentAttacker.escape
			end
		elsif item.class == Item
			self.getDamages(item)
		end



 		# résultat de l'action
	    if self.currentTarget.hp < 1
	    	puts "#{self.currentTarget.name} est mort !!"
	    	gets
	    	self.ennemis.remove(self.currentTarget)
	    	self.ennemis.characters.compact!
	    end



	    # incrémente l'index heros
	    self.indexHeros +=1

	    # revenir au premier ennemi
	    if self.indexEnnemi > ennemis.characters.count-1
	      self.indexEnnemi = 0
	    end
		self.currentAttacker = self.ennemis.characters[self.indexEnnemi]
		puts "\e[H\e[2J"
		puts "#{self.currentAttacker.to_s} commence son tour"
		gets

		# déterminer la cible
		self.currentTarget = nil
		self.heros.characters.each do |h|
			if h.hp < 11
				self.currentTarget = h
			end
		end
		if self.currentTarget == nil
			self.currentTarget = self.heros.characters[Random.rand(heros.characters.count)]
		end
		
		# déterminer l'item utilisé
		item = self.currentAttacker.chooseAction()
		
		# résoudre l'action
		puts "#{self.currentAttacker.name} attaque #{self.currentTarget.name} !"
		gets

		if item.class == Weapon
			if self.currentAttacker.slash(item) > self.currentTarget.defend(item)
				self.currentTarget.isHit()
				self.getDamages(item)
			else
				self.currentAttacker.escape
		    end
		elsif item.class < Spell
			if self.currentAttacker.spellCast(item) > self.currentTarget.defend(item)
				self.currentTarget.isHit()
				self.getDamages(item)
			else
				self.currentAttacker.escape
			end
		elsif item.class == Item
			self.getDamages(item)
		end
			
		if self.indexEnnemi == self.ennemis.characters.count-1
			self.indexEnnemi = 0
		else
			self.indexEnnemi += 1
		end
	  
		if self.currentTarget.hp < 1
			puts "#{self.currentTarget.name} est mort !"
			gets
			self.heros.remove(self.currentTarget)
			self.heros.characters.compact!
		end
		puts "#{self.currentAttacker.name} finit son tour"
		gets
    end
end

