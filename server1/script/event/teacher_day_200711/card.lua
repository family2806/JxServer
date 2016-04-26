--情人节礼盒
--并滚动公告祝福语
IL("SETTING")
TEMPSK_ITEM_PID = 192
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}
tbTeacherDay200711CardBless = 
{
	[1588] = {szName = "师傅贺卡", GreetingWord = "用于给师傅寄祝福语", szBless = "<color=green>%s<color>  祝师傅<color=green>%s<color> 钱财如水，节节攀升."},
	[1589] = {szName = "弟子贺卡", GreetingWord = "用于给弟子寄祝福语", szBless = "<color=green>%s<color> 祝弟子<color=green>%s<color> 学业精通，早日出名."},
	[1590] = {szName = "好友贺卡", GreetingWord = "用于给好友送祝福语", szBless = "<color=green>%s<color> 祝好友<color=green>%s<color> 功成名就，箱满元宝."},
	[1591] = {szName = "仇人贺卡", GreetingWord = "用于给仇人送祝福语", szBless = "<color=green>%s<color> 祝仇人 <color=green>%s<color> 半身不遂，全身不动."},
	[1592] = {szName = "帮会贺卡", GreetingWord = "用于给帮会送祝福语", szBless = "<color=green>%s<color> 祝帮会<color=green>%s<color> 百战百胜，幸运黄金."},
	[1593] = {szName = "教主贺卡", GreetingWord = "用于给教主送祝福语", szBless = "<color=green>%s<color> 祝教主<color=green>%s<color> 武功盖世，一统天下"},
	[1594] = {szName = "师妹贺卡", GreetingWord = "用于给师妹送祝福语", szBless = "<color=green>%s<color> 祝师妹<color=green>%s<color> 漂亮可爱，早日出嫁"},
	[1595] = {szName = "帮主贺卡", GreetingWord = "用于给帮主送祝福语", szBless = "<color=green>%s<color> 祝帮主<color=green>%s<color> 神功护体，天下无敌."},
	[1596] = {szName = "师弟贺卡", GreetingWord = "用于给师弟送祝福语", szBless = "<color=green>%s<color> 祝师弟<color=green>%s<color> 聪明伶俐，早日成亲."},
	[1597] = {szName = "师兄贺卡", GreetingWord = "用于给师兄送祝福语", szBless = "<color=green>%s<color> 祝师兄 <color=green>%s<color> 学到神功，行侠仗义."},
}

function TeacherDay200711_card_main(nParti)
	SetTaskTemp(TEMPSK_ITEM_PID, nParti);
	Say(tbTeacherDay200711CardBless[nParti].GreetingWord, 2,"送给/TeacherDay200711_card_want2present", "撤销/TeacherDay200711_card_OnCancel");
	return 1
end

function TeacherDay200711_card_want2present()
	AskClientForString("TeacherDay200711_card_PlayerSelect", "", 1, 16, "请输入对方名字");
end

function TeacherDay200711_card_PlayerSelect(szRoleName)
	if (ST_CheckTextFilter(szRoleName) ~= 1) then
		Say("对不起，您输入的名字有不合理的字，请再试一次!", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szRoleName, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("对不起，您输入的名字有不合理的字，请再试一次!", 0)
			return
		end
	end
	local nParti = GetTaskTemp(TEMPSK_ITEM_PID)
	if (nParti == 0) then
		return
	end
	SetTaskTemp(TEMPSK_ITEM_PID,0)
	local szBless = format(tbTeacherDay200711CardBless[nParti].szBless,GetName(),szRoleName);	
	if (CalcEquiproomItemCount(6, 1, nParti, -1) >= 1) then
		ConsumeEquiproomItem(1, 6, 1, nParti, -1);
		AddGlobalNews(szBless,1);
		SetTask(TSK_TeacherDay200711_CardUseTime,GetCurServerTime());
	else
		Say(format("没找到%s, 请重试!",tbTeacherDay200711CardBless[nParti].szName), 0)
	end
end

function TeacherDay200711_card_BlessPlayerOnline(szBless)
	
end

function TeacherDay200711_card_OnCancel()
	SetTaskTemp(TEMPSK_ITEM_PID,0)
end