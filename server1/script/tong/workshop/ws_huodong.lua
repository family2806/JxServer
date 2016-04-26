Include("\\script\\tong\\workshop\\workshop_head.lua")

HUODONG_TASKID = {{1015, 1016}, {1017, 1018}, {1019, 1020}};

TK_GUANGHUAN = 2349;--��¼��Ұ��⻷�ı��
TK_SHIJIAN = 2350;--��¼��Ұ��⻷����Чʱ��
TK_ISCANCEL = 1757;--��¼�Ƿ��Ѿ�ȡ���˹⻷

aLevelCoef = {}
aLevelLingPaiPrice = {}
aLevelDiziCoef = {}
aLevelDiziDouble = {}
aLevelNianshouCoef = {}
aLevelNianshouDouble = {}
aLevelAuraPrice = {}

SEC_OF_DAY = 86400;


function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\huodong_level_data.txt", "huodongLevelData")
	if b1~=1 then
		print("���ػ���������ļ�ʧ�ܣ�")
		return
	end
	local nRowCount = TabFile_GetRowCount("huodongLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("huodongLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "OUTPUT_COEF"))
		aLevelLingPaiPrice[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "LINGPAI_PRICE"))
		aLevelDiziCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "COUNT_DZLIM"))
		aLevelDiziDouble[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_DZDOU"))
		aLevelNianshouCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "COUNT_NSLIM"))
		aLevelNianshouDouble[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_NSDOU"))
		aLevelAuraPrice[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_AURA"))
	end
	--TabFile_UnLoad("huodongLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------

function ws_main(nTongID, nWorkshopID)
	-- TODO: liaozhishan 
	-- 11/7 �˴�������Ҫ�޸ģ�����Relayֻ�ܴ���CallBoss���ƣ����»����������۽��������쳣������Ҫ��Ϊ�ܴ�����������
	if SVR_CheckUse(nTongID, nWorkshopID, "����ܹ�") ~= 1 then
		return 0
	end
	local aryszContent = {
		"����ز�/#use_g_4_ok("..nTongID..","..nWorkshopID..")", 
		"��ļ���ӻ/#use_g_2_ok("..nTongID..","..nWorkshopID..")", 
		"�������޻/#use_g_3_ok("..nTongID..","..nWorkshopID..")", 
			--"����ռ���Ʒ�/#use_g_5_ok("..nTongID..","..nWorkshopID..")", 	
			};
			
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent, "�����ƽ�Boss/#use_g_1_ok("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent, "����Ҫ/cancel");
	
	Say("<#>����ܹܣ��Ҹ������а����ܻ����ܰ��ڿ����;��񣬴��һ��μӻ��!",
		getn(aryszContent),
		aryszContent);
	return 1;
end

----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --�ճ��
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --��ʼ������ȡ������
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLinPaiLeft = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLinPaiLeft < 100) then
		return 0
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		return 0
	end
	if (TONG_ApplyAddBuildFund(nTongID, -aLevelLingPaiPrice[nLevel]) == 1) then
		TWS_ApplyAddDayOutput(nTongID, nWorkshopID,  -100)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, 2688)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, aLevelLingPaiPrice[nLevel])	
		return 1
	end
	return 0	
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel < 2)then
		Say("<#>����ܹܣ�Boss�ٻ������Ὠ��ȼ���<color=red>2<color>�������������������ڻ����Ȱ��ķ�չ���ɣ�", 0)
		return
	end
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WORKSHOP) ~= 1) then
		Say("<#>����ܹܣ���û����������Ȩ�ޣ�������ȡBoss�ٻ�����", 0)
		return
	end
	_dbgMsg("ʣ����ȡ����*100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>����ܹܣ������Boss�ٻ����ѷַ���ϣ������������ɣ�", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>����ܹܣ�����Ҫ����<color=water>"..aLevelLingPaiPrice[nLevel].."<color>���Ὠ�������һ��Boss�ٻ�����ȷ����", 2,
		"��ȡ/#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "ȡ��/cancel")
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		Say("<#>����ܹܣ��Բ��𣬰�Ὠ������㣬������ȡ��", 0)
		return
	end
	TWS_ApplyUse(nTongID, nWorkshopID, 1)
end

function use_g_2_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 2)
end

