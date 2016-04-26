Include([[\script\global\特殊用地\梦境\npc\路人_叛僧.lua]])
Include("\\script\\item\\levelup_item.lua")
Include("\\script\\global\\head_qianzhuang.lua")
Include("\\script\\global\\systemconfig.lua")
IncludeLib("SETTING")

TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr>独孤剑:<link>"
function cg_getnextdate(oldday, num) --获得oldday的第num日的日期，比如060227的第5日为060304
	local nDay = tonumber(oldday)
	local nYear = floor(nDay / 10000)
	local nMonth = floor((nDay - nYear * 10000) / 100)
	nDay = nDay - nYear * 10000 - nMonth * 100 
	nDay = nDay + num
	
	while (nDay > TBMONTH[nMonth]) do
		nDay = nDay - TBMONTH[nMonth]
		if (nMonth == 12) then
			nMonth = 1
			nYear = nYear + 1
		else
			nMonth = nMonth + 1
		end
	end
	return (nYear * 10000 + nMonth * 100 + nDay)
end

function chuangong_main()
	-- VN_MODIFY_20060427
	if (1) then
		Say("数据错误.", 0)
		return
	end
	
	if (gb_GetModule("传功") ~= 1) then
		Say("对不起，传功功能暂时关闭，再次开放时间就关注官方公告!", 0)
		return 
	end
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		Say("独孤剑："..GetName().."好久不见了，今日找我有什么事？",3, "我想打听关于传功的事情。/chuangong_info", "我想取消上次的传功申请!/cg_undo", "我只是来拜访一下盟主你而已。/OnCancel")
	else
		Say("独孤剑："..GetName().."好久不见了，今日找我有什么事？",2, "我想打听关于传功的事情。/chuangong_info", "我只是来拜访一下盟主你而已。/OnCancel")
	end
end

function chuangong_info()
	if (gb_GetModule("传功") ~= 1) then
		Say("对不起，传功功能暂时关闭，再次开放时间就关注官方公告!", 0)
		return 
	end
	local nowday = tonumber(date("%y%m%d"))
	local applytime = GetTask(TV_LAST_APPLY_TIME)
	if (applytime == 0) then
		Describe(strimg.."凡是游历江湖已久，等级从100级到160级的人，我都可以帮他把一身的功力转成一颗'元神丹'，一个10级以下没入门派又没拜过师的人只要吃了这颗'元神丹'便能获得传功人的一身功力，当然一个传完功的人武功也不至于全废，不过也就剩下80级的水平了。而且我能力有限，等级越高的人越难将其武功转化为'元神丹'，比如一个100~120的人物传功时经验会损耗5%，121~150级会损耗10%，而150级以上会损耗20%，<color=yellow>打听这些难道兄弟你想传功？<color>", 2, "是的，我已经游历江湖已久，最近想退隐了。/chuangong_do", "当然不是，只是来打听一下而已。/OnCancel");
	elseif (nowday >= applytime ) then
		Describe(strimg.."传功的准备已经好了."..itemstr..".\n 你确定要传功吗？这一传可就不能回头了啊！<enter>6月20日后将暂时关闭传功申请，6月29日24：00后将暂时关闭传功功能。", 3, "是的，我心意已决。/chuangong_dosure","不，我想取消传功！/cg_undo", "等我再考虑一段日子吧。/OnCancel");
	else
		Describe(strimg.."我正在准备传功所需要的材料，我要到 "..(num2datestr(applytime)).." 之后才能准备好！,", 2, "真是麻烦盟主了，晚辈在此谢过！/OnCancel", "不，我想取消传功！/cg_undo");
	end
end



function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
	return year.."年"..month.."月"..day.."日"
