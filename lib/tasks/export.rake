namespace :export do
  
  desc "Prints Feats.all in a seeds.rb way."
  task :feats => :environment do
    Feat.order(:name).all.each do |feat|
      puts "Feat.create(#{feat.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end

  desc "Prints Spells.all in a seeds.rb way."
  task :spells => :environment do
    Spell.order(:name).all.each do |spell|
      puts "Spell.create(#{spell.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end