quest events_mgr begin
	state start begin
		when letter with pc.is_gm() begin
			send_letter(events_mgr_text[0][0])
		end
		
		when button or info with pc.is_gm() begin
			say_title(events_mgr_text[0][0])
			say("")
			local events = select(events_mgr_text[100][0], events_mgr_text[100][2])
			if events == 2 then
				send_letter(events_mgr_text[0][0])
				return
			elseif events == 1 then
				say_title(events_mgr_text[100][0])
				say("")
				local menu = select(events_mgr_text[100][1], events_mgr_text[100][4], events_mgr_text[100][2])
				if menu == 3 then
					send_letter(events_mgr_text[0][0])
					return
				elseif menu == 1 then
					say_title(events_mgr_text[100][0])
					say("")
					if pc.get_channel_id() != kingdoms_war.get_map_ch() then
						say(string.format(events_mgr_text[100][3], kingdoms_war.get_map_ch()))
						wait()
						send_letter(events_mgr_text[0][0])
						return
					end
					
					say(events_mgr_text[100][10])
					local submenu = select(events_mgr_text[100][11], events_mgr_text[100][12])
					say_title(events_mgr_text[100][0])
					say("")
					if submenu == 2 then
						say(events_mgr_text[100][20])
						local min_lv = game.get_event_flag(kingdoms_war.get_minlv_flagname())
						local max_lv = game.get_event_flag(kingdoms_war.get_maxlv_flagname())
						local r_yang = game.get_event_flag(kingdoms_war.get_ryang_flagname())
						local r_item = game.get_event_flag(kingdoms_war.get_ritem_flagname())
						local r_count = game.get_event_flag(kingdoms_war.get_rcount_flagname())
						local t_yang = game.get_event_flag(kingdoms_war.get_tyang_flagname())
						local t_item = game.get_event_flag(kingdoms_war.get_titem_flagname())
						local t_count = game.get_event_flag(kingdoms_war.get_tcount_flagname())
						if min_lv > 0 then
							say(string.format(events_mgr_text[100][21], min_lv))
						else
							say(events_mgr_text[100][22])
						end
						
						if max_lv > 0 then
							say(string.format(events_mgr_text[100][23], max_lv))
						else
							say(events_mgr_text[100][24])
						end
						
						if r_yang > 0 then
							say(string.format(events_mgr_text[100][32], r_yang))
						else
							say(events_mgr_text[100][33])
						end
						
						if r_count > 0 and r_item > 0 then
							say(string.format(events_mgr_text[100][34], r_count, item_name(r_item)))
						else
							say(events_mgr_text[100][35])
						end
						
						if t_yang > 0 then
							say(string.format(events_mgr_text[100][36], t_yang))
						else
							say(events_mgr_text[100][37])
						end
						
						if t_count > 0 and t_item > 0 then
							say(string.format(events_mgr_text[100][38], t_count, item_name(t_item)))
						else
							say(events_mgr_text[100][39])
						end
						
						wait()
						say_title(events_mgr_text[100][0])
						say("")
						say(events_mgr_text[100][25])
						local submenu_agree = select(events_mgr_text[100][11], events_mgr_text[100][12])
						if submenu_agree == 2 then
							send_letter(events_mgr_text[0][0])
							return
						end
						
						say_title(events_mgr_text[100][0])
						say("")
						if not kingdoms_war.start() then
							say(events_mgr_text[1][0])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						else
							say(events_mgr_text[2][0])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						end
					else
						say(events_mgr_text[100][15])
						local min_lv = tonumber(input())
						say_title(events_mgr_text[100][0])
						say("")
						if not min_lv or min_lv == nil or min_lv == "" then
							say(events_mgr_text[100][17])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						end
						
						say(events_mgr_text[100][16])
						local max_lv = tonumber(input())
						say_title(events_mgr_text[100][0])
						say("")
						if not max_lv or max_lv == nil or max_lv == "" then
							say(events_mgr_text[100][17])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						end
						
						say(events_mgr_text[100][26])
						local r_yang = tonumber(input())
						say_title(events_mgr_text[100][0])
						say("")
						if not r_yang or r_yang == nil or r_yang == "" then
							say(events_mgr_text[100][17])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						end
						
						say(events_mgr_text[100][27])
						local r_itemVnum = tonumber(input())
						say_title(events_mgr_text[100][0])
						say("")
						if not r_itemVnum or r_itemVnum == nil or r_itemVnum == "" then
							say(events_mgr_text[100][17])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						elseif item_name(r_itemVnum) == "" and r_itemVnum > 0 then
							say(events_mgr_text[100][40])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						end
						
						local r_itemCount
						if r_itemVnum > 0 then
							say(events_mgr_text[100][28])
							r_itemCount = tonumber(input())
							say_title(events_mgr_text[100][0])
							say("")
							if not r_itemCount or r_itemCount == nil or r_itemCount == "" then
								say(events_mgr_text[100][17])
								wait()
								send_letter(events_mgr_text[0][0])
								return
							end
						else
							r_itemCount = 0
						end
						
						say(events_mgr_text[100][29])
						local t_yang = tonumber(input())
						say_title(events_mgr_text[100][0])
						say("")
						if not t_yang or t_yang == nil or t_yang == "" then
							say(events_mgr_text[100][17])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						end
						
						say(events_mgr_text[100][30])
						local t_itemVnum = tonumber(input())
						say_title(events_mgr_text[100][0])
						say("")
						if not t_itemVnum or t_itemVnum == nil or t_itemVnum == "" then
							say(events_mgr_text[100][17])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						elseif item_name(t_itemVnum) == "" and t_itemVnum > 0 then
							say(events_mgr_text[100][40])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						end
						
						local t_itemCount
						if t_itemVnum > 0 then
							say(events_mgr_text[100][31])
							t_itemCount = tonumber(input())
							say_title(events_mgr_text[100][0])
							say("")
							if not t_itemCount or t_itemCount == nil or t_itemCount == "" then
								say(events_mgr_text[100][17])
								wait()
								send_letter(events_mgr_text[0][0])
								return
							end
						else
							t_itemCount = 0
						end
						
						if not kingdoms_war.config(min_lv, max_lv, r_yang, r_itemVnum, r_itemCount, t_yang, t_itemVnum, t_itemCount) then
							say(events_mgr_text[100][19])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						else
							say(events_mgr_text[100][18])
							wait()
							send_letter(events_mgr_text[0][0])
							return
						end
					end
				elseif menu == 2 then
					say_title(events_mgr_text[100][0])
					say("")
					if pc.get_channel_id() != kingdoms_war.get_map_ch() then
						say(string.format(events_mgr_text[100][3], kingdoms_war.get_map_ch()))
						wait()
						send_letter(events_mgr_text[0][0])
						return
					end
					
					if not kingdoms_war.stop() then
						say(events_mgr_text[3][0])
						wait()
						send_letter(events_mgr_text[0][0])
						return
					else
						say(events_mgr_text[4][0])
						wait()
						send_letter(events_mgr_text[0][0])
						return
					end
				end
			end
		end
	end
end