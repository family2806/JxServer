Include("\\script\\battles\\battlehead.lua")
BALANCE_MAMCOUNT = 5
strbattleinfo=
{
	"军需官：宋金大战有以下几种模式规则，您想要了解……",
	"你想了解什么呢？",
	"宋金大战相关道具/info_sjthing",
	"宋金积分的获得/info_adduppoint2",--版调用info_adduppoint2
	"怎样查看即时战报/info_reportface",
	"宋金战场的注意事项/info_note",
	"我都知道了，谢谢！/cancel",
	"即时战报界面说明：玩家处于宋金战场时，可以使用～键（tab键上面的那个键）打开和关闭即时战报界面，玩家可以随时在这个界面看到自己和前10名玩家的详细战报。",--即时战报界面
--	"玩家宋金信息界面说明：点击F12键，玩家可以看到自己在宋金大战中的详细统计信息。当前战役信息——玩家在当前战役周期内的具体表现；历史信息——玩家所参加的所有战役的累计信息。<enter>Crtl+鼠标右键点击其他玩家，再选择宋金信息，可以查看其他玩家的宋金大战信息。"--玩家宋金信息界面
}


function help_sjbattle()--两种夺旗规则
	Say(strbattleinfo[1],5,"固定夺旗模式规则/info_fixation1","随机夺旗模式规则/info_random1","元帅保卫模式规则/info_marshal","宋金大战其他相关信息/help_more","我已经很清楚了，谢谢！/cancel")
end


function help_more()--宋金大战其他相关信息
	Say(strbattleinfo[2],5,strbattleinfo[3],strbattleinfo[4],strbattleinfo[5],strbattleinfo[6],strbattleinfo[7])
end

function info_book()--宋金诏书
	Say("宋金诏书：使用宋金诏书可以直接进入宋金大战报名点。玩家可以在七大城市的杂货店购买，价格<color=yellow>5000<color>两。",2,"了解战役其他信息/help_more","恩，我知道了/cancel")
end
function info_flag()
	Say("旗标：宋金大战夺旗模式必备物品。持旗玩家未到达插旗目的地时使用会提示目的地坐标，旗标不会消耗；到达后使用便成功的达成夺旗，并且消耗掉旗标。玩家需要在宋金战场内的军需官处购买，价格<color=yellow>5000<color>两。",2,"了解其他详细信息。/help_more","恩，我知道了。/cancel")
end

function info_sjthing()
	Say("宋金大战相关道具：",3,"旗标/info_flag","宋金诏书/info_book","谢谢，我知道了。/cancel")
end

stradduppointhelp=
{
--	"积分说明：玩家获得的积分不仅取决于自己在战场中的功绩，还取决于战友的表现和双方的人数。每个人获得的积分都会分成给自己的战友一部分。",
	"玩家在宋金大战中杀死各级别NPC、PK玩家、连斩、获取宝物、完成夺旗、取得战争的胜利都将获得相应的积分奖励。<enter>玩家可以在宋金大战未开战时，在宋金大战报名点军需官处用积分购买宋金大战专用道具。正式开战后不能购买宋金专用物品。",
	"双方的人数是平衡积分的重要因素，人数多的一方获得的积分会按比例衰减。也就是说虽然人数占优方在战场上会有一定的优势，但获得的积分可能会比较低。",
	"有效连斩积分：玩家双方官衔相差三级以内计入有效连斩。三次有效连斩可以获得一定的积分奖励。",
	"玩家在战斗过程中，根据当前获得的积分多少也可以获得不同的头衔。玩家进入宋金时，官衔为士兵，积分达到1000分官衔提升为校尉，积分达到3000分官衔提升为统领，积分达到6000分官衔提升为副将，积分达到10000分官衔提升为大将。",
	"战斗结束后，根据战场的胜负，玩家会获得不同的奖励。获胜方每人声望加3点，并且获得随机道具一件和1000点额外积分奖励；战败方每人获得300点积分；若战平，双方每人获得500点积分。但积分奖励会根据双方人数多少而有加成或衰减。",
	
}

function info_adduppoint2()--积分获得
	Say(stradduppointhelp[1],3,"下一页/info_adduppoint2_1","了解其他详细信息/help_more","恩，我知道了/cancel")
end

function info_adduppoint2_1()
	Say(stradduppointhelp[2],3,"下一页/info_adduppoint2_2","了解其他详细信息/help_more","恩，我知道了/cancel")
end

function info_adduppoint2_2()
	Say(stradduppointhelp[3],3,"下一页/info_adduppoint2_3","了解其他详细信息/help_more","恩，我知道了/cancel")
end

