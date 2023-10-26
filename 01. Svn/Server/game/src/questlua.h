// 1) Search: extern void RegisterDragonSoulFunctionTable();
// 2) After this make a new line and paste:
#ifdef __KINGDOMS_WAR__
	extern void RegisterKingdomsWarFunctionTable();
#endif