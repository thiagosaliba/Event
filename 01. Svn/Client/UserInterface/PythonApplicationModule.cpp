// 1) Search:
/*
#ifdef ENABLE_COSTUME_SYSTEM
	PyModule_AddIntConstant(poModule, "ENABLE_COSTUME_SYSTEM",	1);
#else
	PyModule_AddIntConstant(poModule, "ENABLE_COSTUME_SYSTEM",	0);
#endif
*/
// 2) After this make a new line and paste:
#ifdef ENABLE_KINGDOMS_WAR
	PyModule_AddIntConstant(poModule, "ENABLE_KINGDOMS_WAR", 1);
#else
	PyModule_AddIntConstant(poModule, "ENABLE_KINGDOMS_WAR", 0);
#endif