function use_g_3_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 3)
end

function use_g_4_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 4)
end

function use_g_5_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 5)
end

function USE_G_2(nTongID, nWorkshopID, nUse)
	if (nUse == 1)then
		local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		local szMsg = GetName().." ������"..aLevelLingPaiPrice[nLevel].."���Ὠ����𣬻�ȡһ��"..nLevel.."��Boss�ٻ�����"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
		AddItem(6, 1, 1022, nLevel, 0, 0, 0);
	elseif (nUse == 2)then	
		Sel_ZhaoDizhi(nTongID, nWorkshopID)	--��ļ����
	elseif (nUse == 3)then
		Sel_DaNianShou(nTongID, nWorkshopID)	--������
	elseif (nUse == 4)then
		Sel_techan(nTongID, nWorkshopID)		--�ز�
	elseif (nUse == 5) then
		Sel_shoujiwupin(nTongID, nWorkshopID);	--�ռ���Ʒ
	end	
end

function cancel()
end

--�⻷�ı�
tc_detail = {[5] = {"��Ӭ�⻷", "����ܹܣ������鱻��ӬΧ�Ƶĸо�����ǰֻ��ؤ���ӵ������õ�Ŷ�������Ӭ�⻷��Ҫ����<color=yellow>30<color>�㹱�׶ȣ��⻷Ч������һ�ܡ�"},
			[6] = {"�㽶�⻷", "����ܹܣ�����������ˮ������Ȥô������һ�����������鵽�Ϲ�����Ĺ⻷�������㽶�⻷��Ҫ����<color=yellow>30<color>�㹱�׶ȣ��⻷Ч������һ�ܡ�"},
			[7] = {"��ӥ�⻷", "����ܹܣ���ϲ������ô������⻷������һֻ��ӥ��������档�����ӥ�⻷��Ҫ����<color=yellow>30<color>�㹱�׶ȣ��⻷Ч������һ�ܡ�"},
			[8] = {"����⻷", "����ܹܣ���˵��һЩ���ָ����˹�ʱȫ���ð��⣬������⻷����������������˵�еĸ��ֵĸо����������⻷��Ҫ����<color=yellow>30<color>�㹱�׶ȣ��⻷Ч������һ�ܡ�"},
			[9] = {"��Ӱ�⻷", "����ܹܣ���֪��ʲô�С���ɲ⡱ô������⻷����������ɲ�ĸо�������Ӱ�⻷��Ҫ����<color=yellow>30<color>�㹱�׶ȣ��⻷Ч������һ�ܡ�"},
			[10] = {"�߽��⻷", "����ܹܣ������鱻�߰Ѿ������Χ�Ƶĸþ�������⻷���Ƕ��������ݵ������������߽��⻷��Ҫ����<color=yellow>30<color>�㹱�׶ȣ��⻷Ч������һ�ܡ�"}
};

function Sel_techan(nTongID, nWorkshopID)--����ز�����
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID);
	
	Say("����ز�<color=yellow>���⻷<color>�����Ƕ�һ�޶���Ŷ����Ҫ�˽���", 2,
	"����ز��⻷/#enter_guanghuan("..nLevel..")",
	"�����Ի�/oncancel");
end;


function enter_guanghuan(nLevel)
	if (nLevel < 5) then
		Say("�������û�дﵽ<color=yellow>5<color>���أ��ȴﵽ5����ʱ�������ɡ�", 0);
		return
	end;
	local tab_gh_content = {};
	tinsert(tab_gh_content, "�����ز��⻷/tong_gh_about");
	tinsert(tab_gh_content, "��ȡ���й⻷/#tong_gh_getagain(0, 1)");
	for i = 5, nLevel do
		tinsert(tab_gh_content, "��Ҫ����"..tc_detail[i][1].."/#tong_gh_get("..i..")");
	end;
	tinsert(tab_gh_content, "ȡ���ز��⻷/#delguanghuan( 1 )");
	tinsert(tab_gh_content, "��֪����/oncancel");
	Say("������ز��⻷���ͣ�����Ҫ����ʲô��", getn(tab_gh_content), tab_gh_content);
end;

