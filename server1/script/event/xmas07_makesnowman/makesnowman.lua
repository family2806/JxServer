-- �ļ�������makesnowman.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2007-11-23 10:56:30

Include("\\script\\event\\xmas07_makesnowman\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\basic.lua");
function main()
	xmas07_makeSnowMan_main()
end
function xmas07_makeSnowMan_main()
	if xmas07_makeSnowMan_isActPeriod() == 0 then
		Say(format("�<color=yellow>%s<color> �ѽ���!",xmas07_makeSnowMan_ActName),0)
		return 0;
	end
	local tbDialog =
	{
		"<dec><npc>������ʥ�����֣�",
		"�����˽�����/xmas07_makeSnowMan_Content",
		"������ѩ��./xmas07_makeSnowMan_wantCompose",
		"�����Ի�/OnCancel",
	}

	CreateTaskSay(tbDialog)
end
function xmas07_makeSnowMan_Content()
	local tbDialog =
	{
		"<dec><npc>��<color=red>0h00 �� 08-12-2007 �� 24h00��13-01-2008<color>,��������ʿ���ʱ����<color=yellow>ʥ�����<color>, ��ʥ����н������ѩ�˵�ԭ�ϡ��ռ���ԭ�Ϻ󣬿��Ե�����<color=yellow> ����ѩ�� <color> .<enter>�ڳ�������ʹ�û�ѩ�ˣ���ѩ�ˣ�������ѩ�˿��Ի��<color=red>1000000 ����ֵ<color> �Լ�һ��<color=red>��Ʒ<color>, ��Ȼ��������ˣ����Խг�<color=yellow>ѩ��boss<color>, ���ѩ��boss���л������м�ֵ�Ľ���",
		"����������֪����/xmas07_makeSnowMan_main"
	}
	CreateTaskSay(tbDialog)
end
function xmas07_makeSnowMan_wantCompose()
	local tbDialog = 
	{
		"<dec><npc>��������ʿ���ʱ���л����<color=yellow>����<color> ��ϵ��ľϵ��ˮϵ����ϵ����ϵ��ʹ�ò�ͬ�ı����������ͬ��ѩ�ˣ�������Ҫ���֣�",
		"�������ѩ��'/#xmas2007_makeSnowMan_compose([[Yellow]])",
		"��������ѩ��'/#xmas2007_makeSnowMan_compose([[Purple]])",
		"��������ѩ��'/#xmas2007_makeSnowMan_compose([[Green]])",
		"�Ժ����/OnCancel"
	}
	CreateTaskSay(tbDialog)
end
xmas2007_makeSnowMan_tbItem =
{
	{1, {6,1,1634,1,0,0}, "��ѩ��"},
	{1, {6,1,1635,1,0,0}, "��ѩ��"},
	{1, {6,1,1636,1,0,0}, "��ѩ��"},
}
xmas2007_makeSnowMan_tbMaterial =
{
	{0, {6,1,1633,nil,nil,nil}, "��ɫ����"},
	{0, {6,1,1628,nil,nil,nil}, "�����"},
	{0, {6,1,1629,nil,nil,nil}, "ľ����"},
	{0, {6,1,1630,nil,nil,nil}, "ˮ����"},
	{0, {6,1,1631,nil,nil,nil}, "�����"},
	{0, {6,1,1632,nil,nil,nil}, "������"},
}
xmas2007_makeSnowMan_Recipe =
{
	Yellow	= {tbItemList = {1,2,3,4,5,6}, nMoney = 0, tbResult = xmas2007_makeSnowMan_tbItem[1]},		--1��ɫ���� + 2 ����� + 3 ľ���� + 4 ˮ���� + 5 ����� + 6 ������
	Purple	= {tbItemList = {0,2,3,4,5,6}, nMoney = 0, tbResult = xmas2007_makeSnowMan_tbItem[2]},		--0��ɫ���� + 2 ����� + 3 ľ���� + 4 ˮ���� + 5 ����� + 6 ������
	Green	= {tbItemList = {0,2,3,4,5,6},nMoney = 100000, tbResult = xmas2007_makeSnowMan_tbItem[3]},	--10 ���� + 0��ɫ���� + 2 ����� + 3 ľ���� + 4 ˮ���� + 5 ����� + 6 ������
}

