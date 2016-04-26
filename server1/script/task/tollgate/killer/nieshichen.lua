--Bossɱ���������npc�ű�
--By LiuKuo 2005.3.25
Include ("\\script\\class\\ktabfile.lua")
Include ("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\missions\\challengeoftime\\npc\\dragonboat_main.lua")
Include("\\script\\event\\birthday_jieri\\200905\\chuangguan\\chuangguan.lua");
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\log.lua")
-- ���ػÿ�����а�
Include("\\script\\missions\\challengeoftime\\rank_perday.lua");
---- DescribͼƬ����
--DescLink_NieShiChen = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>��߱����<link>";
--TSKID_KILLTASKID = 1082;	-- ���ܵ��ĸ�����
--TSKID_KILLERDATE	= 1192;	--������ʱ������
--TSKID_KILLERMAXCOUNT	= 1193;	--ÿ��ɱ�˴���
--KILLER_MAXCOUNT		= 8;	--ÿ��ɱ������8��

--��Ӽ����Ӳμ���ս������- Modified by DinhHQ - 20110504
Include("\\script\\vng_feature\\challengeoftime\\npcNhiepThiTran.lua")

ContentList = {
	"<#>���˭�����160��ɱ���������ô��ɵ�һɱ�ֵ���������������. ÿ��ֻ�����<color=yellow>8������<color>����. <enter>�Ͽ������������սʱ���ڣ�����ͬ�ӵ��������Լ���ɱ������.",
	"<#> ɱ������20/killer20",
	"<#> ɱ������30/killer30",
	"<#> ɱ������40/killer40",
	"<#> ɱ������50/killer50",	--5
	"<#> ɱ������60/killer60",
	"<#> ɱ������70/killer70",
	"<#> ɱ������80/killer80",
	"<#> ɱ������90/killer90",
	"<#> �Ҵ���ɱ�ˣ��������� /cancel",	--10
	"<#> ��Ѫ��ͷ������û���Զ���/no",
	"<#> ���ѷ���������Ϊɱ�֣�����Ҫ�г����ַ���������������飬�������㲻�ʺϣ���ȥҲû��.",
	"<#> �ϴ���˵���ˣ���ȥ���ֻ����ţ���ȥ֤���Լ���ʵ���Ȱ�.",
	"<#> ��ĵȼ������ϣ���Ҫ��ͬ�ȼ����˽��ֲ���.",
	"<#> �ر�/no",	--15
	"<#> �����ĵȼ���20ɱ�֣�ÿ���˵��ֶ�ȾѪ�ˣ�������˭��?",
	"<#> �ϳ�ɱ���/compose",
	"<#> ��ŵ�ɱ��ﵲ��ԣ��۲���������Ҫ.",
	"<#> ��ŵ�ɱ����̫�࣬ɱ��ҲҪ�������������������Լ�������������.",
	"<#> ��ŵ�ɱ����̫�٣�ɱ��ҲҪ�������������������Լ�������������.",	--20
	"<#> �ٺϳ�һ��/compose",
	"<#> ���Ѻϳ�һ��<color=",
	"<#> ����<color> ɱ��ﵣ�ɱ�����һ���Ƿ�ɱ�֣��������һ��ͬ����ɱ����ɱ��ﵶԱȣ�ʤ��������������˵Ĺ���������. ",
	"<#> ����ɱ�� /annealofkiller",
	"<#> �μ���ս/want_playboat",	--25
	"<#> ����ɱ�����ȴӲμ���ս��ʼ����Ҽ�����������?",
	"<#> ����ս���/aboutchallenge",
	"<#>ϵͳ��ÿСʱͨ��һ�Σ�����ʱ��Ϊ5���ӣ�ʱ��Ϊ30���ӡ�ÿ�������ֻ��ÿ��2�Σ���Ҫ�ɶӳ�������. <enter>��սʱ���������2���μ�����: ��Ҵ�50��89�����ɶӳ���2��90������ɱ��ﵣ������в��룩ȥ�������߼�����Ҵ�90�����ϣ��ɶӳ���2��90������ɱ��ﵣ����в��룩ȥ����. <enter>�ڹ涨ʱ�䣬�������28�ؽ����. ÿ�ؾ��齱����ͬ�������ǰ������񣬾��齱���͸��� <enter>�����ǰ��ɣ����ܽ������һ�أ������кܶ����벻���Ľ���(żȻ��Ʒ���ƽ�װ����. ֻ���ڹ涨ʱ���ڴ���28�صĶӲ��������а������Լ�������.",
	"<#>���� \"����Ѱ��\"/guoguan_xunbao",
	"<#>�����콱/rank_award",
	"<#>����������������ߵ�5��./get_top5team"
}

