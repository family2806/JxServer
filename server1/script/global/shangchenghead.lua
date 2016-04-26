--游戏时间
FRAME2TIME		= 18;			-- 18侦相当于游戏中1秒钟
--赏善令奖励，多长时间内双倍经验
AEXP_ADWARD_TIME = 4

--记录当前文件各个城市赏善令的tab文件
--windows下面
--CITYPRIZETABFILENAME	=	"data\\cityprize.txt"
--Linux下面
CITYPRIZETABFILENAME	=	"data//cityprize.txt"

AEXP_LOAD		= 0

--赏善令
AEXP_AWARDMEDIAL_NGENTYPE 		= 6;
AEXP_AWARDMEDIAL_DETAILTYPE 	= 1;
AEXP_AWARDMEDIAL_PARTYPE 		= 197;

--罚恶令
AEXP_PUNISHMEDIAL_NGENTYPE 		= 6;
AEXP_PUNISHMEDIAL_DETAILTYPE	= 1;
AEXP_PUNISHMEDIAL_PARTYPE 		= 198;

--可以领奖持续天数
AEXP_ADWARD_HOURNUM	= 24
--开始奖赏的最大值
AEXP_MAXADWARDNUM = 9999

--全局任务变量(城市赏善令数量)
AEXP_GLOBAL_FENGXIANG	= 20
AEXP_GLOBAL_CHNEGDU		= 21
AEXP_GLOBAL_DALI		= 22
AEXP_GLOBAL_BIANJING	= 23
AEXP_GLOBAL_XIANGYANG	= 24
AEXP_GLOBAL_YANGZHOU	= 25
AEXP_GLOBAL_LINAN		= 26
--当前开奖城市
AEXP_GLOBAL_ADWARD_CITY	= 27
--开奖最后日期
AEXP_GLOBAL_ENDDATE 	= 28
--是否加载过存盘文件
AEXP_BLNLOADFILE		= 29


--任务变量
AEXP_TASK_ADWARDDATE	= 606	--存储玩家领奖日期
AEXP_PLAYERTONG_LIMIT   = 1 	--玩家入帮时间必须大于该值，才可以领取奖品。单位为天数(和脚本比较时请注意)

--城市和全局变量的对应表
arraycitytoglobalvalue =
{
	AEXP_GLOBAL_FENGXIANG,
	AEXP_GLOBAL_CHNEGDU,
	AEXP_GLOBAL_DALI,
	AEXP_GLOBAL_BIANJING,
	AEXP_GLOBAL_XIANGYANG,	
	AEXP_GLOBAL_YANGZHOU,
	AEXP_GLOBAL_LINAN,
};

--城市索引和城市名称对应表
arraycityindextoname =
{
	"凤翔",
	"成都",
	"大理",
	"汴京",
	"襄阳",
	"扬州",
	"临安",
};

--累计大于某值时存盘
AEXP_ADDMAX_SAVE = 1000
--累计小于某值时存盘
AEXP_REDUCEMAX_SAVE = 1000

function loadsavevalue()
	blnLoad = GetGlbValue(AEXP_BLNLOADFILE)
	if (blnLoad == nil or blnLoad == 0) then
		SetGlbValue(AEXP_BLNLOADFILE, 1)
		
		handle = openfile(CITYPRIZETABFILENAME, "r")
		if (handle == nil) then
			return 
		end
		
		for nIndex=AEXP_GLOBAL_FENGXIANG, AEXP_GLOBAL_ENDDATE do
			nValue = read(handle, "*l")
			if (nValue == nil or nValue == "") then
				nValue = 0
			else
				nValue = tonumber(nValue)
			end
			
			SetGlbValue(nIndex, nValue)
		end		
		
		closefile(handle)					
	end	
end

--为了防止seek寻找file出错，而且目前使用数据较少，存盘时清除文件重新写一个新文件
function savevalue()
	handle = openfile(CITYPRIZETABFILENAME, "w+")
	if (handle == nil) then
		return 0
	end

	for nIndex=AEXP_GLOBAL_FENGXIANG, AEXP_GLOBAL_ENDDATE do
		local nValue = GetGlbValue(nIndex)
		write(handle, nValue.."\n")	
	end
	
	closefile(handle)
end
