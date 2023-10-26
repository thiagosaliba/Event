""""""
#1) Search:
IsQBHide = 0
#2) Before make a new line and paste:
if app.ENABLE_KINGDOMS_WAR:
	import uikingdomswar
""""""


""""""
#1) Search:
self.wndChatLog = wndChatLog
#2) After make a new line and paste:
		if app.ENABLE_KINGDOMS_WAR:
			self.wndKingdomsWar = uikingdomswar.Window()
""""""


""""""
#1) Search:
		uiChat.DestroyChatInputSetWindow()
#2) After make a new line and paste:
		if app.ENABLE_KINGDOMS_WAR:
			if self.wndKingdomsWar:
				self.wndKingdomsWar.Destroy()
			
			del self.wndKingdomsWar
""""""


""""""
#1) Search:
	def ShowAllQuestButton(self):
		for btn in self.questButtonList:
			btn.Show()
#2) Replace with:
	def ShowAllQuestButton(self):
		if app.ENABLE_KINGDOMS_WAR:
			if self.wndKingdomsWar.IsShow():
				return
		
		for btn in self.questButtonList:
			btn.Show()
""""""


""""""
#1) Search:
if __name__ == "__main__":
#2) Before make a new line and paste:
	if app.ENABLE_KINGDOMS_WAR:
		def ActKingdomsWar(self, act, score1, score2, score3, limitKills, deads, limiDeads, timeRemained):
			if self.wndKingdomsWar:
				if act == 1:
					self.wndKingdomsWar.ShowWindow(score1, score2, score3, limitKills, deads, limiDeads, timeRemained)
					global IsQBHide
					IsQBHide = 1
					for btn in self.questButtonList:
						btn.Hide()
				elif act == 2:
					self.wndKingdomsWar.RefreshScore(score1, score2, score3, limitKills)
				elif act == 3:
					self.wndKingdomsWar.RefreshDeads(deads, limiDeads)
""""""