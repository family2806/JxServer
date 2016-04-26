Include("\\script\\item\\techan_zijingao.lua")
Include("\\script\\item\\techan_dahuandan.lua")

----���Ӣ���� ���
function enter_heroling()
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	local tbDescribe = {"<dec>���Ӣ������ <color=yellow>01-12-2006<color>��ʼ��<color=yellow>24h00 01-01-2007<color>. ʹ�÷��Ӣ�������Ʒ�Ͷһ�Boss�ٻ�������������<color=yellow>08-01-2007<color>. ��ϸ���ݿ���ҳ.<enter>Ŀǰ���Ӣ�����������:<color=yellow>"..nCount.." c�i<color>.<enter>����μ��ĸ��?", 
	"�һ����Ӣ����/change_contribution_heroling", 
	"�Է��Ӣ�������Ʒ/saleby_heroling", 
	"�÷��Ӣ����һ�Boss�ٻ���/change_heroling_bosscharm", 
	"���ܼ�������������/change_letter_honour",
	"�뿪/tong_cancel"};
	
	CreateTaskSay(tbDescribe);
end;

-----�Է��Ӣ�����������Ʒ Start
function saleby_heroling()
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	CreateTaskSay({"<dec><color=yellow>���Ӣ����<color>���ڹ���������Ʒ. ������Ʒ��Ҫ����<color=yellow>���˹��׵�<color> ������. ������ƷҪ�ӿ��Լ�¼���������п۳�<color=yellow>�����������������<color>. ���������������һ�ܰ����Ի�õ�Boss�ٻ�������, �����Ȩ�����Ƿ�μ��ܼ��."
	.."<enter>���ڿ���ʹ�õķ��Ӣ�����������: <color=yellow>"..nCount.." ��<color>."
	.."<enter>���ڿ���ʹ�õ��ܹ��׵���: <color=yellow>"..GetContribution().." ��<color>."
	.."<enter>����Ҫ��ʲô��Ʒ?", 
	"�Ͻ��/saleby_heroling_enter",
	"�����/saleby_heroling_enter",
	"ľ��/saleby_heroling_enter",
	"��Ӱ�⻷/saleby_heroling_enter",
	"�㽶�⻷/saleby_heroling_enter",
	"��ӥ�⻷/saleby_heroling_enter",
	"αװ���/saleby_heroling_enter",
	"�󻹵�/saleby_heroling_enter",
	"����/enter_heroling",
	"�뿪/tong_cancel"});
end;

function check_salebyheroling(nTongID, nPrice)
	if (nTongID == 0) then
		return 0;
	end;
	local nContribution = GetContribution();
	local nHeroling = GetTask(TASKID_HEROLING_COUNT);
	if (nHeroling < 1) then
		CreateTaskSay({"<dec>���׵㲻��, ��Ŭ��Ѱ�ҹ��׵�.", "�����Ի�/tong_cancel"});
	elseif (nContribution < nPrice) then
		CreateTaskSay({"<dec>����û�з��Ӣ����, �ڻ����˹��׵�֮��ſ���ȥ��ȡ���Ӣ����.", "�����Ի�/tong_cancel"});
	else
		return 1
	end;
	return 0;
end;


-----**�󻹵�**
function sale_heroling_dahuandan(nCount, nPrice)
		local nRestH, nRestM = adddahuandan_main(10, nCount);	--1.6����Ҫ 10������
		Msg2Player("<#>����1��"..nCount.."�󻹵�,����ʹ�ô�Ƶ���ʱ����"..nRestH.."ʱ "..nRestM.."��.")
end;
-----**�󻹵� end


-----**αװ���**
function sale_heroling_weizhuang(nCount, nPrice)
	for i = 1, nCount do
		AddItem(0,11,366,1,0,0);
	end;
		Msg2Player("��ﵽ"..nCount.." 24ʱ, αװ��߿���ʹ��10��")
end;
-----**αװ��� end


-----**��ӥ�⻷**
function sale_heroling_cangying(nCount, nPrice)
	delguanghuan()
	AddSkillState(728, 1, 1, 10886400 * nCount, 1);--7��
	Msg2Player("�õ�1����ӥ���Ż���ʣ��ʱ��Ϊ "..(7*nCount).."��");
end;
-----**��ӥ�⻷ end


