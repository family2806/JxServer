--两湖区 南岳镇 天王帮众对话

function main(sel)
Talk(3, "select", "天王帮众：本帮帮主杨瑛在江湖上赫赫有名，别看她是个女子，但是武艺高强，胆识过人，不让须眉，帮里的兄弟们都服她！", "本帮帮众遍布两湖，人多势大，天下无人敢小觑咱们！", "本帮既抗金兵、也反宋廷，兄弟们都是贫苦百姓出身，闯荡江湖也只是为了有条活路。哪个皇帝坐江山，跟咱们可没什么关系！");
end;

function select()
Say("天王帮众：你想加入本帮吗？", 2, "加入/yes", "不加入/no");
end;


function yes()
if (GetSeries() ~= 0) then								--如果玩家不属于金系
	Say("天王帮众：以你的资质和根骨不适合修练本门武功，我们不想误人子弟，你还是另投明师吧！", 0)
else
	if (GetFaction() ~= "") then							--如果玩家已经属于金系的某一门派
		Say("天王帮众：只有不属于任何门派的人，才能加入本帮。", 0)
	else	
		if (GetLevel() >= 10) then						--等级达到十级
			if ( GetSex() == 1 ) then 					--如果玩家性别为女
				Say("天王帮众：本帮帮众都是些粗豪大汉，像你这样娇滴滴的姑娘可不适合本帮。", 0)
			else								-- 玩家性别为男
    				SetFaction("天王帮")       				--玩家加入天王帮
    				--NewWorld(59, 1425, 3472)				--把玩家传送到门派入口
				--SetFightState(1)					--玩家转换成战斗状态	
    				--SetRevPos(21)		  				--设置重生点
    				--SetTask(3, 10)
    				Say("欢迎你加入天王帮！",0)  
			end
		else
			Say("天王帮众：学武之道，欲速则不达。你等级不够，等修练到十级之后再来找我吧！", 0)	
		end
	end
end;			
end;


