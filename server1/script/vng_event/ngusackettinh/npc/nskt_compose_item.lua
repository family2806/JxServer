Include("\\script\\lib\\composeex.lua")
Include("\\script\\vng_event\\ngusackettinh\\head.lua")

if (not tbNSKT_ItemCompose) then
	tbNSKT_ItemCompose = {}
end

tbNSKT_ItemCompose.tbCrystalCompose = 
	{
		["��ɫ�ᾧ"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("��ʽᾧ�\t �ϳ� %s", "��ɫ�ᾧ"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "ľ�ᾧ", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "��ᾧ", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "���ᾧ", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "��ɫ�ᾧ", tbProp = {6,1,30077,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["��ɫ�ᾧ"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("��ʽᾧ�\t �ϳ� %s", "��ɫ�ᾧ"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "ľ�ᾧ", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "ˮ�ᾧ", tbProp = {6,1,30071,1,0,0}, nCount = 1},
								{szName = "��ᾧ", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "���ᾧ", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "��ɫ�ᾧ", tbProp = {6,1,30076,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["��ɫ�ᾧ"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("��ɫ�ᾧ�\t �ϳ� %s", "��ɫ�ᾧ"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "��ᾧ", tbProp = {6,1,30069,1,0,0}, nCount = 1},
								{szName = "ľ�ᾧ", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "ˮ�ᾧ", tbProp = {6,1,30071,1,0,0}, nCount = 1},
								{szName = "��ᾧ", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "���ᾧ", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "��ɫ�ᾧ", tbProp = {6,1,30075,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["����"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("��ʽᾧ�\t ��%s", "����"),
						nWidth = 2,
						nHeight = 3,
						nFreeItemCellLimit = 1,
						tbMaterial = 
							{
								{szName = "�ٻ�����", tbProp = {6,1,30074,1,0,0}, nCount = 60},								
							},
						tbProduct = {szName = "����", tbProp = {0,10,7,1,0,0},nCount=1,nExpiredTime=259200},
					},
					pCompos = nil;
			},
			["��������ʹ��"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("��ʽᾧ�\t ��%s", "��������ʹ��"),
						nWidth = 2,
						nHeight = 3,
						nFreeItemCellLimit = 1,
						tbMaterial = 
							{
								{szName = "�ٻ�����", tbProp = {6,1,30074,1,0,0}, nCount = 200},								
							},
						tbProduct = {szName = "����", tbProp = {0,10,7,1,0,0},nCount=1,},
					},
					pCompos = nil;
			},
		["����"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("��ʽᾧ�\t ��%s", "����"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "��������", tbProp = {6,1,30078,1,0,0}, nCount = 1},
								{szName = "����", tbProp = {6,1,30082,1,0,0}, nCount = 1},								
							},
						tbProduct = 
							{
								{szName="�Ҹ�����",tbProp={6,1,30080,1,0,0},nRate=80,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
								{szName="ƽ������",tbProp={6,1,30079,1,0,0},nRate=15,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
								{szName="������",tbProp={6,1,30081,1,0,0},nRate=5,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
							},
					},
					pCompos = nil;
			}
	}
	
function tbNSKT_ItemCompose:compose(szItemName)
	local tbItem = self.tbCrystalCompose[szItemName];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("�ϳ� [%s]", szItemName));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end