function xmas2007_makeSnowMan_ComposeConfirm(szSelect)
	local tbMaterial = xmas2007_makeSnowMan_tbMaterial;
	local szMaterialList = nil;
	for i=1,getn(tbMaterial) do
		tbMaterial[i][1] = xmas2007_makeSnowMan_Recipe[szSelect].tbItemList[i];
		if tbMaterial[i][1] ~= 0 then
			if not szMaterialList then
				szMaterialList = format("<color=red>%d<color> <color=yellow>%s<color>",tbMaterial[i][1],tbMaterial[i][3])
			else
				szMaterialList = format("%s, <color=red>%d<color> <color=yellow>%s<color>",szMaterialList,tbMaterial[i][1],tbMaterial[i][3])
			end
		end
	end
	local tbAwardItem = xmas2007_makeSnowMan_Recipe[szSelect].tbResult
	local nMoney = xmas2007_makeSnowMan_Recipe[szSelect].nMoney;
	
	if xmas2007_makeSnowMan_CheckMaterial(tbMaterial) ~= 1 then
		Say(format("��������ԭ�ϣ���Ҫ��%s ������.",szMaterialList), 1 , "���ǲ�����˼�����Ժ�����./OnCancel")
		return 0;
	end
	if Pay(nMoney) == 0 then
		Say(format("�����ˣ���Ǯ��������Ҫ<color=yellow>%d<color>��",nMoney),0)
		return 0;
	end
	if nMoney ~= 0 then
		Msg2Player(format("����<color=yellow>%d<color> ��",nMoney))
	end
	if xmas2007_makeSnowMan_ConsumeMaterial(tbMaterial) ~= 1 then
		Say("����ʧ�ܣ�ʧȥһЩԭ��.",0)
		return 0;
	end
	xmas2007_SnowManItem_AddItem(tbAwardItem[3],tbAwardItem[2]);
	Say(format("ѩ���ˣ�����, <color=yellow>%s<color> �Ѿ���ɹ��ˣ�����ȡ!",tbAwardItem[3]))
end
function xmas2007_makeSnowMan_compose(szSelect)
	local tbMaterial = xmas2007_makeSnowMan_tbMaterial;
	local szMaterialList = nil;
	for i=1,getn(tbMaterial) do
		tbMaterial[i][1] = xmas2007_makeSnowMan_Recipe[szSelect].tbItemList[i];
		if tbMaterial[i][1] ~= 0 then
			if not szMaterialList then
				szMaterialList = format("<color=red>%d<color> <color=yellow>%s<color>",tbMaterial[i][1],tbMaterial[i][3])
			else
				szMaterialList = format("%s, <color=red>%d<color> <color=yellow>%s<color>",szMaterialList,tbMaterial[i][1],tbMaterial[i][3])
			end
		end
	end
	local tbAwardItem = xmas2007_makeSnowMan_Recipe[szSelect].tbResult
	local nMoney = xmas2007_makeSnowMan_Recipe[szSelect].nMoney;
	if nMoney ~= 0 then 
		szMaterialList = format("%s, ��Ҫ��<color=yellow>%d<color>��",szMaterialList,nMoney)
	end
	local tbNpcSay =
	{
		format("<dec><npc>���� <color=yellow>%s<color>, ��Ҫ%s.",tbAwardItem[3],szMaterialList),
		format("��ѩ��/#xmas2007_makeSnowMan_ComposeConfirm([[%s]])",szSelect),
		"����׼����/OnCancel",
	}
	CreateTaskSay(tbNpcSay)
end

function xmas2007_makeSnowMan_CheckMaterial(tbMaterial)
	for i=1,getn(tbMaterial) do
		local tbItem =  tbMaterial[i]
		local nLevel = tbItem[2][4] or -1
		if tbItem[1] > 0 and CalcEquiproomItemCount(tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel) < tbItem[1] then
			return 0;
		end
	end
	return 1;
end

function xmas2007_makeSnowMan_ConsumeMaterial(tbMaterial)
	for i=1,getn(tbMaterial) do
		local tbItem =  tbMaterial[i]
		local nLevel = tbItem[2][4] or -1
		--print(tbItem[1],tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel)
		if tbItem[1] > 0 and ConsumeEquiproomItem(tbItem[1],tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel) ~= 1 then
			return 0;
		end
	end
	return 1;
end

function OnCancel()
end