killertabfile = new(KTabFile,"/settings/task/tollgate/killer/killer.txt","KILLER")

function main()
	UWorld1082 = nt_getTask(1082);
--	local tbDialog = {ContentList[24],ContentList[17],ContentList[2],ContentList[3],ContentList[4],ContentList[5],ContentList[6],ContentList[7],ContentList[8],ContentList[9],ContentList[10],ContentList[11],ContentList[30], ContentList[31], ContentList[15]};
	local tbDialog = {ContentList[24],ContentList[17],ContentList[9],ContentList[10],ContentList[11],ContentList[30], ContentList[31], ContentList[15]};
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 12, ContentList[29]);
	end
	Describe(DescLink_NieShiChen..ContentList[1], getn(tbDialog), unpack(tbDialog));
end

function annealofkiller()
--��Ӽ����Ӳμ���ս������- Modified by DinhHQ - 20110504
	--Describe(DescLink_NieShiChen..ContentList[26], 3, ContentList[25],ContentList[27],ContentList[11]);
	Describe(DescLink_NieShiChen..ContentList[26], 4, ContentList[25], "<#> ����������/#tbCOT_Party:CheckCondition()",ContentList[27],ContentList[11]);
end

function aboutchallenge()
	Describe(DescLink_NieShiChen..ContentList[28],1, ContentList[15]);
end

function killer20()
	if ( killerCoundTakedTask(20, 29) == 0) then
		return 0;
	end;
	showboss( 0 );
end

function killer30()
	if ( killerCoundTakedTask(30, 39) == 0) then
		return 0;
	end;
	showboss( 20 );
end

function killer40()
	if ( killerCoundTakedTask(40, 49) == 0) then
		return 0;
	end;
	showboss( 40 );
end

function killer50()
	if ( killerCoundTakedTask(50, 59) == 0) then
		return 0;
	end;
	showboss( 60 );
end

function killer60()
	if ( killerCoundTakedTask(60, 69) == 0) then
		return 0;
	end;
	showboss( 80 );
end

function killer70()
	if ( killerCoundTakedTask(70, 79) == 0) then
		return 0;
	end;
	showboss( 100 );
end

function killer80()
	if ( killerCoundTakedTask(80, 89) == 0) then
		return 0;
	end;
	showboss( 120 );
end

function killer90()
	if ( killerCoundTakedTask(90, 350) == 0) then
		return 0;
	end;
	showboss( 140 );
	tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuBossSatThu")
end

function cancel()
	nt_setTask(1082, 0);
	Describe(DescLink_NieShiChen..ContentList[12], 1,ContentList[15]);
end

function havetask()
	if ( UWorld1082 ~= 0 ) then
		Describe(DescLink_NieShiChen..ContentList[13], 1,ContentList[15]);
		return 0
	end
	return 1
end

function showboss(row)
	Describe(DescLink_NieShiChen..ContentList[16], 12, killertabfile:getCell("BossName",row+1).."/#givetask("..(row+1)..")", killertabfile:getCell("BossName",row+2).."/#givetask("..(row+2)..")", killertabfile:getCell("BossName",row+3).."/#givetask("..(row+3)..")", killertabfile:getCell("BossName",row+4).."/#givetask("..(row+4)..")", killertabfile:getCell("BossName",row+5).."/#givetask("..(row+5)..")", killertabfile:getCell("BossName",row+6).."/#givetask("..(row+6)..")", killertabfile:getCell("BossName",row+7).."/#givetask("..(row+7)..")", killertabfile:getCell("BossName",row+8).."/#givetask("..(row+8)..")", killertabfile:getCell("BossName",row+9).."/#givetask("..(row+9)..")", killertabfile:getCell("BossName",row+10).."/#givetask("..(row+10)..")", "��һҳ /#showbossnext("..row..")", ContentList[15]);