function delguanghuan(IsWantCancel)--ȥ���⻷Ч��
	if (IsWantCancel == 1) then	--�����ȡ���⻷�������ȡ���⻷������ȡ�����������
		SetTask(TK_ISCANCEL, 1);
	end;
	
	for i = 726, 731 do
		AddSkillState(i, 1, 0, 0);
	end;
end;

function tong_gh_getagain(bExchangeIn, bPlayer)	--�õ�ԭ�еĹ⻷��
	local nRemainSec = getremaintime();
	if (nRemainSec == 0) then
		if (bPlayer == 1 and bExchangeIn ~= 1) then	--�Ƿ�Ҫ��ʾ
			Say("��û�п�ʹ�õĹ⻷��", 0);
			Msg2Player("��û�п�ʹ�õĹ⻷��");
		end;
		return
	end;
	
	if (bPlayer == 1 or GetTask(TK_ISCANCEL) ~= 1) then
		local nSkillID = GetTask(TK_GUANGHUAN);
		AddSkillState(nSkillID, 1, 0, nRemainSec * 18);
		SetTask(TK_ISCANCEL, 0);
	end;
end;


tab_Level = {[5] = 5, [6] = 6, [7] = 7, [8] = 8, [9] = 9, [10] = 10}
function tong_gh_get(nLevel)
	Say(tc_detail[nLevel][2], 2, "��Ҫ����/#tong_gh_buy("..tab_Level[nLevel]..")", "�뿪/oncancel");
end;

function tong_gh_buy(nLevel)
	local nPrice = aLevelAuraPrice[nLevel];
	if (GetContribution() < nPrice) then
		Say("��Ĺ��׶Ȳ���<color=yellow>"..nPrice.."<color>�㣬���ܹ����ز��⻷��");
		Msg2Player("��Ĺ��׶Ȳ��㡣");
		return
	end;
	SetTask(TK_ISCANCEL, 0);
	AddContribution(-1 * nPrice);--���ٹ��׶ȡ�
	Msg2Player(format("����<color=yellow>%d<color>�㹱�׶ȹ�����һ��<color=yellow>%s<color>.", nPrice, tc_detail[nLevel][1]));

	local nSkillID = nLevel + 726 - 5;
	SetTask(TK_GUANGHUAN, nSkillID);
	local nLimitDate = GetCurrentTime() + SEC_OF_DAY * 7;--�⻷ʱ��Ϊ7��
	SetTask(TK_SHIJIAN, nLimitDate)

	delguanghuan();
	AddSkillState(726 + nLevel - 5, 1, 0, SEC_OF_DAY * 7 * 18);
end;

function getremaintime()	--�õ��⻷��ʣ����ʱ��,���ػ��ж��ٸ�Сʱ
	local nRemainTime = GetTask(TK_SHIJIAN) - GetCurrentTime();
	if (nRemainTime < 0) then
		nRemainTime = 0;
	end;
	return nRemainTime;
end;

function tong_gh_about()
	Say("<#>����ܹܣ���������弶��ʼÿһ���������һ���µĹ⻷��<color=green>�弶����Ӭ�⻷���������㽶�⻷���߼�����ӥ�⻷���˼�������⻷���ż�����Ӱ�⻷��ʮ�����߽��⻷<color>�����⻷�ڹ�������һ�ܣ���һ���������Ϊ����������ԭ����⻷��ʧ�˵Ļ�������ʱ���������ȡ�������Լ��������𣿿������԰ɡ�", 0);
end;

if (MODEL_GAMESERVER == 1) then --�����GameServer
---------------һ����Сɽ��------------------------
Include([[\script\missions\tong\tong_disciple\head.lua]]);
Include([[\script\missions\tong\tong_disciple\dis_gmscript.lua]]);
Include([[\script\missions\tong\tong_disciple\award.lua]]);
Include([[\script\missions\tong\tong_springfestival\head.lua]]);
Include([[\script\missions\tong\tong_springfestival\sf_gmscript.lua]]);
Include([[\script\missions\tong\tong_springfestival\award.lua]]);

Include([[\script\missions\tong\collectgoods\head.lua]]);
Include([[\script\missions\tong\collectgoods\collg_gmscript.lua]]);
Include([[\script\missions\tong\collectgoods\award.lua]]);
end

