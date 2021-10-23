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
Feat.create("name"=>"Arcane Recovery", "use_type"=>"Action", "description"=>"<p>Once per day when you finish a short rest, you can recover spell slots - up to a combined level of 1/2 your wizard level, and none of the slots can be 6th level or higher.</p>", "uses"=>"1", "reset"=>"Long Rest")
Feat.create("name"=>"Background: Wanderer", "use_type"=>"Passive", "description"=>"<p>You have an excellent memory for maps and geography, and you can always recall the general layout of terrain, settlements, and other features around you. In addition, you can find food and fresh water for yourself and up to five other people each day, provided that the land offers berries, small game, water, and so forth.</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Darkvision", "use_type"=>"Passive", "description"=>"<p>You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light.</p><p>You can't discern color in darkness, only shades of gray</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Fey Ancestry", "use_type"=>"Passive", "description"=>"<p>You have advantage on saving throws against being charmed, and magic can't put you to sleep.</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Mask of the Wild", "use_type"=>"Passive", "description"=>"<p>You can attempt to hide even when you are only lightly obscured by foliage, heavy rain, falling snow, mist, and other natural phenomena.</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Ranger: Favored Enemy", "use_type"=>"Passive", "description"=>"<p>You have advantage on Wisdom (Survival) checks to track your favored enemies, as well as on Intelligence checks to recall information about them.</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Ranger: Favored Terrain", "use_type"=>"Passive", "description"=>"<p>When you make an Intelligence or Wisdom check related to your favored terrain, your proficiency bonus is doubled if you are using a skill that you're proficient in.</p><p><br></p><p>While traveling for an hour or more in your favored terrain, you gain the following benefits:</p><p><br></p><ul><li>Difficult terrain doesn't slow your group's travel.</li><li>Your group can't become lost except by magical means.</li><li>Even when you are engaged in another activity while traveling (such as foraging, navigating, or tracking), you remain alert to danger.</li><li>If you are traveling alone, you can move stealthily at a normal pace.</li><li>When you forage, you find twice as much food as you normally would.</li><li>While tracking other creatures, you also learn their exact number, their sizes, and how long ago they passed through the area.</li></ul>", "uses"=>"NA", "reset"=>"N\\A")
Feat.create("name"=>"Trance", "use_type"=>"Passive", "description"=>"<p>Elves don't need to sleep. Instead, they meditate deeply, remaining semiconscious, for 4 hours a day.</p><p>After resting in this way, you gain the same benefit that a human does from 8 hours of sleep.</p><p><br></p>", "uses"=>"NA", "reset"=>"N\\A")


