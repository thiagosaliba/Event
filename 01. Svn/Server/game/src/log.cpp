// 1) Search: void LogManager::InvalidServerLog(enum eLocalization eLocaleType, const char* pcszIP, const char* pszRevision)
// 2) Before this make a new line and paste:
#ifdef __KINGDOMS_WAR__
void LogManager::KingdomsWarLog(const char * c_pszText)
{
	m_sql.EscapeString(__escape_hint, sizeof(__escape_hint), c_pszText, strlen(c_pszText));
	Query("INSERT INTO kingdoms_war%s (action, time) VALUES('%s', NOW())", get_table_postfix(), __escape_hint);
}
#endif