-----**�㽶�⻷**
function sale_heroling_xiangjiao(nCount, nPrice)	
	delguanghuan()
	AddSkillState(727, 1, 1, 10886400 * nCount,1);--7��
	Msg2Player("�õ�1���㽶���Ż���ʣ��ʱ��Ϊ "..(7*nCount).."��");
end;
-----**�㽶�⻷ end


-----**��Ӱ�⻷**
function sale_heroling_anying(nCount, nPrice)
	delguanghuan()
	AddSkillState(730, 1, 1, 10886400 * nCount, 1);--7��
	Msg2Player("�õ�1����Ӱ���Ż���ʣ��ʱ��Ϊ "..(7*nCount).."��");
end;
-----**��Ӱ�⻷ end

function delguanghuan()
	for i = 726, 731 do
		AddSkillState(i, 1, 1, 0);
	end;
end;

-----**����ľ��**
function sale_heroling_xiulianmuren(nCount, nPrice)
	for i = 1, nCount do
		local nItemIndex = AddItem(6,1,1085,1,1,0)
		SetSpecItemParam(nItemIndex, 1, nTongID)
		SetSpecItemParam(nItemIndex, 2, 10)
		SyncItem(nItemIndex)
	end;
	Msg2Player("�õ�"..nCount.."1��ľ��.")
end;
-----**����ľ�� end

-----**�����**
function sale_heroling_xiulibao(nCount, nPrice)
	for i =1, nCount do
		local nItemIndex = AddItem(6,1,1084,1,1,0)
		SetSpecItemParam(nItemIndex, 2, GetLocalDate("%y%m%d"))
		SyncItem(nItemIndex)
	end;
		Msg2Player("�õ�"..nCount.." �����, ʣ��ʱ����7��")
end;
-----**����� end

-----**�Ͻ��**
function sale_heroling_zijingao(nCount, nPrice)
		local nRestH, nRestM = addzijingao_main(nCount);
		Msg2Player("�õ�1���Ͻ�䣬ʣ��ʱ����"..nRestH.." ʱ, "..nRestM.."��")
end;
-----**�Ͻ�� end

