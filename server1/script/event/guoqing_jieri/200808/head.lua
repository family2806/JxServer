-- ====================== �ļ���Ϣ ======================

-- ������Ե�����һ׷Ѱ���׹�����Ϣ�ű�

-- Edited by �ӷ��~
-- 2008/07/24 13:43

-- ======================================================


ZHUIXUNMIPU_START	=	08081000;		-- ���ʼʱ�䣨�汾��(yymmddHH)
ZHUIXUNMIPU_CLOSE	=	08082024;		-- �����ʱ��

ZHUIXUNMIPU_ITEM_TIME	=	08082724;
ZHUIXUNMIPU_MAXEXP		=	800000000;		-- ����ʹ�þ�������
ZHUIXUNMIPU_EXPPER		=	1500000;		-- ʹ�õ���ÿ�λ�þ���ֵ

TSK_ZXMP_VERSION	= 1903;				-- ���ʼʱ�����ñ���
TSK_ZXMP_MAXEXP		= 1904;				-- ��þ����ۼƱ���

TB_ZHUIXUNMIPU_ITEMLIST = {
--	TYPE,	TBITEMID,	RATE,	NAME
	{n_type = 2,	tb_itemid = {0, 164},	n_rate = 0.0007,	sz_name = "�������ʯ����"},
	{n_type = 2,	tb_itemid = {0, 165},	n_rate = 0.001,	sz_name = "����ջ�ʯָ��"},
	{n_type = 2,	tb_itemid = {0, 166},	n_rate = 0.002,	sz_name = "�������ʯ����"},
	{n_type = 2,	tb_itemid = {0, 167},	n_rate = 0.001,	sz_name = "���Ѫʯ��ָ"},
	
	{n_type = 2,	tb_itemid = {0, 159},	n_rate = 0.002,	sz_name = "������ɴ����"},
	{n_type = 2,	tb_itemid = {0, 160},	n_rate = 0.001,	sz_name = "������ɰ����"},
	{n_type = 2,	tb_itemid = {0, 161},	n_rate = 0.004,	sz_name = "��������ѥ"},
	{n_type = 2,	tb_itemid = {0, 162},	n_rate = 0.004,	sz_name = "�������ٻ���"},
	{n_type = 2,	tb_itemid = {0, 163},	n_rate = 0.004,	sz_name = "������������"},
	
	{n_type = 1,	tb_itemid = {6,1,147,3,0,0},	n_rate = 4,	sz_name = "3��������ʯ"},
	{n_type = 1,	tb_itemid = {6,1,147,4,0,0},	n_rate = 1,	sz_name = "4��������ʯ"},
	{n_type = 1,	tb_itemid = {6,1,147,5,0,0},	n_rate = 0.5,	sz_name = "5��������ʯ"},
	
	{n_type = 1,	tb_itemid = {6,1,26,1,0,0},	n_rate = 0.003,	sz_name = "�����ؼ�"},
	{n_type = 1,	tb_itemid = {6,1,22,1,0,0},	n_rate = 0.003,	sz_name = "ϴˮ��"},
	
	{n_type = 3,	n_repute = 1,	n_rate = 44.4743,	sz_name = "����"},
	{n_type = 3,	n_repute = 2,	n_rate = 30,	sz_name = "����"},
	{n_type = 3,	n_repute = 3,	n_rate = 20,	sz_name = "����"},
};

TB_ZHUIXUNMIPU_COMPLIST = {
	{n_type = 1,	tb_itemid = {6,1,196,-1},	n_count = 5,	sz_name = "������ͼ"},
	{n_type = 1,	tb_itemid = {6,1,122,-1},	n_count = 1,	sz_name = "��Ե¶��С��"},
	{n_type = 4,	n_money = 10000,			n_count = 1,	sz_name = "����"},
}

function zxmp_reset_vertsk()
	if (GetTask(TSK_ZXMP_VERSION) ~= ZHUIXUNMIPU_START) then
		SetTask(TSK_ZXMP_VERSION, ZHUIXUNMIPU_START);
		SetTask(TSK_ZXMP_MAXEXP, 0);
	end
end


-- ����Ƿ��ڻ�ϳ�ʱ�䣺��1����0��
function zxmp_200808_checkdate()
	local n_date = tonumber(GetLocalDate("%y%m%d%H"));
	if (n_date >= ZHUIXUNMIPU_START and n_date <= ZHUIXUNMIPU_CLOSE) then
		return 1;
	end
	
	return 0;
end

-- ������ʹ��ʱ�䣺��1����0��
function zxmp_200808_itemdate()
	local n_date = tonumber(GetLocalDate("%y%m%d%H"));
	if (n_date <= ZHUIXUNMIPU_ITEM_TIME) then
		return 1;
	end
	
	return 0;
end

-- ���ʹ�õ��߾���
function zxmp_200808_checkexp()
	local n_curexp = GetTask(TSK_ZXMP_MAXEXP);
	
	if (n_curexp >= ZHUIXUNMIPU_MAXEXP) then
		return 0;
	elseif (ZHUIXUNMIPU_EXPPER + n_curexp <= ZHUIXUNMIPU_MAXEXP) then
		return ZHUIXUNMIPU_EXPPER;
	elseif (ZHUIXUNMIPU_EXPPER + n_curexp > ZHUIXUNMIPU_MAXEXP) then
		return (ZHUIXUNMIPU_MAXEXP - (ZHUIXUNMIPU_EXPPER + n_curexp));
	end
	
	return 0;		-- ���ֻ��Ϊ�˱������
end