function info_adduppoint2_3()
	Say(stradduppointhelp[4],3,"下一页/info_adduppoint2_4","了解其他详细信息/help_more","恩，我知道了/cancel")
end

function info_adduppoint2_4()
	Say(stradduppointhelp[5],2,"了解其他详细信息/help_more","恩，我知道了/cancel")
end



function info_reportface()--即时战报界面
	Say(strbattleinfo[8],2,"了解其他详细信息/help_more","恩，我知道了/cancel")
end


strinfo_note=
{
	"注意事项：玩家进入宋金战场时，会处于宋金双方的后营中。玩家可以从后营进入大营，但在正式开战前不能离开大营范围。正式开战后，玩家可以进入野外战场，也可以从大营返回后营，但不能进入敌方的后营。",--在后营的玩家不会记入积分统计。",
	"当玩家夺得帅旗处于持旗状态时，不能进入后营购买药品和打开储物箱。"--<enter>要注意在宋金大战结束前5分钟，会关闭宋金大战战场入口和战场中的后营出入口。处于后营的玩家可以下线离开战场，但是离开战场的玩家不会记入积分统计。",
}
function info_note()
	Say(strinfo_note[1],1,"下一页/info_note1")	
end

function info_note1()
	Say(strinfo_note[2],2,"了解其他详细信息/help_more","恩，我知道了/cancel")
end

strfixationhelp=
{
	"固定夺旗模式规则：宋金大战开战时，双方的第一面帅旗（为举旗士兵形象，旗上写着“宋”或“金”的大字）会在各自的大营范围内出现。玩家需要点击本方的举旗士兵，变身为持旗玩家，同时获知位于对方大营内的目的地坐标，并在小地图出现指示线。",
	"玩家此后也可以通过使用<color=red>旗标<color>确认目的地坐标。当该玩家成功到达对方大营中的目的地，使用<color=red>旗标<color>便成功达成夺旗。当持旗玩家在途中被对方杀死，帅旗会停留在该玩家死亡地点，夺旗方其他玩家可以继续夺旗。",
	"当本方帅旗被成功送达对方大营，则会在本方大营范围内重新生成一面新的帅旗。最后判定胜负的条件就是双方的夺旗数量。"
}
function info_fixation1()--固定夺旗规则1
	Say(strfixationhelp[1],1,"下一页/info_fixation2")
end

function info_fixation2()--固定夺旗规则2
	Say(strfixationhelp[2],1,"下一页/info_fixation3")
end

function info_fixation3()
	Say(strfixationhelp[3],2,"了解其他详细信息/help_sjbattle","恩，我知道了/cancel")
end


strrandomhelp=
{
	"随机夺旗模式规则：宋金大战开战时，在大营和野外战场，会随机出现若干面帅旗（为举旗士兵形象，旗上写着“帅”字），玩家点击该举旗士兵，变身为持旗玩家，同时获知目的地坐标，并在小地图出现指示线。玩家此后也可以通过使用<color=red>旗标<color>确认目的地坐标。",
	"当该玩家成功到达目的地，使用<color=red>旗标<color>便成功达成夺旗。当持旗玩家在途中被对方杀死，帅旗会停留在该玩家死亡地点，其他玩家可以继续夺旗。最后判定胜负的条件就是双方的夺旗数量。",
}
function info_random1()--随机夺旗规则1
	Say(strrandomhelp[1],1,"下一页/info_random2")
end

function info_random2()
	Say(strrandomhelp[2],2,"了解其他详细信息/help_sjbattle","恩，我知道了/cancel")
end

strmarshalhelp="元帅保卫模式规则：宋金正式开战后，宋、金双方玩家即可冲向前线杀敌。开战后半小时总积分小的一方产生元帅，另一方的元帅于十分钟后产生；若开战后半小时双方总积分相等则同时产生双方元帅。这时候的目标是对方的元帅，谁杀死对方的元帅即可获得战争的胜利。如果在战役结束没有杀死对方的元帅，则根据双方总积分判断胜负。"

function info_marshal()
	Say(strmarshalhelp, 2, "了解其他详细信息/help_sjbattle","恩，我知道了/cancel")
end

