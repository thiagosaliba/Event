// 1) Search: bool RecvHSCheckRequest();
// 2) After this make a new line and paste:
#ifdef ENABLE_KINGDOMS_WAR
		bool	RecvKingdomsWarPacket(bool bReturn = false);
#endif