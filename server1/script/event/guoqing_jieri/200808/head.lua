-- ====================== 文件信息 ======================

-- 剑侠情缘网络版一追寻秘谱公共信息脚本

-- Edited by 子非魚
-- 2008/07/24 13:43

-- ======================================================


ZHUIXUNMIPU_START	=	08081000;		-- 活动开始时间（版本）(yymmddHH)
ZHUIXUNMIPU_CLOSE	=	08082024;		-- 活动结束时间

ZHUIXUNMIPU_ITEM_TIME	=	08082724;
ZHUIXUNMIPU_MAXEXP		=	800000000;		-- 道具使用经验上限
ZHUIXUNMIPU_EXPPER		=	1500000;		-- 使用道具每次获得经验值

TSK_ZXMP_VERSION	= 1903;				-- 活动起始时间设置变量
TSK_ZXMP_MAXEXP		= 1904;				-- 获得经验累计变量

TB_ZHUIXUNMIPU_ITEMLIST = {
--	TYPE,	TBITEMID,	RATE,	NAME
	{n_type = 2,	tb_itemid = {0, 164},	n_rate = 0.0007,	sz_name = "安邦冰晶石项链"},
	{n_type = 2,	tb_itemid = {0, 165},	n_rate = 0.001,	sz_name = "安邦菊花石指环"},
	{n_type = 2,	tb_itemid = {0, 166},	n_rate = 0.002,	sz_name = "安邦田黄石玉佩"},
	{n_type = 2,	tb_itemid = {0, 167},	n_rate = 0.001,	sz_name = "安邦鸡血石戒指"},
	
	{n_type = 2,	tb_itemid = {0, 159},	n_rate = 0.002,	sz_name = "定国青纱长衫"},
	{n_type = 2,	tb_itemid = {0, 160},	n_rate = 0.001,	sz_name = "定国钨砂发冠"},
	{n_type = 2,	tb_itemid = {0, 161},	n_rate = 0.004,	sz_name = "定国赤娟短靴"},
	{n_type = 2,	tb_itemid = {0, 162},	n_rate = 0.004,	sz_name = "定国紫藤护腕"},
	{n_type = 2,	tb_itemid = {0, 163},	n_rate = 0.004,	sz_name = "定国银蚕腰带"},
	
	{n_type = 1,	tb_itemid = {6,1,147,3,0,0},	n_rate = 4,	sz_name = "3级玄晶矿石"},
	{n_type = 1,	tb_itemid = {6,1,147,4,0,0},	n_rate = 1,	sz_name = "4级玄晶矿石"},
	{n_type = 1,	tb_itemid = {6,1,147,5,0,0},	n_rate = 0.5,	sz_name = "5级玄晶矿石"},
	
	{n_type = 1,	tb_itemid = {6,1,26,1,0,0},	n_rate = 0.003,	sz_name = "武林秘籍"},
	{n_type = 1,	tb_itemid = {6,1,22,1,0,0},	n_rate = 0.003,	sz_name = "洗水晶"},
	
	{n_type = 3,	n_repute = 1,	n_rate = 44.4743,	sz_name = "名望"},
	{n_type = 3,	n_repute = 2,	n_rate = 30,	sz_name = "名望"},
	{n_type = 3,	n_repute = 3,	n_rate = 20,	sz_name = "名望"},
};

TB_ZHUIXUNMIPU_COMPLIST = {
	{n_type = 1,	tb_itemid = {6,1,196,-1},	n_count = 5,	sz_name = "神秘密图"},
	{n_type = 1,	tb_itemid = {6,1,122,-1},	n_count = 1,	sz_name = "福缘露（小）"},
	{n_type = 4,	n_money = 10000,			n_count = 1,	sz_name = "银两"},
}

function zxmp_reset_vertsk()
	if (GetTask(TSK_ZXMP_VERSION) ~= ZHUIXUNMIPU_START) then
		SetTask(TSK_ZXMP_VERSION, ZHUIXUNMIPU_START);
		SetTask(TSK_ZXMP_MAXEXP, 0);
	end
end


-- 检查是否在活动合成时间：是1，否0；
function zxmp_200808_checkdate()
	local n_date = tonumber(GetLocalDate("%y%m%d%H"));
	if (n_date >= ZHUIXUNMIPU_START and n_date <= ZHUIXUNMIPU_CLOSE) then
		return 1;
	end
	
	return 0;
end

-- 检查道具使用时间：是1，否0；
function zxmp_200808_itemdate()
	local n_date = tonumber(GetLocalDate("%y%m%d%H"));
	if (n_date <= ZHUIXUNMIPU_ITEM_TIME) then
		return 1;
	end
	
	return 0;
end

-- 检查使用道具经验
function zxmp_200808_checkexp()
	local n_curexp = GetTask(TSK_ZXMP_MAXEXP);
	
	if (n_curexp >= ZHUIXUNMIPU_MAXEXP) then
		return 0;
	elseif (ZHUIXUNMIPU_EXPPER + n_curexp <= ZHUIXUNMIPU_MAXEXP) then
		return ZHUIXUNMIPU_EXPPER;
	elseif (ZHUIXUNMIPU_EXPPER + n_curexp > ZHUIXUNMIPU_MAXEXP) then
		return (ZHUIXUNMIPU_MAXEXP - (ZHUIXUNMIPU_EXPPER + n_curexp));
	end
	
	return 0;		-- 这句只是为了避免出错
end

