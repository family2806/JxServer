SKILLTYPE = 670;
SKILLLEVEL2 = 5;
SKILLLEVEL3 = 0;
SKILLEFECT = "在10秒内增加转移速度";

function main()
	AddSkillState(SKILLTYPE, SKILLLEVEL2, SKILLLEVEL3, 10 * 18); --第二个参数是技能的级别；
	Msg2Player("<#>您获得 <color=0xB5FDD7>"..SKILLEFECT.."<color>");
end
