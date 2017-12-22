module CharactersHelper
	def feat_uses_display(feat)
		if feat.uses != 'custom'
			feat.uses
		else
			text = @character.trainings.where(:feat_id => feat).first.custom_uses_count || 'edit'
			link_to(text, edit_feat_uses_character_path(@character,:feat_id => feat.id, :player_id => @player.id))
		end
	end

	def feat_notes_display(feat)
		# custom_note = @character.trainings.where(:feat_id => feat).first.notes
		if has_notes(feat)
			note_indicator = "Y"
		else
			note_indicator = "N"
		end
		link_to(note_indicator, edit_feat_uses_character_path(@character,:feat_id => feat.id, :player_id => @player.id))
	end

	def has_notes(feat)
		custom_note = @character.trainings.where(:feat_id => feat).first.notes
		if custom_note.nil? || custom_note.length < 1
			false
		else
			true
		end
	end

	def feat_use_counter(feat)
		count = 0
		case feat.uses
			when "NA"
				# Do nothing
			when "custom"
				custom_count = @character.trainings.where(:feat_id => feat).first.custom_uses_count || 0
				if custom_count > 0 
					count = custom_count.to_i
				end
			else
				count = feat.uses.to_i
		end
		count > 0 ? count : nil
	end
end
