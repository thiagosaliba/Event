// 1) Search: if (IS_SUMMON_ITEM(item->GetVnum()))
// 2) Before this make a new line and paste:
	#ifdef __KINGDOMS_WAR__
	if ((GetMapIndex() == KingdomsWar::MAP_INDEX) && (KingdomsWar::IS_UNACCPETABLE_ITEM(item->GetVnum()) == 1) && (GetGMLevel() == GM_PLAYER))
	{
		#ifdef __MULTI_LANGUAGE_SYSTEM__
		ChatPacket(CHAT_TYPE_INFO, LC_TEXT(GET_LANGUAGE(this), KingdomsWar::MSG[4]));
		#else
		ChatPacket(CHAT_TYPE_INFO, LC_TEXT(KingdomsWar::MSG[4]));
		#endif
		return false;
	}
	#endif