end

function showbossnext(row)
	Describe(DescLink_NieShiChen..ContentList[16], 12, killertabfile:getCell("BossName",row+11).."/#givetask("..(row+11)..")", killertabfile:getCell("BossName",row+12).."/#givetask("..(row+12)..")", killertabfile:getCell("BossName",row+13).."/#givetask("..(row+13)..")", killertabfile:getCell("BossName",row+14).."/#givetask("..(row+14)..")", killertabfile:getCell("BossName",row+15).."/#givetask("..(row+15)..")", killertabfile:getCell("BossName",row+16).."/#givetask("..(row+16)..")", killertabfile:getCell("BossName",row+17).."/#givetask("..(row+17)..")", killertabfile:getCell("BossName",row+18).."/#givetask("..(row+18)..")", killertabfile:getCell("BossName",row+19).."/#givetask("..(row+19)..")", killertabfile:getCell("BossName",row+20).."/#givetask("..(row+20)..")", "��һҳ/#showboss("..row..")", ContentList[15]);
end

function givetask(taskid)
	nt_setTask(1082,taskid);
	Describe(DescLink_NieShiChen..killertabfile:getCell("BossName",taskid)..killertabfile:getCell("BossInfo",taskid), 1, ContentList[15]);
end

function compose()
	GiveItemUI("�ϳ�ɱ��ﵽ���","ͬ�ȼ���5��ɱ����ϳ�һ����Ӧ��ɱ��ﵣ�ɱ��ﵵ�������5��ɱ�����������ء��������ɱ������������˵�ͬ��ɱ��ﵶԱȣ�ʤ��������������˵Ĺ���.","exchange_token", "no")
end

function exchange_token(ncount)
	local scrollidx = {}
	local scrollattr = {}
	local y = 0
	local compare_level = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype, level, attribute = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype == 399  ) then	
			if( y > 0 ) then
				if( level ~= compare_level ) then
					Describe(DescLink_NieShiChen..ContentList[18], 2, ContentList[21], ContentList[15]);
					return
				end
			end
			y = y + 1;
			scrollidx[y] = nItemIdx;
			scrollattr[y] = attribute;
			compare_level = level;
		end
	end
	if( y ~= ncount) then
		Describe(DescLink_NieShiChen..ContentList[18], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y > 5 ) then
		Describe(DescLink_NieShiChen..ContentList[19], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y < 5 ) then
		Describe(DescLink_NieShiChen..ContentList[20], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y == 5 ) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i]);
		end
		givesword(scrollattr,compare_level);
	end
end

function givesword(attr,level)
	series = {"metal>��", "wood>ľ", "water>ˮ", "fire>��", "earth>��"};
	i = random( 1, 5 );
	AddItem( 6, 1, 400, level, attr[i], 0);
	j = attr[i] + 1;
	Describe(DescLink_NieShiChen..ContentList[22]..series[j]..ContentList[23], 1, ContentList[15]);
end

function no()
end

--ÿ������������
function killerCoundTakedTask(nLowLevel, nHighLevel)
	if ( havetask() == 0) then
		return 0;
	end;
	local myLevel = GetLevel();
	if( myLevel < nLowLevel or myLevel >  nHighLevel) then
		Describe(DescLink_NieShiChen..ContentList[14], 1,ContentList[15]);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	local myDate = nt_getTask(TSKID_KILLERDATE);
	if (myDate == nDate and nt_getTask(TSKID_KILLERMAXCOUNT) >= KILLER_MAXCOUNT) then
		Describe(DescLink_NieShiChen.."ɱ����һ�����ʺ���Ҫ��������а��󡣽�������"..KILLER_MAXCOUNT.." �����ˣ�����������.", 1, ContentList[15]);
		return 0;
	elseif (myDate ~= nDate) then
		nt_setTask(TSKID_KILLERMAXCOUNT, 0);
		nt_setTask(TSKID_KILLERDATE, nDate);
	end;
	return 1;
end;
