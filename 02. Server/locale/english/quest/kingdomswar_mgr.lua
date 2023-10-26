quest kingdomswar_mgr begin
	state start begin
		when login with not pc.is_gm() begin
			if pc.get_map_index() == kingdoms_war.get_map_index() then
				if game.get_event_flag(kingdoms_war.get_stat_flagname()) == kingdoms_war.get_stat_flag_end() then
					warp_to_village()
				else
					local min_lv = game.get_event_flag(kingdoms_war.get_minlv_flagname())
					local max_lv = game.get_event_flag(kingdoms_war.get_maxlv_flagname())
					if min_lv > 0 and min_lv > pc.get_level() or max_lv > 0 and max_lv < pc.get_level() then
						warp_to_village()
					else
						pc.setqf("is_enough", 0)
						kingdoms_war.register()
					end
				end
			elseif pc.getqf("is_enough") == 1 and game.get_event_flag(kingdoms_war.get_stat_flagname()) == kingdoms_war.get_stat_flag_end() then
				pc.setqf("is_enough", 0)
			end
		end
		
		when 11001.chat."War between kingdoms?" or 11003.chat."War between kingdoms?" or 11005.chat."War between kingdoms?" begin
			say_title(mob_name(11001))
			say("")
			if game.get_event_flag(kingdoms_war.get_stat_flagname()) == kingdoms_war.get_stat_flag_end() then
				say(events_mgr_text[100][5])
				return
			end
			
			if pc.get_map_index() != kingdoms_war.get_map_index() then
				say(events_mgr_text[100][6])
				say("")
				local menu = select(events_mgr_text[100][7], events_mgr_text[100][2])
				if menu == 2 then
					return
				elseif menu == 1 then
					say_title(mob_name(11001))
					say("")
					if pc.getqf("is_enough") == 0 then
						local min_lv = game.get_event_flag(kingdoms_war.get_minlv_flagname())
						local max_lv = game.get_event_flag(kingdoms_war.get_maxlv_flagname())
						if min_lv > 0 and min_lv > pc.get_level() then
							say(string.format(events_mgr_text[100][13], min_lv))
							return
						elseif max_lv > 0 and max_lv < pc.get_level() then
							say(string.format(events_mgr_text[100][14], max_lv))
							return
						end
						
						say(events_mgr_text[100][9])
						wait()
						local empire = pc.get_empire()
						local warp_xy = {[1] = {794100, 958200}, [2] = {799900, 940000}, [3] = {782600, 943100}}
						pc.warp(warp_xy[empire][1], warp_xy[empire][2])
					else
						say(events_mgr_text[100][8])
					end
				end
			else
				say(events_mgr_text[100][41])
				say("")
				local menu = select(events_mgr_text[100][42], events_mgr_text[100][55], events_mgr_text[100][43], events_mgr_text[100][2])
				if menu == 4 then
					return
				end
				
				say_title(mob_name(11001))
				say("")
				if menu == 1 then
					local last = true
					local itemDrop, goldDrop, gold10Drop, expDrop, timeDrop = kingdoms_war.get_priv_reward()
					if timeDrop > 0 then
						say(events_mgr_text[100][46])
						if itemDrop > 0 or goldDrop > 0 or gold10Drop > 0 or expDrop > 0 then
							if itemDrop > 0 then
								say(string.format(events_mgr_text[100][47], itemDrop, timeDrop))
							end
							
							if goldDrop > 0 then
								say(string.format(events_mgr_text[100][48], goldDrop, timeDrop))
							end
							
							if gold10Drop > 0 then
								say(string.format(events_mgr_text[100][49], gold10Drop, timeDrop))
							end
							
							if expDrop > 0 then
								say(string.format(events_mgr_text[100][50], expDrop, timeDrop))
							end
							
							wait()
						else
							last = false
						end
					end
					
					local r_yang = game.get_event_flag(kingdoms_war.get_ryang_flagname())
					local r_item = game.get_event_flag(kingdoms_war.get_ritem_flagname())
					local r_count = game.get_event_flag(kingdoms_war.get_rcount_flagname())
					local t_yang = game.get_event_flag(kingdoms_war.get_tyang_flagname())
					local t_item = game.get_event_flag(kingdoms_war.get_titem_flagname())
					local t_count = game.get_event_flag(kingdoms_war.get_tcount_flagname())
					if r_yang > 0 or r_count > 0 or t_yang > 0 or t_count > 0 then
						say_title(mob_name(11001))
						say("")
						say(events_mgr_text[100][44])
						say(events_mgr_text[100][45])
						wait()
						say_title(mob_name(11001))
						say("")
						if r_yang > 0 then
							say(string.format(events_mgr_text[100][32], r_yang))
						end
						
						if r_count > 0 and r_item > 0 then
							say(string.format(events_mgr_text[100][34], r_count, item_name(r_item)))
						end
						
						if t_yang > 0 then
							say(string.format(events_mgr_text[100][36], t_yang))
						end
						
						if t_count > 0 and t_item > 0 then
							say(string.format(events_mgr_text[100][38], t_count, item_name(t_item)))
						end
						
						last = true
					end
					
					if not last then
						say_title(mob_name(11001))
						say("")
						say(events_mgr_text[100][51])
					end
				elseif menu == 2 then
					local time_limit, kills_limit, killed_limit = kingdoms_war.get_limits()
					say(string.format(events_mgr_text[100][56], time_limit))
					if kills_limit > 0 then
						say(string.format(events_mgr_text[100][57], kills_limit))
					end
					
					say(string.format(events_mgr_text[100][58], killed_limit))
				elseif menu == 3 then
					say(events_mgr_text[100][52])
					local submenu = select(events_mgr_text[100][11], events_mgr_text[100][12])
					if submenu == 2 then
						return
					end
					
					say_title(mob_name(11001))
					say("")
					say(events_mgr_text[100][53])
					wait()
					if pc.can_warp() == false then
						say_title(mob_name(11001))
						say("")
						say(events_mgr_text[100][54])
					else
						kingdoms_war.unregister()
					end
				end
			end
		end
	end
end