--�������
function Sel_ZhaoDizhi(nTongID, nWorkshopID)
	Say("<#>����ܹܣ������ļ���ӻ��0�㡢3��6����21�����㡢15�֣�30�֣�45�ֿ�ʼ���������ǰ��Ƿ���ҪЩ������������ʵ�أ�", 4, "�μӰ����ļ���ӻ/#wantjoin_disciple("..nTongID..","..nWorkshopID..")",
--		 "���������ļ���ӻ/#tong_opendisciple(821)", 
		 "��ȡ����/#disciple_aword("..nTongID..","..nWorkshopID..")",
		  "���ڰ����ļ���ӻ/disciple_about", "�����/festival06_Cancal");
end;

function wantjoin_disciple(nTongID, nWorkshopID)
	Say("����ܹܣ��μӰ����ļ���ӻ��Ҫ����<color=yellow>800<color>���ṱ�׶ȣ����Ƿ�Ҫ�μӣ�", 2, 
	"�μӰ����ļ���ӻ/#joindisciple("..nTongID..","..nWorkshopID..")",
	"��������/festival06_Cancal");
end;

function disciple_about()
	Say("����ܹܣ���ļ���ӻһ��Ϊ<color=yellow>15<color>���ӣ�������<color=yellow>5<color>����׼��ʱ�䣬"..
		"�ڱ����μӺ���ᱻ����׼����ͼ�����ʼ����ᱻ���������Ƽ��ĵط���"..
			"��������������<color=yellow>����<color>�Ļ�ֻҪ�����<color=yellow>"..
			"������<color>���Ϳ����ˣ���Ȼ�������ܵ�������ҵ����ӣ�"..
			"��ʱ��������û������Ӧ����Щ�����ֻҪ���ҵ��㹻���<color=yellow>"..
			"������<color>��ô����ܹܻ���㲻�������Ŷ��", 1,
			"�ҿ�����/oncancel");
end;

--������
function Sel_DaNianShou(nTongID, nWorkshopID)
	Say("<#>����ܹܣ��������޻��1�㡢4��7����22�����㡢15�֣�30�֣�45�ֿ�ʼ���������������վ�ȻҲ�����޳������ҡ�", 4, 
		"�μӰ������޻/#wantjoin_springfestival("..nTongID.. ","..nWorkshopID..")",
--		"�����������޻/#tong_openspringfestival(823)", 
		"��ȡ����/#springfestival_aword("..nTongID..","..nWorkshopID..")", 
		"���ڰ������޻/springfestival_about", "�����/festival06_Cancal");
end;

function wantjoin_springfestival(nTongID, nWorkshopID)
	Say("������������˵����ޱ���׽��Ѻ��������һ��ʱ���ˣ������ұ����޸��������Ҳ�𽥺�ת����ȴ��Ȼ��������������Ȼ����������δɢȥ��а�ֻ��һֱǱ���Ű��ˡ�ĳ�գ�һλ����������ٸ��ص���Ϧ���޳�û֮�أ�Ϊ�˵������ǳ���ս����ȥ���ɷ��ʧ�ٵĶ��ӡ������Ǹ��˲���ʱ�����������ҵ����޽�ӡ��ɵ�һ������ͼ�����Ƿ·��Ǹ�а", 2, "Ȼ����/#wantjoin_springfestival_next("..nTongID..","..nWorkshopID..")",
	"���������Ƕ�����/festival06_Cancal");
end;

function wantjoin_springfestival_next(nTongID, nWorkshopID)
	Say("��ķ��䡣���Ǹ�Ů���ҡ����������֮�ʣ�����ʹ���������޵�а��ӿ���ˡ����������ܹܰݵ������ʺ�ĶǶ�֮�º�˯ʱ��һֻ������������������޵��ε�Կ�ס������յİ��������ڳ�������ˣ��С��������ʧ�ˣ�������˿�����Ķ��ߺͲ�����ת�����ݣ��Լ����Ǻ�ͯ���Ρ�<enter>�μӰ������޻��Ҫ<color=yellow>300<color>���ṱ�׶ȣ����Ƿ�Ҫ�μӣ�", 2, "�μӰ������޻/#joinspringfestival("..nTongID..","..nWorkshopID..")",
	"��������/festival06_Cancal");
