# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create(:user_name => 'testuser', :password => 'test')


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

# seed feats
Feat.create("name"=>"Darkvision", "use_type"=>"Passive", "description"=>"<p>You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light.</p><p>You can't discern color in darkness, only shades of gray</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Fey Ancestry", "use_type"=>"Passive", "description"=>"<p>You have advantage on saving throws against being charmed, and magic can't put you to sleep.</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Trance", "use_type"=>"Passive", "description"=>"<p>Elves don't need to sleep. Instead, they meditate deeply, remaining semiconscious, for 4 hours a day.</p><p>After resting in this way, you gain the same benefit that a human does from 8 hours of sleep.</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Mask of the Wild", "use_type"=>"Passive", "description"=>"<p>You can attempt to hide even when you are only lightly obscured by foliage, heavy rain, falling snow, mist, and other natural phenomena.</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Favored Enemy", "use_type"=>"Passive", "description"=>"<p>You have advantage on Wisdom (Survival) checks to track your favored enemies, as well as on Intelligence checks to recall information about them.</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Favored Terrain", "use_type"=>"Passive", "description"=>"<p>When you make an Intelligence or Wisdom check related to your favored terrain, your proficiency bonus is doubled if you are using a skill that you're proficient in. </p><p><br></p><p>While traveling for an hour or more in your favored terrain, you gain the following benefits: </p><p><br></p><ul><li>Difficult terrain doesn't slow your group's travel. </li><li>Your group can't become lost except by magical means. </li><li>Even when you are engaged in another activity while traveling (such as foraging, navigating, or tracking), you remain alert to danger. </li><li>If you are traveling alone, you can move stealthily at a normal pace. </li><li>When you forage, you find twice as much food as you normally would. </li><li>While tracking other creatures, you also learn their exact number, their sizes, and how long ago they passed through the area. </li></ul>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Background: Wanderer", "use_type"=>"Passive", "description"=>"<p>You have an excellent memory for maps and geography, and you can always recall the general layout of terrain, settlements, and other features around you. In addition, you can find food and fresh water for yourself and up to five other people each day, provided that the land offers berries, small game, water, and so forth.</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")