function saleby_heroling_enter(nSel)
	nSel = nSel + 1
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	if (nCount < 1) then
		CreateTaskSay({"<dec>û�з��Ӣ����Ͳ�������Ʒ.", "�����Ի�/tong_cancel"});
		return 0
	end;
	local arySalebyHeroling = {
						{"<dec>����ʹ��<color=yellow>�Ͻ��<color> �� ���һ����ڿ�, Ҫע������Ͻ�䲻������Ѱ�����󹤾�һͬʹ��. ���һͬʹ�õĻ�֮ǰ����ռ���Ͻ���ʹ��ʱ��, ֮�󽫻�����һ�ֹ�Ч. <enter>��ȡ�Ͻ�������:<color=yellow>200��<color> ", "Ҫ��1��/#saleby_heroling_confirm(1,200,'sale_heroling_zijingao')", "Ҫ��2��/#saleby_heroling_confirm(2,400,'sale_heroling_zijingao')", "����/enter_heroling", "�뿪/tong_cancel"},
						{"<dec><color=yellow>�����<color> �ǿ��Է��뱳���ĵ���, �����԰����㲻�ػسǾ�����װ��,��ȻҪ����Ӧ�ķ���. �������ʹ��������1��.<enter>��ȡ1����������ĵĹ��׵���: <color=yellow>50 ��<color>", "��ȡ1�������/#saleby_heroling_confirm(50,'sale_heroling_xiulibao')", "����/enter_heroling", "�뿪/tong_cancel"},
						{"<dec>������Ҽ��ٻ�ľ��. ���ľ�˺��о���ֵ.<enter>��ȡ1��ľ��Ҫ���ĵĹ��׵���: <color=yellow>100��<color>", "��ȡ1��ľ��/#saleby_heroling_confirm(100,'sale_heroling_xiulianmuren')", "����/enter_heroling", "�뿪/tong_cancel"},
						{"<dec>���Ź⻷����������õĸо�, ʹ��������1��.<enter>��ȡ���Ź⻷��Ҫ����ֵ: <color=yellow>30 ��<color>", "���1����Ӱ�⻷/#saleby_heroling_confirm(30,'sale_heroling_anying')", "����/enter_heroling", "�뿪/tong_cancel"},
						{"<dec>����һ�����Ϸ�ɫ�ʵĹ⻷. ��ȡ�㽶�⻷��Ҫ���׵� <color=yellow>30 ��<color>. ����ֵ, ʹ��������1��.", "��ȡ1���㽶�⻷/#saleby_heroling_confirm(30,'sale_heroling_xiangjiao')", "����/enter_heroling", "�뿪/tong_cancel"},
						{"<dec>��ϲ��������? ����⻷�������ӥ�����յĸо�? ���ţ�ʹ��������1��.<enter>��Ҫ�õ�������Ź⻷Ҫ�õĹ��׵���: <color=yellow>30 ��<color>", "��ȡ1����ӥ�⻷/#saleby_heroling_confirm(30,'sale_heroling_cangying')", "����/enter_heroling", "�뿪/tong_cancel"},
						{"<dec>αװ����ǿ���αװ10�Σ�αװʱ��24Сʱ�����.����10�ν�������ʹ��αװ����.<enter>�iαװ�������Ĺ���ֵΪ��<color=yellow>300 ��<color>", "��ȡ1��αװ���/#saleby_heroling_confirm(300,'sale_heroling_weizhuang')", "����/enter_heroling", "�뿪/tong_cancel"},
						{"<dec>�������й�ʱ�����������ĵ�ҩ��������1.6������ֵ��ÿ������ʹ��6��Сʱ<enter>�i���Խ���1�Ŵ󻹵��Ĺ���ֵ��: <color=yellow>30 ��<color>", "�һ�1�Ŵ󻹵�/#saleby_heroling_confirm(1,30,'sale_heroling_dahuandan')", "�һ�2�Ŵ󻹵�/#saleby_heroling_confirm(2,60,'sale_heroling_dahuandan')", "�һ�5�Ŵ󻹵�/#saleby_heroling_confirm(5,150,'sale_heroling_dahuandan')", "�һ�10�Ŵ󻹵�/#saleby_heroling_confirm(10,300,'sale_heroling_dahuandan')", "����/enter_heroling", "�뿪/tong_cancel"},
																	};
	if (arySalebyHeroling[nSel]) then
		if (nSel == 8) then
			nRestH, nRestM = GetMinAndSec(GetTask(TASKID_TECHAN_HUANDAN_TIME));
			arySalebyHeroling[nSel][1] = arySalebyHeroling[nSel][1].."<enter>�󻹵���ʹ��ʱ�仹��: <color=yellow>"..nRestH.."ʱ"..nRestM.."��<color>"
		end;
		arySalebyHeroling[nSel][1] = arySalebyHeroling[nSel][1].."<enter>���ڿ���ʹ�÷��Ӣ�����������: <color=yellow>"..nCount.." c�i<color><enter>���ڿ���ʹ�õ��ܹ���ֵ��: <color=yellow>"..GetContribution().." ��<color><enter>��ͬ�⻻��?"
		CreateTaskSay(arySalebyHeroling[nSel]);
	end;
end;

function saleby_heroling_confirm(nCount, nPrice, szfunc)
	if (not szfunc) then
		szfunc = nPrice;
		nPrice = nCount;
		nCount = 1;
	end;
	local _, nTongID = GetTongName();
	if (check_salebyheroling(nTongID, nPrice) == 1) then
		local nHeroling = GetTask(TASKID_HEROLING_COUNT);
		SetTask(TASKID_HEROLING_COUNT, nHeroling - 1);
		AddContribution(-nPrice);
		heroling_applyaddtask(nTongID, 1);	--���Ӱ���ۻ����Ӣ���������
		dostring(szfunc.."("..nCount..","..nPrice..")");
	end;
end;
-----�Է��Ӣ�����������Ʒ End