end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then
		Describe(strimg.."我到"..num2datestr(nowday).."就可以准备好帮你传功了，你真的不想传吗？<enter>6月20日后将暂时关闭传功申请，6月29日24：00后将暂时关闭传功功能。",2,"是的，我不想传功了！/cg_undo_sure", "不，我还是要传，刚才一时紧张说错了而已。/OnCancel")
	else
		Describe(strimg.."你没有跟我说过要传功啊。没说过又怎么取消呢？",1,"结束对话/OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.."好吧，那这些材料我先收起来了，如果下次要传的话再准备吧！",1,"谢谢盟主！/OnCancel")
end

function chuangong_do()
	local nEndLevel = GetLevel()
	local nRestExp = GetExp()
	if (nEndLevel < 100) then
		Describe(strimg.."呵呵，这位小兄弟，以你现在的功力似乎还不足以传给别人呢。传功需要<color=yellow>100级<color>以上，你还是去多磨练磨练吧。",1,"好我知道了！/OnCancel")
		return
	end
	if (nEndLevel >= 160) then
		Describe(strimg.."呵呵，这位兄弟，超过160级以上是不能传功的。",1,"好我知道了！/OnCancel")
		return
	end
	
	local nLevelFullExp = tonumber(GetTabFileData(FILE_LEVEL, nEndLevel+ 1, 2))
	local fPerc = format("%.2f", (nEndLevel)+(nRestExp/nLevelFullExp))
	
	local str = strimg.."以你现在的武功修为,如果传功的话将转化为一个<color=yellow>等级:"..fPerc.."<color>的元神丹"
	str = str..client_main(nEndLevel, nRestExp)
	Describe(str..",不过我需要准备一个星期,你在这段期间随时可以来取消传功，毕竟一个人练武到这个程度不容易，请你在这段时间好好考虑考虑吧",2,"盟主，我已决心归隐，您可以开始准备了！/chuangong_doprepair1","这样啊，那我再考虑考虑再来吧。/OnCancel")
end

function chuangong_doprepair1()
	local nowday = tonumber(date("%y%m%d"))
	local nextday = cg_getnextdate(nowday, 7)
	SetTask(TV_LAST_APPLY_TIME , nextday);
	WriteLog("[传功]："..nowday.." Acc:"..GetAccount().."Role:"..GetName().." 提出传功申请！")
	Describe(strimg.."好！那我即刻准备你的传功事宜，一个星期后<color=yellow>"..num2datestr(nextday).."<color>你再来，我给你正式传功！当然你也随时可以来我这里取消传功。", 1,"谢谢盟主，那我一星期后再来！/OnCancel")
	Msg2Player("你已成功申请传功，一周后再来找独孤剑可以正式进行传功，并获得元神丹！也可随时找独孤剑取消传功申请！")
end

function chuangong_dosure()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("你的等级小于100级或超过160级不能传功！",0)
		return
	end
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		Say("对不起，传功时，身上不能装任何的装备，请脱下装备再传功吧！",0)
		return
	end
	Describe(strimg.."传功需要支付2张银票，你是否已经放入背包？这回真得要传功了，你确定要传功吗？",2, "2张银票已经准备好，确定！/chuangong_doit1", "我再考虑一下/OnCancel")
end

function chuangong_doit1()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("你的等级小于100级或超过160级不能传功！",0)
		return
	end
	Describe(strimg.."再确定一次！注意：传功完成后，你的角色将会自动断线。重新登入后，在背包中即会存在元神丹一枚。",2, "确定！/chuangong_doit", "我再考虑一下/OnCancel")
end

function chuangong_doit()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("你的等级小于100级或超过160级不能传功！",0)
		return
	end
	local result = qz_use_silver(2, "［传功］")
	if ( result == 0) then
		Describe(strimg.."你的背包中没有2张银票，我不能给你传功！", 1, "噢，对不起，我回去准备/OnCancel")	
		return
	elseif (result ~= 1) then
		return 
	end
	SetTask(TV_LAST_APPLY_TIME, 0)
	
	local nowday = tonumber(date("%y%m%d"))
	
	local logstr = "[传功]："..nowday.." Acc:"..GetAccount().."Role:"..GetName().." 传功成功！Level:"..GetLevel().." Exp:"..GetExp();
	
	
	DoClearSkillCore()
	DoClearPropCore()
	UpdateSkill()
	local endlevel = GetLevel()
	local restexp = GetExp()
	
	ST_LevelUp(80 - endlevel)
	local param5 = chuangong_item(endlevel, restexp)
	logstr = logstr.." ItemParam5:"..param5
	WriteLog(logstr)
end

function chuangong_item(level,restexp)
	if (restexp <0) then
		restexp = 0
	end
	
	nIt = AddItem(6,1,1061,1,0,0,0)
	SetItemMagicLevel(nIt, 1, level)
	SetItemMagicLevel(nIt, 2, restexp)

	m1 = GetByte(restexp, 3)
	m2 = GetByte(restexp, 4)
	m = m1
	m = SetByte(m1, 2, m2)
	
	n1 = SetByte(restexp, 3,0)
	n =  SetByte(n1, 4, 0)

	SetItemMagicLevel(nIt, 3, m)
	SetItemMagicLevel(nIt, 4, n)
	SetItemMagicLevel(nIt, 5, FileName2Id(GetName()))
	SyncItem(nIt)
	return GetItemParam(nIt, 5)
end

function OnCancel()
end