// 1) Search: Set(HEADER_GC_DRAGON_SOUL_REFINE,		CNetworkPacketHeaderMap::TPacketType(sizeof(TPacketGCDragonSoulRefine), STATIC_SIZE_PACKET));
// 2) After this make a new line and paste:
#ifdef ENABLE_KINGDOMS_WAR
			Set(HEADER_GC_KINGDOMSWAR, CNetworkPacketHeaderMap::TPacketType(sizeof(TPacketKingdomWar), STATIC_SIZE_PACKET));
#endif