// 1) Search: #include "DragonLair.h"
// 2) After this make a new line and paste:
#ifdef __NEW_EVENTS__
	#include "new_events.h"
#endif


// 1) Search:
/*
	if (IsMonster() == true && 2493 == GetMobTable().dwVnum)
	{
		if (NULL != pkKiller && NULL != pkKiller->GetGuild())
		{
			CDragonLairManager::instance().OnDragonDead( this, pkKiller->GetGuild()->GetID() );
		}
	}
*/
// 2) After this make a new line and paste:
	#ifdef __KINGDOMS_WAR__
	if (GetMapIndex() == KingdomsWar::MAP_INDEX)
	{
		if ((pkKiller) && (IsPC()) && (pkKiller->IsPC()))
		{
			if (pkKiller->GetEmpire() != GetEmpire())
				CMgrKingdomsWar::instance().OnKill(pkKiller->GetPlayerID(), pkKiller->GetEmpire(), GetPlayerID(), GetEmpire());
		}
	}
	#endif