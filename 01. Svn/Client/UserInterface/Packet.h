// 1) Search: } TPacketGCDragonSoulRefine;
// 2) After this make a new line and paste:
#ifdef ENABLE_KINGDOMS_WAR
enum
{
	KW_EMPIRE_MAX_NUM = 4,
	HEADER_GC_KINGDOMSWAR = 214,
	KINGDOMSWAR_SUBHEADER_GC_OPEN = 0,
	KINGDOMSWAR_SUBHEADER_GC_REFRESH,
};

typedef struct SPacketKingdomWar
{
	BYTE	bHeader;
	BYTE	bSubHeader;
	int		iKills[KW_EMPIRE_MAX_NUM - 1];
	int		iLimitKills;
	int		iDeads;
	int		iLimitDeads;
	DWORD	dwTimeRemained;
} TPacketKingdomWar;
#endif