-----�һ����Ӣ���� Start
function change_contribution_heroling()
	if (tonumber(GetLocalDate("%Y%m%d")) > 20070101) then
		CreateTaskSay({"<dec>���Ӣ��������01-01-2007����. 08-01-2007֮ǰ, ��ҿ��Լ����÷��Ӣ���ȡ����.", "�����Ի�/tong_cancel"});
		return 0;
	end;
	local nWeekOffer = GetWeeklyOffer();--������ۻ����׶�
	local nUsedOffer = GetTask(TASKID_CONTRIBUTE_USED);
	local nMyCount = GetTask(TASKID_LASTHERO_TAKED);
	local nLastTime = GetTask(TASKID_LASTHERO_DATE);
	local nLastDate = mod(nLastTime , 1000);
	local nLastWeek = floor(nLastTime / 1000);
	local nDate = tonumber(GetLocalDate("%j"));
	local nWeek = tonumber(GetLocalDate("%W"));
	
	if (nWeek ~= nLastWeek) then
		nLastWeek = nWeek;
		SetTask(TASKID_CONTRIBUTE_USED, 0);
		nUsedOffer = 0;
	end;
	if (nDate ~= nLastDate) then
		nLastDate = nDate;
		SetTask(TASKID_LASTHERO_TAKED, 0);
		nMyCount = 0;
	end;
	
	SetTask(TASKID_LASTHERO_DATE, nLastWeek * 1000 + nLastDate);
	local nHeroCount = floor((nWeekOffer - nUsedOffer)/100);
	
	if (nHeroCount > 3 - nMyCount) then
		nHeroCount = 3 - nMyCount;
	end;
	if (nHeroCount > 0) then
		CreateTaskSay({"<dec>�����ڻ��׬ȡ���׶�. ���׶���ϵͳ�Զ���¼���ۣ�ÿ���۵� <color=yellow>100�����׶�<color>�����Ա���Ե���̴�����ȡ1�����Ӣ���ÿ����ȡ�������ó��� <color=yellow>3 ��<color>, ÿ�ܽ�������."
	.."<enter>�i���۵Ĺ��׶��ǣ�<color=yellow>"..nWeekOffer.." ��<color>."
	.."<enter>���ڿ��Ի�ȡ���Ӣ����: <color=yellow>"..nHeroCount.." ��<color>.",
	"��Ҫ��ȡ���Ӣ����/#sure_contribution_heroling("..nHeroCount..")", "����/enter_heroling", "�뿪/tong_cancel"});
	else
		CreateTaskSay({"<dec>�i�����ڻ��׬ȡ���׶�. ���׶���ϵͳ�Զ���¼���ۣ�ÿ���۵� <color=yellow>100 �����׶�<color> �����Ա���Ե���̴�����ȡ1�����Ӣ���ÿ����ȡ�������ó��� <color=yellow>3��<color>, ÿ�ܽ�������."
	.."<enter>�i���۵Ĺ��׶��ǣ�<color=yellow>"..nWeekOffer.." ��<color>."
	.."<enter>���ڿ��Ի�ȡ���Ӣ���<color=yellow>"..nHeroCount.." ��<color>.",
	"����/enter_heroling", "�뿪/tong_cancel"});
	end;
end;

function sure_contribution_heroling(ncount)
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	SetTask(TASKID_HEROLING_COUNT, GetTask(TASKID_HEROLING_COUNT) + ncount);	--���ӷ��Ӣ���������
	SetTask(TASKID_CONTRIBUTE_USED, GetTask(TASKID_CONTRIBUTE_USED) + ncount * 100);	--���Ӷһ����ĵĹ��׶�
	SetTask(TASKID_LASTHERO_TAKED, GetTask(TASKID_LASTHERO_TAKED) + ncount);		--���ӱ�����ȡ������
	Msg2Player("��õ�"..ncount.." �����Ӣ����.");
end;

-----�һ����Ӣ���� End
-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec(nSec)
	nRestMin = floor(nSec / 60);
	nRestSec = mod(nSec,60)
	return nRestMin, nRestSec;
end;

-----�һ�Boss�ٻ���
--AddItem(6, 1, 1022, 10, 0, 0, 0);
function change_heroling_bosscharm()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	local nTongHeroling = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	local nUseHeroling = TONG_GetTaskValue(nTongID, TONGTSK_USEHEROLING);
	CreateTaskSay({"<dec>���Ҫ���ŷ��Ӣ����һ�Boss�ٻ���. ���۷�ʽ�ǣ��������÷��Ӣ�������Ʒʱ����Ʒ���ᱻ�������������. ���õ� <color=yellow>63�����Ӣ����<color> ��������Ͽ��Զһ�1��Boss�ٻ���.���Ӣ������۵����������ÿ��<color=yellow>900��<color>. �����µ�һ������Ӣ������ͷ����.<enter>һ�ܰ����Ӣ������۵������ǣ�"..nTongHeroling.." ��.<enter>�����ڶһ�Boss�ٻ����İ����Ӣ����������ǣ�"..(nTongHeroling-nUseHeroling).." ��<enter>, ������ȡ����Boss�ٻ����������ǣ�"..floor((nTongHeroling-nUseHeroling)/63).."��", "�һ�Boss�ٻ���/sure_heroling_bosscharm", "����/enter_heroling", "�뿪/tong_cancel"});
