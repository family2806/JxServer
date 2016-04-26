
-- �ν�����	��������
-- lixin 2004-12-13
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\system\\task_string.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\global\\�����õ�\\�ν�����\\npc\\head.lua")
Include("\\script\\global\\�����õ�\\�ν�����\\npc\\songjin_shophead.lua")

Include("\\script\\global\\global_tiejiang.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\battles\\vngbattlesign.lua")

--�i������ȡ����ʱ�ľ���ֵ����- Modified by DinhHQ - 20110810
--Limit_Exp = 550000
--Limit_Exp = 700000
tbLimit_Exp = {
						[0] = 700000,
						[3] = 800000,
						[4] = 1000000, 
					};
YUEWANGHUN_STONECOUNT = 100
nState = 0;

function main(sel)
	local nWorld, _, _ = GetWorldPos()
	if nWorld ~= 162 then
		Talk(1, "", "�����ѹ�.")
		return
	end
	nOldSW = SubWorld
	SubWorld = SubWorldID2Idx(325)
	if (nState == 0) then
		bt_setnormaltask2type()
		nState = 1;
	end
	battlemapid = BT_GetGameData(GAME_MAPID);
	
	--��ǰû���κ�ս�۴���
	if (battlemapid <= 0) then
			maintalk()
			return 
	end
	SyncTaskValue(747);--ͬ����ҵ��ܻ��ָ��ͻ��ˣ����ڻ��ֹ�����
	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Msg2Player("error"..battlemap)
		return
	end
	
	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	
	if (state == 0 or state == 1) then
		maintalk()
		SubWorld = tempSubWorld;
		return
	else
		Talk(1,"","����٣�ǰ��ս�����ڼ���ս������λ��Ҫ��ʱ���һ��!")
		SubWorld = tempSubWorld;
		return
	end;
	SubWorld = nOldSW;	
end;

function no()
end;

function jinshop_sell()
		Sale(98, 4);			
end;

--str1 = "�������٣��������ʿ�ǣ����Ȼ��Ӧ�������٣��μ��ҽ�����δ��������������������ν����<color=yellow>��ȡ���顢������֮ʯ<color>�������Թ���<color=yellow>�ν�ר�õ���<color>��"
--str2 = "���������������֮ʯ�Ļ�������������������������Ŷ��"
function maintalk()
	--Say(str1..str2.."����<color=yellow>"..nt_getTask(747).."<color>�ܻ��֣���ʲô��Ҫ��", 8,"��Ҫ�����ν����/jinshop_sell","��Ҫ���ν���ֻ�ȡ����/exp_exchange","�����ν����۳ƺ�-��������/person_change","�����ν����۳ƺ�-��Ч�⻷/effect_aura","��������֮ʯ����������/yuewang_want","����ƽ�ͼ��/goldenitem_menu","����������ʯ�����Կ�ʯ/ore","���ٿ��ǿ���/no");	
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--�����Ի���
	
	tbDailog.szTitleMsg = "����٣�����Ҫ�Ұ�ʲô?"
	tbDailog:AddOptEntry("���������", jinshop_sell)
	tbDailog:AddOptEntry("���뻻ȡ����ֵ", exp_exchange)	
	tbDailog:AddOptEntry("ʹ��������֮ʯ��������", yuewang_want)	
	tbDailog:AddOptEntry("��˫�ͽ�ս��",wushuangmengjiang)--��˫�ͽ�	
	tbDailog:AddOptEntry("����ʯ�̵�", energy_sale);
	tbDailog:AddOptEntry("��ȡ�ر�", duihuangmibao)
	--��ʱ�رս�ڣ�Թ� - Modified by DinhHQ - 20110810
	--tbDailog:AddOptEntry("��������֮ʯ��ȡ����Ӣ����", talk_yulongtie)

	tbDailog:Show()
end

function xunzhang_exchange()
	if( GetLevel() < 40 ) then
		Talk( 1, "", "����٣�ֻ��50��������Ҳ�����ȡѫ��");
		return 0
	elseif ( GetExtPoint(0)==0 ) then
		Talk( 1, "", "����٣�ֻ���ѳ�ֵ��Ҳ�����ȡѫ��");
		return 0
	elseif ( CalcFreeItemCellCount() < 1 ) then
		Talk( 1, "", "��׼��һ����λ����1��ѫ��");
		return 0;
	else
		Say("����٣�������500���ֻ�ȡѫ����?", 2,"��ȡѫ��/xunzhang_do", "Ŀǰ���뻻ȡ/no");
	end
end

