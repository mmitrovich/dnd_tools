# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Race.create(name:'Human')
Race.create(name:'Elf')


# seed classes
%w( 
	Barbarian
	Bard
	Cleric
	Druid
	Fighter
	Monk
	Paladin
	Ranger
	Rogue
	Sorceror
	Warlock
	Wizard
).each do |character_class|
	CharacterClass.create(name: character_class)
end

# seed races
%w(
	Dwarf
	Elf
	Halfling
	Human
	Dragonborn
	Gnome
	Half-Elf
	Half-Orc
	Tiefling
).each do |race|
	Race.create(name: race)
end