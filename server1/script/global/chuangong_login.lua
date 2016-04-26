Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\head_qianzhuang.lua")
TV_LAST_APPLY_TIME = 1571 -- 上次申请传功时间
TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr>独孤剑:<link>"

function chuangong_login()
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then
			Describe(strimg.."你目前<color=yellow>申请的传功已准备妥当<color>，随时可以来我处传功！", 2, "好，我知道了，到时我会来拜访。/cg_OnCancel", "不，盟主，我不想传功了，我想取消传功申请！/cg_undo");
		else
			Describe(strimg.."你目前<color=yellow>已经申请传功，"..(num2datestr(applytime)).." <color>之后即可传功！", 2, "谢谢盟主提醒，晚辈在此谢过！/cg_OnCancel", "不，盟主，我不想传功了，我想取消传功申请！/cg_undo");
		end
	end
end

function chuangong_msg()
	print("msgmsg")
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then
			Msg2Player("你目前<color=yellow>申请的传功已经准备完成<color=>，随时可以到独孤剑处正式传功！传功需要花费2张银票，请也提前准备好。")
		else
			Msg2Player("你目前<color=yellow>已申请传功，传功时间在"..(num2datestr(applytime)).."<color>之后，传功需要花费2张银票，请也提前准备好。")
		end
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
		Describe(strimg.."我到"..num2datestr(nowday).."就可以准备好帮你传功了，你真的不想传吗？",2,"是的，我不想传功了！/cg_undo_sure", "不，我还是要传，刚才一时紧张说错了而已。/cg_OnCancel")
	else
		Describe(strimg.."你没有跟我说过要传功啊。没说过又怎么取消呢？",1,"结束对话/cg_OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.."好吧，那这些材料我先收起来了，如果下次要传的话再准备吧！",1,"谢谢盟主！/cg_OnCancel")
end

function cg_OnCancel()
		
end

if (GetProductRegion() ~= "vn") then
	login_add(chuangong_msg, 2)
end