end;

function springfestival_about()
	Say("����ܹܣ������޻һ��Ϊ<color=yellow>15<color>���ӣ�������<color=yellow>5<color>����׼��ʱ�䣬"..
		"�ڱ����μӺ���ᱻ����׼����ͼ�����ʼ����ᱻ�����������޳�û�ĵط���"..
		"�ڻ��ʼ<color=yellow>15<color>����ڲμӻ����ҵ��б����1~2����ұ����޸���"..
		"������޵������Ҫȥץ��ͼ�г��ֵġ�<color=yellow>�߶��ĺ���<color>����", 2, 
		"��һҳ/festival06_next", "�����Ի���/festival06_Cancal");
end;

function festival06_next()
    Say("����ܹܣ������������Ҫ�á�<color=yellow>����<color>���������ޣ�"..
    	"����ֹ���ްѺ���ץ�ߣ�һ���������<color=yellow>����ܹ�<color>��"..
    	"�ᰴ�����<color=yellow>����<color>�������޵��������䷢������", 1,  
    	"��֪���ˡ�/festival06_Cancal");
end

function Sel_shoujiwupin(nTongID, nWorkshopID)	--����ռ���Ʒ�
	local tab_gh_content = {
			"�μӰ���ռ���Ʒ�/#wantjoin_collection("..nTongID..","..nWorkshopID..")",
--			"��������ռ���Ʒ�/#collg_opencellectgoods( 827 )", 
			"��ȡ����/#collg_aword("..nTongID..","..nWorkshopID..")",
			"���ڰ���ռ���Ʒ�/collg_about",
			"�����/festival06_Cancal"
	};

	Say("<#>����ܹܣ�����ռ���Ʒ���2�㡢5��8����22�����㡢15�֣�30�֣�45�ֿ�ʼ���������ǰ��Ƿ���ҪЩ������������ʵ�أ�", getn(tab_gh_content), tab_gh_content);
end;

function wantjoin_collection(nTongID, nWorkshopID)
	Say("����ܹܣ���ϰ�æ����̫���ˣ���������Щ�Ҵ�����˴���������������һ������Ļ��أ����ǰ�һ���޴�ı��ڰ���һֻ�Ƴ����ϣ�����ճ�������ϲ��ţ�����������Ӹ������ˣ��������ͻ�һֱճ����ֱ����ը�������С�ġ�", 2, 
	"�һ�С�ĵģ������ҵ�������ʧ�ĵط��ɡ�/#collg_joindisciple("..nTongID..","..nWorkshopID..")", 
	"��Ȼ����������Ҫȥ׼��׼�����ȵ���һ�¡�/OnCancel");
end;

