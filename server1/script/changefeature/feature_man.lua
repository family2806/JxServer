Include("\\script\\dailogsys\\dailogsay.lua")

Include("\\script\\changefeature\\equip_tryon.lua")
tbFeatureNpc = {}


function tbFeatureNpc:SelectType()
	local szTitle = "��ѡ��λ��"
	
	
	local tbOpt = {}
	
	for key , value in tbEquipTryOn.tbTemplate do
		tinsert(tbOpt, {key, value.DailogMenu, {value, 1}})
	end
	
	tinsert(tbOpt, {"����", self.Dialog, {self}})
	tinsert(tbOpt, {"�����Ի�"})
	
	CreateNewSayEx(szTitle, tbOpt)
end
	
function tbFeatureNpc:Dialog()
	
	local szTitle = "���ã�����,�Ϸ���ʲô�ܰ������� "
	local tbOpt = 
	{
		{"��ǰ��װ������", self.SelectType, {self}},
		{"����װ������ҪԤ������?", self.InjectToItem, {self}},
		{"ɾ��ĿǰЧӦ", RestoreOwnFeature},
		{"��ô������װ������?",  self.Explain, {self}},
		{"˳��Ĺ�ȥ"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbFeatureNpc:Explain()
	local szTitle = "������԰�����Ҫ���� 'װ������' �ռ�����Ҫ�Ĳ��ϣ��羫��ʯ����Ҫ������װ���������Ϸ�����ҽ����������Ҫ������װ�������ԣ���ֻ��Ҫ�����������װ�������ø���װ����ǿ���ǰɣ�."
	local tbOpt = 
	{
		{"����", self.Dialog, {self}},
		{"�����Ի�"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbFeatureNpc:InjectToItem()
	local szTitle = "��ѡ��λ��"
	
	
	local tbOpt = {}
	
	for key , value in tbEquipTryOn.tbTemplate do
		tinsert(tbOpt, {key, value.AskFeatureNo, {value}})
	end
	
	tinsert(tbOpt, {"����", self.Dialog, {self}})
	tinsert(tbOpt, {"�����Ի�"})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function main()
	return tbFeatureNpc:Dialog()
end
