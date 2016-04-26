if not EVENTHEAD_LUA then
	Include ("\\script\\event\\eventhead.lua")
end	

TKID_NEWBIELEVELUP = 1080	--���λ��Ҫ�õ�������������
TKVAL_NEWBIELEVELUP_OPEN = 1 --�������Ժ�1080�����������Ϊ1

ENewbieLevelUp = {
	To20Level = function()
		if not validateDate(DATESNEWBIELEVELUP,DATEENEWBIELEVELUP) then
			return
		end
		local level = GetLevel()
		if(level ==1) then
			for i=1,19 do
				AddOwnExp(100000)
			end
			SetTask(TKID_NEWBIELEVELUP,TKVAL_NEWBIELEVELUP_OPEN)
		end
	end,
	PayDoubleExp = function()
		if not validateDate(DATESNEWBIELEVELUP,DATEENEWBIELEVELUP) then
			Talk(1,"","������˼���ʱ���Ѿ�������!")
			return
		end
		local ret = ENewbieLevelUp.validate()
		if(ret ==1) then
			Talk(1,"","������˼����ĵȼ��Ѿ�����60���ˣ�������ȡ2Сʱ˫������.")
			return
		end
		if(ret == 2) then
			Talk(1,"","������˼���㲻����������˲�����ȡ2Сʱ˫������")
			return
		end
		AddSkillState(531,10,1,2*60*60*18)
		AddSkillState(461, 1, 1,2*60*60*18)
		Talk(1,"","��ӭ�μӡ������������������2Сʱ˫������Ľ���")
		Msg2Player("������ȡ2Сʱ˫������Ľ���")
		return
	end,
	validate = function()
		local level = GetLevel()
		if (level > 60) then
			return 1
		end
		local flag = GetTask(TKID_NEWBIELEVELUP)
		if (flag ~= TKVAL_NEWBIELEVELUP_OPEN) then
			return 2
		end
		return 0
	end
}

function BTNNewbieLevelUp()
	local msg = "��ӭ�μӡ������������'."
	local btns = {
		"������ȡ2Сʱ˫������/PayDoubleExp",
		"�˽�˴λ/AboutNewbieLevelUp",
	}
	Say(msg,getn(btns),btns)
end

function PayDoubleExp()
	ENewbieLevelUp.PayDoubleExp() 
end

function AboutNewbieLevelUp()
	local msg = ": ��ڼ䣬ֻҪ����������20������60�����¾Ϳ��Ե���ٴ���ȡ2Сʱ˫������"
	local btns = {
		"����/BTNNewbieLevelUp",
		"�뿪/Quit"
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end
