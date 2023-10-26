// 1) Search: #include "check_server.h"
// 2) After this make a new line and paste:
#ifdef __NEW_EVENTS__
	#include "new_events.h"
#endif


// 1) Search: if (!start(argc, argv))
// 2) Before this make a new line and paste:
#ifdef __KINGDOMS_WAR__
	CMgrKingdomsWar	kingdoms_war;
#endif