# seed spells
Spell.create("name"=>"Blade Ward", "level"=>0, "school"=>"Abjuration", "casting_time"=>"Action", "range"=>"Self", "components"=>"V,S", "duration"=>"1 round", "description"=>"<p><em>You extend your hand and trace a sigil of warding in the air. </em></p><p><br></p><p>Until the end of your next turn, you have <strong>resistance </strong>against bludgeoning, piercing, and slashing damage dealt by weapon attacks.</p>", "ritual"=>false)
Spell.create("name"=>"Burning Hands", "level"=>1, "school"=>"Evocation", "casting_time"=>"Action", "range"=>"Self (15' cone)", "components"=>"V,S", "duration"=>"Instantaneous", "description"=>"<p><em>As you hold your hands with thumbs touching and fingers spread, a thin sheet of flames shoots forth from your outstretched fingertips.</em> </p><p><br></p><p>Each creature in a 15-foot cone must make a <strong>Dexterity saving throw</strong>. A creature takes <strong>3d6 fire damage on a failed save, or half as much damage on a successful one.</strong></p><p><br></p><p>The fire ignites any flammable objects in the area that aren't being worn or carried.</p><p><br></p><p><strong>At Higher Levels.</strong> When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d6 for each slot level above 1st.</p>", "ritual"=>false)
Spell.create("name"=>"Expeditious Retreat", "level"=>1, "school"=>"Transmutation", "casting_time"=>"Bonus Action", "range"=>"Self", "components"=>"V,S", "duration"=>"Concentration, up to 10 minutes", "description"=>"<p>This spell allows you to move at an incredible pace. When you cast this spell, and then as a bonus action on each of your turns until the spell ends, you can take the Dash action.</p>", "ritual"=>false)
Spell.create("name"=>"Fire Bolt", "level"=>0, "school"=>"Evocation", "casting_time"=>"Action", "range"=>"120 feet", "components"=>"V,S", "duration"=>"Instantaneous", "description"=>"<p><em>You hurl a mote of fire at a creature or object within range</em>. </p><p><br></p><p>Make a <strong>ranged spell attack</strong> against the target. </p><p>On a hit, the target takes <strong>1d10 fire damage</strong>. </p><p><br></p><p>A flammable object hit by this spell ignites if it isn't being worn or carried.</p><p><br></p><p>This spell's damage increases by 1d10 when you reach 5th level (2d10), 11th level (3d10), and 17th level (4d10).</p>", "ritual"=>false)
Spell.create("name"=>"Light", "level"=>0, "school"=>"Evocation", "casting_time"=>"Action", "range"=>"Touch", "components"=>"V,M (a firefly or phosphorescent moss)", "duration"=>"1 hour", "description"=>"<p>You touch one object that is no larger than 10 feet in any dimension. </p><p><br></p><p>Until the spell ends, the object sheds <strong>bright light in a 20-foot radius and dim light for an additional 20 feet.</strong>  The light can be colored as you like. Completely covering the object with something opaque blocks the light. The spell ends if you east it again or dismiss it as an action.</p><p><br></p><p>If you target an object held or worn by a hostile creature, that creature must succeed on a Dexterity saving throw to avoid the spell.</p>", "ritual"=>false)
Spell.create("name"=>"Mage Armor", "level"=>1, "school"=>"Abjuration", "casting_time"=>"Action", "range"=>"Touch", "components"=>"V,S,M (a piece of cured leather)", "duration"=>"8 hours", "description"=>"<p>You touch a willing creature who isn't wearing armor, and a protective magical force surrounds it until the spell ends. The target's <strong>base AC becomes 13 + its Dexterity modifier.</strong> The spell ends if the target dons armor or if you dismiss the spell as an action.</p>", "ritual"=>false)
Spell.create("name"=>"Magic Missile", "level"=>1, "school"=>"Evocation", "casting_time"=>"Action", "range"=>"120 feet", "components"=>"V,S", "duration"=>"Instantaneous", "description"=>"<p>You create <strong>three glowing darts </strong>of magical force. Each dart hits a creature of your choice that you can see within range. A dart deals <strong>1d4 + 1 force damage</strong> to its target. The darts all strike simultaneously, and you can direct them to hit one creature or several.</p><p><br></p><p><strong>At Higher Levels.</strong> When you cast this spell using a spell slot of 2nd level or higher, the spell creates one more dart for each slot level above 1st.</p>", "ritual"=>false)
Spell.create("name"=>"Prestidigitation", "level"=>0, "school"=>"Transmutation", "casting_time"=>"Action", "range"=>"10 feet", "components"=>"V,S", "duration"=>"1 hour", "description"=>"<p>This spell is a minor magical trick that novice spellcasters use for practice. You create one of the following magical effects within range:</p><p><br></p><ul><li>You create an instantaneous, harmless sensory effect, such as a shower of sparks, a puff of wind, faint musical notes, or an odd odor.</li><li>You instantaneously light or snuff out a candle, a torch, or a small campfire.</li><li>You instantaneously clean or soil an object no larger than 1 cubic foot.</li><li>You chill, warm, or flavor up to 1 cubic foot of nonliving material for 1 hour.</li><li>You make a color, a small mark, or a symbol appear on an object or a surface for 1 hour.</li><li>You create a non-magical trinket or an illusory image that can fit in your hand and that lasts until the end of your next turn.</li></ul><p><br></p><p>If you cast this spell multiple times, you can have up to three of its non-instantaneous effects active at a time, and you can dismiss such an effect as an action.</p>", "ritual"=>false)
Spell.create("name"=>"Shield", "level"=>1, "school"=>"Abjuration", "casting_time"=>"Reaction", "range"=>"Self", "components"=>"V,S", "duration"=>"1 round", "description"=>"<p>An invisible barrier of magical force appears and protects you. Until the start of your next turn, you have a <strong>+5 bonus to AC</strong>, including against the triggering attack, and you take no damage from magic missile.</p>", "ritual"=>false)
Spell.create("name"=>"Sleep", "level"=>1, "school"=>"Enchantment", "casting_time"=>"Action", "range"=>"90 feet", "components"=>"V,S,M (a pinch of fine sand, rose petals, or a cricket)", "duration"=>"1 minute", "description"=>"<p>This spell sends creatures into a magical slumber. Roll 5d8; the total is how many hit points of creatures this spell can affect. Creatures within 20 feet of a point you choose within range are affected in ascending order of their current hit points (ignoring unconscious creatures).</p><p><br></p><p>Starting with the creature that has the lowest current hit points, each creature affected by this spell falls unconscious until the spell ends, the sleeper takes damage, or someone uses an action to shake or slap the sleeper awake. Subtract each creature's hit points from the total before moving on to the creature with the next lowest hit points. A creature's hit points must be equal to or less than the remaining total for that creature to be affected.</p><p><br></p><p>Undead and creatures immune to being charmed aren't affected by this spell.</p><p><br></p><p><strong>At Higher Levels</strong>. When you cast this spell using a spell slot of 2nd level or higher, roll an additional 2d8 for each slot level above 1st.</p>", "ritual"=>false)