else
-----------------����ǿͻ���---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>û�а��"	
	end
	local bOpen	--�Ƿ���
	local bPause --�Ƿ���ͣ
	local nCurLevel --��ǰ�ȼ�
	local nUseLevel --��ǰʹ�õȼ�
	local nOpenFund --��ǰ��������
	local nMaintainFund --��ǰά������
	local nPrice  --��ǰ��ȡboss�ٻ����Ľ������
	local dTokenCount	--��ǰÿ��boss�ٻ��������������
	local nDoubleOdds  --��ǰ�ٻ���2���ƽ�Boss�ļ���
	local dDiziCount	--��ǰÿ�ղμ���ļ���ӻ�˴����
	local nDiziDoubleOdds	--��ǰ��ļ���ӻ����˫�������ļ���
	local dNianshouCount	--��ǰÿ�ղμӰ������޻�˴����
	local nNianshouDoubleOdds		--��ǰ�������޻����˫�������ļ���
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then		
			nPrice = aLevelLingPaiPrice[nUseLevel]
			dTokenCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nDoubleOdds = 160 - (nUseLevel - 1) * 10
			dDiziCount = format("%.2f", aLevelDiziCoef[nUseLevel] / aLevelDiziCoef[1])	
			nDiziDoubleOdds = floor(aLevelDiziDouble[nUseLevel] * 100)
			dNianshouCount = format("%.2f", aLevelNianshouCoef[nUseLevel] / aLevelNianshouCoef[1])	
			nNianshouDoubleOdds = floor(aLevelNianshouDouble[nUseLevel] * 100)
		else
			nPrice = "--"
			dTokenCount = "--"
			nDoubleOdds = "--"
			dDiziCount = "--"
			nDiziDoubleOdds = "--"
			dNianshouCount = "--"
			nNianshouDoubleOdds = "--"
		end
	else	--����δ����ʱֻ��ʾ��һ����Ϣ
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--�¼���Ϣ
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextTokenCount,nNextDoubleOdds,dNextDiziCount,nNextDiziDoubleOdds,dNextNianshouCount,nNextNianshouDoubleOdds
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --��������
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --�¼�ά������
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--�¼���������
		nNextPrice = aLevelLingPaiPrice[nUseLevel + 1] --�¼���ȡboss�ٻ����Ľ������
		dNextTokenCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --�¼�ÿ��boss�ٻ��������������
		nNextDoubleOdds = 160 - nCurLevel * 10 --�¼��ٻ���2���ƽ�Boss�ļ���
		dNextDiziCount = format("%.2f", aLevelDiziCoef[nUseLevel + 1] / aLevelDiziCoef[1])	
		nNextDiziDoubleOdds = format(aLevelDiziDouble[nUseLevel + 1] * 100)
		dNextNianshouCount = format("%.2f", aLevelNianshouCoef[nUseLevel + 1] / aLevelNianshouCoef[1])	
		nNextNianshouDoubleOdds = format(aLevelNianshouDouble[nUseLevel + 1] * 100)
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextTokenCount = "--"
		nNextDoubleOdds = "--"
		dNextDiziCount = "--"
		nNextDiziDoubleOdds = "--"
		dNextNianshouCount = "--"
		nNextNianshouDoubleOdds = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>��ͣ" elseif bOpen == 1 then state="<color=green>����" else state="<color=red>�ر�" end
		local szMsg = "����״̬��"..state.."<color>\n"..
			"�����ȼ���<color=gold>"..nCurLevel.."<color>��\n"..
			"��ǰʹ�õȼ���<color=gold>"..nUseLevel.."<color>��\n"..
			--"Boss�ٻ����ղ���������ߣ�<color=gold>"..dTokenCount.."<color>��\n"..	
			--"�ٻ����ٳ���2��Boss�ļ��ʣ�<color=gold>1/"..nDoubleOdds.."<color>\n"..		
			--"��ȡBoss�ٻ������轨�����<color=gold>"..nPrice.."��<color>\n"..
			"ÿ�ղμӰ���˴���ߣ�<color=gold>"..dDiziCount.."<color>��\n"..
			"������˫�������ļ��ʣ�<color=gold>"..nDiziDoubleOdds.."%<color>\n"..
			"ÿ��ά������ս������<color=gold>"..nMaintainFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nOpenFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һʹ�õȼ�<color>\n"..
			--"<color=water>Boss�ٻ����ղ���������ߣ�<color=Violet>"..dNextTokenCount.."<color>��\n"..
			--"�ٻ����ٳ���2��Boss�ļ��ʣ�<color=Violet>1/"..nNextDoubleOdds.."<color>\n"..	
			--"��ȡBoss�ٻ������轨�����<color=Violet>"..nNextPrice.."��<color>\n"..
			"ÿ�ղμӰ���˴���ߣ�<color=Violet>"..dNextDiziCount.."<color>��\n"..
			"������˫�������ļ��ʣ�<color=Violet>"..nNextDiziDoubleOdds.."%<color>\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"

		return szMsg
	else
		local szMsg = "����״̬��<color=water>δ����<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һ�ȼ�<color>\n"..
			---"<color=water>Boss�ٻ����ղ���������ߣ�<color=Violet>"..dNextTokenCount.."<color>��\n"..
			---"�ٻ����ٳ���2��Boss�ļ��ʣ�<color=Violet>1/"..nNextDoubleOdds.."<color>\n"..
			---"��ȡBoss�ٻ������轨�����<color=Violet>"..nNextPrice.."��<color>\n"..
			"ÿ�ղμӰ���˴���ߣ�<color=Violet>"..dNextDiziCount.."<color>��\n"..
			"������˫�������ļ��ʣ�<color=Violet>"..nNextDiziDoubleOdds.."%<color>\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	end
end
----------------------------------------------
end