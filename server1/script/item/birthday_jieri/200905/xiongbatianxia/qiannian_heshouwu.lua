-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - ǧ�������
-- �ļ�������qiannian_heshouwu.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-21 12:17:35
-- ת�����ɫʹ�ã�ͨ������Ʒ�����25��Ǳ�ܵ�

-- ======================================================

IncludeLib("SETTING");

TSK_QIANNIAN_HESHOUWU_PROP = 2597;

function main()
	if (GetTask(TSK_QIANNIAN_HESHOUWU_PROP) >= 25) then
		Msg2Player("����Ʒ�������������Ĺ���.");
		return 1;
	end
	
	if (ST_IsTransLife() ~= 1) then
		Msg2Player("�������ܻ���κ�Ч��.");
		return 1;
	end
	
	local tb_prop = {
		{pot=3,msg="һ��"},
		{pot=4,msg="δ��ŵ"},
		{pot=5,msg="һЩ"},
		{pot=6,msg="����"},
		{pot=7,msg="�е��"},
		};
	
	local n_rand = random(1,5);
	local n_prop = tb_prop[n_rand].pot
	if (n_prop + GetTask(TSK_QIANNIAN_HESHOUWU_PROP) > 25) then
		n_prop = 25 - GetTask(TSK_QIANNIAN_HESHOUWU_PROP);
	end
	
	AddProp(n_prop);
	
	SetTask(TSK_QIANNIAN_HESHOUWU_PROP,GetTask(TSK_QIANNIAN_HESHOUWU_PROP)+ n_prop);
	
	Msg2Player(format("ʹ�ú���Ի��%s Ч��",tostring(n_prop)));
end