TIMELIST = "10:50,12:50,14:50,16:50,18:50,20:50,22:50"
strbt_info=
{
	"宋金大战战场位置/bt_infoaddress",
	"宋金大战开放时间/bt_infotime",
	"宋金大战报名条件/bt_infoneed",
	"宋金大战报名规则/bt_infobaomingrule",
	"宋金大战必须物品/bt_infoflag",
	"宋金大战相关道具/bt_infothing",
	"宋金大战报名点新增功能/bt_infonew",
	"宋金大战场位于襄阳与朱仙镇之间。参战者可以自由选择前往宋金战场的2个入口点报名，宋方入口点在襄阳北面，金方入口点在朱仙镇的南面。",
	format("宋金战场正式报名在%s. 报名时间为%d 分钟, 系统会连续通报. <enter>战斗时间为%d 分钟, 每%d 分钟系统会公布情况. 如果到了报名时间，参加人数还不够, 玩家依然可以继续报名.",TIMELIST, BAOMING_TIME, FIGHTING_TIME, ANNOUNCE_TIME),
--	"宋金战场将于每天11：00、13：00、15：00、17：00、19：00、21：00、23：00准时开放报名（系统广播滚动通知），报名时间为30分钟。<enter>报名结束后正式开战，战斗时间为60分钟，每20秒公布一次战况。报名结束后若参战人数未达到上限，则可继续报名进入战场。",
	"玩家需达到或超过<color=yellow>40<color>级才可报名。报名时需交纳报名费<color=yellow>3000<color>两。宋金大战分三个等级：初级战场，40级～59级；中级战场，60级～89级；高级战场，90级以上。不同等级玩家会进入相应等级战场。",
	"报名人数上限：<color=yellow>400<color>人。战役开始后若参战人数未达到上限，则可继续报名进入战场。但是，一方如果超过另一方<color=yellow>"..BALANCE_MAMCOUNT.."人<color>，则玩家不能继续报名参加该方，须等人数差小于<color=yellow>"..BALANCE_MAMCOUNT.."人<color>才可继续报名该方。",
	"报名规则：在新一次战役周期（一次战役历时一星期）开始后玩家上一周战役的积分被清零。报名参加本次战局后不能更换阵营，须等下一场战局开始后可以再次选择参加阵营。",--报名时玩家需要权衡双方人数因素，系统会自动根据双方人数的多少调节积分。人数占优方的积分将有衰减，人数劣势方的积分将有加成。",
	"报名点新增功能：进入报名点后大战正式开始以前,玩家可以在宋金报名点的军需官处用宋金积分购买宋金专用道具。但是，大战期间就不能再购买了。",
}
function bt_onbattleinfo()
	Say(strbattleinfo[2],9,"宋金大战详细规则/bt_infohelprule",strbt_info[1],strbt_info[2],strbt_info[3],strbt_info[4],strbt_info[5],strbt_info[6],strbt_info[7],"我很清楚了，谢谢！/cancel")
end


function bt_infoaddress()--宋金大战场位置
	Say(strbt_info[8],2,"了解战役其他信息/bt_onbattleinfo","恩，我知道了/cancel")
end

function bt_infotime()--宋金时间
	Say(strbt_info[9],2,"了解战役其他信息/bt_onbattleinfo","恩，我都知道了/cancel")
end

function bt_infoneed()--报名需求
	Say(strbt_info[10],3,"下一页/bt_infoneed1","了解战役其他信息/bt_onbattleinfo","恩，我都知道了/cancel")
end

function bt_infoneed1()--报名需求
	Say(strbt_info[11],2,"了解战役其他信息/bt_onbattleinfo","恩，我都知道了/cancel")
end

function bt_infobaomingrule()
	Say(strbt_info[12],2,"了解战役其他信息/bt_onbattleinfo","恩，我都知道了/cancel")
end


function bt_infonew()--报名点新增功能
	Say(strbt_info[13],2,"了解战役其他信息/bt_onbattleinfo","恩，我都知道了/cancel")
end

function bt_infothing()--宋金大战道具
	Say("宋金大战相关道具：",3,"旗标/bt_infoflag","宋金诏书/bt_infobook","谢谢，我知道了。/cancel")
end

function bt_infobook()--宋金诏书
	Say("宋金诏书：使用宋金诏书可以直接进入宋金大战报名点。玩家可以在七大城市的杂货店购买，价格<color=yellow>5000<color>两。",2,"了解战役其他信息。/bt_onbattleinfo","恩，我知道了/cancel")
end

function bt_infoflag()--旗标
	Say("旗标：宋金大战夺旗模式必备物品。持旗玩家未到达插旗目的地时使用会提示目的地坐标，不会消耗旗标；到达后使用便成功的达成夺旗，并且消耗掉旗标。玩家需要在宋金战场内的军需官处购买旗标，价格<color=yellow>5000<color>两。",2,"了解其他详细信息/bt_onbattleinfo","恩，我知道了/cancel")
end

function bt_infohelprule()--两种夺旗规则
	Say("宋金大战有以下几种模式规则，您想要了解……",5,"固定夺旗模式规则/info_fixation1","随机夺旗模式规则/info_random1","元帅保卫模式规则/info_marshal","宋金大战其他相关信息/bt_onbattleinfo","我已经很清楚了，谢谢！/cancel")
end

function cancel()
end
