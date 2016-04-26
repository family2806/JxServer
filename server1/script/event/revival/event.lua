Include ("\\script\\event\\eventhead.lua")
TSK_REVIVAL_AWARD = 2306
TSK_REVIVAL_Nmsg = 2307
function onRevival_Player()
	local tbOpp = {"<#>�˽⽭���/OnHelp_Revival", "<#> ��ֻ��������/OnCancel"}
	if (GetTask(TSK_REVIVAL_AWARD) > 0) then
		tinsert(tbOpp, 1, "<#> ��ȡ���������/revival_want2takegift")
	end
	Say("<#>��������Ϊ�˸�л���������ǣ���׼�����������������͸���λ�����������ҳ<color=yellow>www.volam.com.vn<color>.", getn(tbOpp), tbOpp)
end

function revival_want2takegift()
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		Say("<#>��������Ҫ�͸���<color=yellow>48Сʱ˫������<color>,���ھ�����?",2, "�ǵ�, ��Ҫ��./revival_sure2takegift", "������һ������!/OnCancel")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		Say("<#> ��������Ϊ��׼����<color=yellow>һ�����غ��, 200����,48Сʱ˫������<color>, ������ȡ��?",2, "�ǵ�, ��Ҫ��./revival_sure2takegift", "������һ������!/OnCancel")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		Say("<#> ��������Ϊ��׼����<color=yellow>һ�����غ��, 200����,48Сʱ˫������<color>, ������ȡ��?",2, "�ǵ�, ��Ҫ��./revival_sure2takegift", "������һ������!/OnCancel")

	else
		print("task error!! revival_player event")
	end
end

function revival_sure2takegift()
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
		AddItem(6,1,402,1,0,0,0)	--���ش���
		AddOwnExp(2000000)
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
		AddEventItem(random(540, 942))	--�ƽ���Ƭ
		AddOwnExp(5000000)
	end
	Say("<#> ����������ĺ���ϸ��������˽���ҳ�������!",0)
end

function OnHelp_Revival()
	revival_onhelp_1()
end
function revival_onhelp_1()
	Say("<#> ��ҵĵȼ�����80����һ��û�����ģ�����֮��ɵ�������������48Сʱ˫�����������", 2, "��һҳ/revival_onhelp_2", "֪����/OnCancel")
end
function revival_onhelp_2()
	Say("<#> ��ҵĵȼ���80��120��֮�䣬һ����û�����ģ�����֮��ɵ�������������һ�����غ����200�����48Сʱ˫�����������",  2,"��һҳ/revival_onhelp_3", "֪����/OnCancel")
end
function revival_onhelp_3()
	Say("<#> ��ҵĵȼ���120�����ϣ�һ����û�����ģ�����֮��ɵ�������������һ������Ļƽ�װ����Ƭ��500�����48Сʱ˫�����������?",1, "֪����/OnCancel")
end

function revival_login()
	local nday = tonumber(date("%d"))
	local pre_login_day = GetByte(GetTask(1075), 2)
	if (nday ~= pre_login_day) then
		SetTask(TSK_REVIVAL_Nmsg, 0)
	end
	if (GetTask(TSK_REVIVAL_Nmsg) > 3) then
		return
	end
	SetTask(TSK_REVIVAL_Nmsg, GetTask(TSK_REVIVAL_Nmsg) + 1)
	
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		Msg2Player("Ϊ�˸�л��λ������ʿ������������<color=yellow>8Сʱ˫������<color>. ���ٵ�<color=yellow>��ٴ�<color> ��ȡ!")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		Msg2Player("Ϊ�˸�л��λ������ʿ������������<color=yellow>mһ�����غ����200�����48Сʱ˫������<color>. ���ٵ�<color=yellow>��ٴ�<color> ��ȡ!")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		Msg2Player("Ϊ�˸�л��λ������ʿ������������<color=yellow>һ���ƽ�װ����Ƭ��500�����48Сʱ˫������<color>. ���ٵ�<color=yellow>��ٴ�<color> ��ȡ!")
	end
end

function revival_player(key)
	if REVIVAL_PLAYER then
		if (key >= 7 and GetLevel() < 80) then
			SetTask(TSK_REVIVAL_AWARD, 1)
		elseif (key >= 30 and GetLevel() >= 80 and GetLevel() <= 120) then
			SetTask(TSK_REVIVAL_AWARD, 2)
		elseif (key >= 30 and GetLevel() > 120) then
			SetTask(TSK_REVIVAL_AWARD, 3)
		end
	else
		SetTask(TSK_REVIVAL_AWARD, 0)
	end
end
function OnCancel()
end

if REVIVAL_PLAYER then
	if login_add then login_add(revival_login, 2) end
end