end;


function sure_heroling_bosscharm()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
		CreateTaskSay({"<dec>ֻ�а������ϲſ���ʹ�÷��Ӣ����һ�Boss�ٻ���.", "�����Ի�/tong_cancel"});
		return 0;
	end;
	local nTongHeroling = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	local nUseHeroling = TONG_GetTaskValue(nTongID, TONGTSK_USEHEROLING);
	local nCount = floor((nTongHeroling-nUseHeroling) / 63);
	if (nCount < 1) then
		CreateTaskSay({"<dec>�������÷��Ӣ����һ�1��Boss�ٻ���. ���Ӣ����Ļ���ÿ����Ҫ����Ŭ��.", "�����Ի�/tong_cancel"});
		return 0;
	end;
	if (CalcFreeItemCellCount() < nCount * 2) then
		CreateTaskSay({"<dec>�����ռ䲻��. ���ܻ���ȡ�� "..nCount.." Boss�ٻ�������������.", "�����Ի�/tong_cancel"});
		return 0;
	end;
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_USEHEROLING, nCount*63);
	for i=1, nCount do
		AddItem(6, 1, 1022, 10, 0, 0, 0);
	end;
	Msg2Player("��õ� "..nCount.." Boss�ٻ���.");
end;
-----�һ�Boss�ٻ��� end


-----�һ��й��ܼ�
function change_letter_honour()
	CreateTaskSay({"<dec>�����Ӣ������<color=yellow>120��<color> ��ÿ��5����6���Բμӻ<color=yellow>׷���ܼ�color>. ��5����6�����ִ���������<color=yellow>������<color> �����ܼ�. ������Ҫ�ҵ���Щ���������ϵ��ܼ�. �����˳��ֵ�ʱ����7h30, 7h40, 7h50, ����Ѱ�����ŵ�ʱ���� <color=yellow>7h35, 7h45, 7h55<color>. ��ȡ���ܼ���ʱ����1���ӣ�֮��Ҫ�����Ͻ�����͢. ��͢���������ʹ�<color=yellow>25�������������<color>. �����˵������ǣ�<enter>"
	.."������: 220/200     �����: 438/396<enter>"
	.."������: 197/188     �����: 215/185<enter>"
	.."������: 233/287     ʯ����: 214/205<enter>"
	.."��Ȫ��: 216/199",
	"���ǽ������ҵ��ܼ�!/sure_letter_honour", "�ص�֮ǰ�Ĳ���/enter_heroling", "�뿪/tong_cancel"});
end;

function sure_letter_honour()
	local _, nTongID = GetTongName();
	
	local count = CalcEquiproomItemCount(4,1121,1,-1);
	if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
		CreateTaskSay({"<dec>������ɰ������Ͻ�����.", "֪����/tong_cancel"});
	elseif (count < 1) then
		CreateTaskSay({"<dec>����ôû�����ܼ�����?", "�����Ի�/tong_cancel"});
	elseif (CalcFreeItemCellCount() < 25) then
		CreateTaskSay({"<dec>�����ռ䲻��, ���ܽ�������.", "�����������±���./tong_cancel"});
	else
		ConsumeEquiproomItem(1,4,1121,1,-1);
		for i = 1, 25 do
			AddItem(6,1,1257,1,1,1); 
		end;
		Msg2Player("�õ�25��������������");
	end;
end;

--���Ӱ���ۻ����Ӣ����
function heroling_applyaddtask(nTongID, nValue)
	local ntask = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	if (ntask < 900) then
		ntask = ntask + nValue;
		if (ntask + nValue > 900) then
			nValue = 900 - ntask;
		end;
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_HEROLING, nValue);
	end;
end;