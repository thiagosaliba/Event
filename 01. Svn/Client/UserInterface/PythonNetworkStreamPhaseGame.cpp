// 1) Search:
/*
			default:
				ret = RecvDefaultPacket(header);
				break;
*/
// 2) Before this make a new line and paste:
#ifdef ENABLE_KINGDOMS_WAR
			case HEADER_GC_KINGDOMSWAR:
				ret = RecvKingdomsWarPacket();
				break;
#endif


// 1) Search: bool CPythonNetworkStream::SendDragonSoulRefinePacket(BYTE bRefineType, TItemPos* pos)
// 2) Before this make a new line and paste:
#ifdef ENABLE_KINGDOMS_WAR
bool CPythonNetworkStream::RecvKingdomsWarPacket(bool bReturn)
{
	TPacketKingdomWar sPacket;
	if (!Recv(sizeof(sPacket), &sPacket))
		return bReturn;
	
	bReturn = true;
	switch (sPacket.bSubHeader)
	{
		case KINGDOMSWAR_SUBHEADER_GC_OPEN:
			{
				PyCallClassMemberFunc(m_apoPhaseWnd[PHASE_WINDOW_GAME], "ActKingdomsWar", Py_BuildValue("(iiiiiiii)", 1, sPacket.iKills[0], sPacket.iKills[1], sPacket.iKills[2], sPacket.iLimitKills, sPacket.iDeads, sPacket.iLimitDeads, sPacket.dwTimeRemained));
			}
			break;
		case KINGDOMSWAR_SUBHEADER_GC_REFRESH:
			{
				if (sPacket.iLimitDeads > 0)
					PyCallClassMemberFunc(m_apoPhaseWnd[PHASE_WINDOW_GAME], "ActKingdomsWar", Py_BuildValue("(iiiiiiii)", 3, sPacket.iKills[0], sPacket.iKills[1], sPacket.iKills[2], sPacket.iLimitKills, sPacket.iDeads, sPacket.iLimitDeads, sPacket.dwTimeRemained));
				else
					PyCallClassMemberFunc(m_apoPhaseWnd[PHASE_WINDOW_GAME], "ActKingdomsWar", Py_BuildValue("(iiiiiiii)", 2, sPacket.iKills[0], sPacket.iKills[1], sPacket.iKills[2], sPacket.iLimitKills, sPacket.iDeads, sPacket.iLimitDeads, sPacket.dwTimeRemained));
			}
			break;
		default:
			TraceError("CPythonNetworkStream::RecvKingdomsWarPacket: unknown subheader %d\n.", sPacket.bSubHeader);
			break;
	}
	
	return bReturn;
}
#endif