function xunzhang_do()
	if nt_getTask(747) < 500 then
		Say("�i���ֲ���500��������ȡѫ��",0);
		return 0;
	end
	nt_setTask(747, floor(nt_getTask(747) - 500));
	local nidx = AddItem(6,1,1412,1,0,0) --����ν�ѫ��
	WriteLog(format("[GetZhanGongXunZhang]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s Del:500SongJinJiFen\t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	Say("�Ѿ��ɹ���ȡһ��ѫ��",0);
end

function exp_exchange()
	--Say("�������ݲ����ţ������ڴ���", 0 )
	if( GetLevel() < 40 ) then
		Talk( 1, "", "����٣���û�дﵽ40�������ܲμӷ����۽�����ô�����û��ֻ�ȡ����ֵ?");
	else
		if (GetTiredDegree() == 2) then
			Say("����٣�����������״̬�����ܻ�ȡ����ֵ.",0);
		else
			local tbOpt = 
			{
				"500 ����/#wantpay(500)", 
				"1000 ����/#wantpay(1000)",
				 "2000 ����/#wantpay(2000)",
				  "5000 ����/#wantpay(5000)",
				   "���л���/#wantpay(9999)",
				   "���ڲ��뻻ȡ/no"
			}
			local nDate = tonumber(GetLocalDate("%Y%m%d"))
			local nHM	= tonumber(GetLocalDate("%%H%M"))
			
			
			if  20090925 <= nDate and  nDate <= 20091101 then
			--	tinsert(tbOpt, 5, format("%d�����/#wantpayex(%d,%d)",80000,80000,0))
			end
			--��ڼ�(2009/09/25��2009/11/01)��12h30 �� 23h30
			
			Say("����٣��������Ķ��ٻ�������ȡ����ֵ?", getn(tbOpt), tbOpt);
		end;
	end
end;


function wantpayex(mark, nStep)
	
	if GetLevel() < 120 then
		Talk(1, "", format("Ҫ����Ҫ%d�����ϲ��ܻ�ȡ.", 120))
		return 
	end
	
	if PlayerFunLib:CheckTaskDaily(2645, 1, "�ý���ÿ��ֻ����ȡһ��.", "<") ~= 1 then
		return
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
				
	if gb_GetTask("songjin butianshi2009", 1) ~= nDate then
		gb_SetTask("songjin butianshi2009", 1, nDate)
		gb_SetTask("songjin butianshi2009", 2, 0)
	end
	
	if gb_GetTask("songjin butianshi2009", 2) >= 10 then
		Talk(1, "", "ÿ��ÿ��������������ʮ�˲��ܻ�ȡ�ý���.")
		return 
	end
	
	if( mark > nt_getTask(747) ) then
		Say("����٣����Ļ��ֲ��㣬���þ���ֵ.", 1, "�ر�/no");
	elseif (mark == 0) then
		Say("����٣�û�о���ֵ���뻻ȡ����ֵ�������ǻ���.", 1, "�ر�/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		
		local tbItem = {szName="����ʯ��Ƭ(��)", tbProp={6, 1, 1309, 1, 0, 0}}
		if nStep == 1 then
			if (expchange_limit(mark) == 1) then
				nt_setTask(747, floor(nt_getTask(747) - mark))
				AddOwnExp( bonus);
				Add120SkillExp(bonus);
				
				tbAwardTemplet:GiveAwardByList(tbItem, "MidAutumn,GetItemFromSongjin")
				gb_AppendTask("songjin butianshi2009", 2, 1)
				PlayerFunLib:AddTaskDaily(2645, 1)	
				Msg2Player("<#>��������"..mark.."<#>����, ��ȡ"..bonus .."<#>����ֵ.");
				WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]:������"..mark.."����, ��ȡ"..bonus.."����ֵ.");
			end
			
			
			
		elseif nStep == 0 then
			Say("����٣������Ի�ȡ"..bonus.."�i����ֵ��ȷ����ȡ����?", 2, "�ԣ���Ҫ��/#wantpayex("..mark..",1"..")", "�ţ�����������!/no")	
		end
		
	end	
end

function wantpay(mark)
	if (mark == 9999) then		--��ȡ���л���
		mark = nt_getTask(747)
	end
	
	if( mark > nt_getTask(747) ) then
		Say("����٣����Ļ��ֲ��㣬���þ���ֵ", 1, "�ر�/no");
	elseif (mark == 0) then
		Say("����٣�û�л��ֻ��뻻����ֵ�������ǻ���.", 1, "�ر�/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		Say("����٣������Ի���"..bonus.."����ֵ��ȷ����ȡ��?", 2, "�ԣ�����Ҫ��ȡ/#paymark("..mark..")", "�ţ�����������!/no")
	end	
end

function paymark(mark)
	if (mark == 9999) then		--��ȡ���л���
		mark = nt_getTask(747)
	end
	
	if( mark > nt_getTask(747) ) then
		Say("����٣����Ļ��ֲ��������þ���ֵ", 1, "�ر�/no");
	elseif (mark == 0) then
		Say("����٣�û�л��ֻ��뻻����ֵ�������ǻ���.", 1, "�ر�/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		if (expchange_limit(mark) == 1) then
			nt_setTask(747, floor(nt_getTask(747) - mark))
			AddOwnExp( bonus);
			Add120SkillExp(bonus);
			Msg2Player("<#>��������"..mark.."<#>����,����"..bonus .."<#>����ֵ.");
			WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ������"..mark.."����, ����"..bonus.."����ֵ.");
		end
	end
end


function expchange_limit(cost)
	--local ww = tonumber(date("%W"))
	--local yy = tonumber(date("%Y")) - 2000
	local nNumber = tbVNG2011_ChangeSign:GetTransLife()	
	local Limit_Exp = tbLimit_Exp[nNumber]
	if ( (nt_getTask(1017) + cost) <= Limit_Exp) then
		nt_setTask(1017, nt_getTask(1017) + cost)
		return 1
	else
		Say("����٣���Ҫ��ô̰����һ���ڲ��ܻ�ȡ����<color=red>"..Limit_Exp.."<color>���ֵľ���ֵ", 0)
		return -1
	end
end

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end

-- ��ȡ����״̬
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function person_change()
	Say("����٣���<color=yellow> �������۰��� <color>����<color=yellow> 5 ����<color> ��һ����ҽ�����ر�ƺź���������", 3, "���ν�����������/title_male","���ν�Ů��������/title_female","���뿴!/no" )
end;

function title_male()
	Describe("<link=image:\\spr\\npcres\\enemy\\enemy208\\enemy208_at.spr>�ν�����������<link>������������5�����ֵ����������۽������Ӧ������", 1, "�ر�/no" );
end

function title_female()
	Describe("<link=image:\\spr\\npcres\\enemy\\enemy207\\enemy207_at.spr>�ν�Ů��������<link>������������5�����ֵ�Ů�������۽������Ӧ������", 1, "�ر�/no" );
end

function effect_aura()
	Say("����٣���<color=yellow> �������۰��� <color>����<color=yellow>5 ����<color> ��һ�����ｱ����ر�ԲȦ��Ч", 6, "������Ԫ˧��Ч/aura_dingguo","������󽫾���Ч/aura_anbang","��Ʈ�콫����Ч/aura_biaoji","������������Ч/aura_yulin","������Уξ��Ч/aura_zhaowu","���뿴!/no" );
end

function aura_dingguo()
	Describe("<link=image:\\spr\\skill\\others\\title_dg.spr>����Ԫ˧��Ч<link>��������������һ�����ԲȦ��Ч", 1, "�ر�/no" );
end

function aura_anbang()
	Describe("<link=image:\\spr\\skill\\others\\title_ab.spr>����󽫾���Ч<link>�������������ڶ������ԲȦ��Ч", 1, "�ر�/no" );
end

function aura_biaoji()
	Describe("<link=image:\\spr\\skill\\others\\title_bj.spr>Ʈ�콫����Ч<link>���������������������ԲȦ��Ч", 1, "�ر�/no" );
end

function aura_yulin()
	Describe("<link=image:\\spr\\skill\\others\\title_yl.spr>����������Ч<link>���������������Ľ����ԲȦ��Ч", 1, "�ر�/no" );
end

function aura_zhaowu()
	Describe("<link=image:\\spr\\skill\\others\\title_zw.spr>����Уξ��Ч<link>���������������彲���ԲȦ��Ч", 1, "�ر�/no" );
end

function yuewang_want()
	Say("����٣���������֮ʯ�еľ������������������Ҫ����"..YUEWANGHUN_STONECOUNT.."��������֮ʯȷ��Ҫ������?", 2, "��/yuewang_change", "���ٿ���/no")
end

function yuewang_change()
	Say("����٣�������ռ��װ���Ŀռ�Ϊ<color=yellow>6 (2 X 3)<color>��λ����ȷ��װ���ﻹ�п�λ��", 2, "��/yuewang_sure", "�����Ȱ���һ��װ����/no")
end

function yuewang_sure()
	if (CalcEquiproomItemCount(4, 507, 1, -1) >= YUEWANGHUN_STONECOUNT) then
		ConsumeEquiproomItem(YUEWANGHUN_STONECOUNT, 4, 507, 1, -1)
		AddEventItem(195)
		Say("����٣�����������������Ҫ���ú���Ŷ!", 0)
		Msg2Player("�һ��������")
	else
		Say("����٣���û�кܶ�������֮ʯ������һ�£�����������˭�����е�.", 0)
	end
end

function ore()
	Sale( 102, 4);
end

function goldenitem_menu()
	Sale( 103, 4);
end

