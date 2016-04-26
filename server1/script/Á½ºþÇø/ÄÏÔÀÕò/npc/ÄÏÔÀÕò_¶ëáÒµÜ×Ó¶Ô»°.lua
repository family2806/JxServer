--两湖区 南岳镇 峨嵋弟子对话

function main(sel)
Talk(4, "select", "峨嵋弟子：天下女子所创的门派中，以本派为第一。", "本派弟子均为女子，不仅武功高强，而且多才多艺，琴棋书画无所不精。", "有人说江湖是男人的世界，但是本派却能够与少林武当鼎立，因此武林中人无不敬本门弟子三分。", "本派只收女弟子。");
end;

function select()
Say("峨嵋弟子：你想加入本派吗？", 2, "加入/yes", "不加入/no");
end;


function yes()
if (GetSeries() ~= 2) then								--如果玩家不属于水系
	Say("峨嵋弟子：你不属于水系，不能加入本派。", 0)
else
	if (GetFaction() ~= "") then							--如果玩家已经属于水系的某一门派
		Say("峨嵋弟子：只有不属于任何门派的人，才能加入本派。", 0)
	else	
		if (GetLevel() >= 10) then						--等级达到十级
			if ( GetSex() == 0 ) then     					--如果玩家性别为男
				Say("峨嵋弟子：本门只收女弟子。", 0)
			else								--玩家性别为女
    				SetFaction("峨嵋派")       				--玩家加入峨嵋派
    				NewWorld(13, 1867, 5021)				--把玩家传送到门派入口	
				SetFightState(1)					--玩家转换成战斗状态
    				SetRevPos(13)		  				--设置重生点
    				SetTask(1, 10)
    				Say("欢迎你加入峨嵋派！",0)  
			end
		else
			Say("峨嵋弟子：你等级不够，切勿操之过急。修练到十级之后再来找我吧！", 0)	
		end
	end
end;			
end;

function no()
end;


