--心心相映符
--Suyu 2004.1.12

--万事通样例脚本(BlackBay.03.12.30)
Include("\\script\\battles\\battlehead.lua");
Include("\\script\\battles\\battleinfo.lua");
Include("\\script\\global\\forbidmap.lua");
IncludeLib("FILESYS")

function init(tb)
	local file = "\\settings\\forbitheart.txt"
	if (TabFile_Load(file, file) == 0) then
		return
	end
	local count = TabFile_GetRowCount(file)
	if (count < 2) then
		return
	end
	for i = 2, count do
		local mapid = tonumber(TabFile_GetCell(file, i, 1))
		if (mapid > 0) then
			tb[mapid] = 1
		end
	end
end

FORBITMAP_LIST  = {}
init(FORBITMAP_LIST)

function add_forbitmap(mapid)
	FORBITMAP_LIST[mapid] = 1
end

function del_forbitmap(mapid)
	FORBITMAP_LIST[mapid] = nil
end


FORBIT_TEMPLATEMAP_LIST  = {}
function add_forbit_templatemap(mapid)
	FORBIT_TEMPLATEMAP_LIST[mapid] = 1
end

function del_forbit_templatemap(mapid)
	FORBIT_TEMPLATEMAP_LIST[mapid] = nil
end

function use_heart(bForever)
	nSubWorldID = SubWorldIdx2ID();
	W,X,Y = GetWorldPos();
	local nMapTemplateID = SubWorldIdx2MapCopy(SubWorld)
	
	local nSongNumber = 60; -- 宋方人数
	local nJinNumber = 70;  -- 金方人数
	local nMapId = W;
	
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("在此你不能使用此道具");
			return 1;
		end
	end	
	if checkYDBZMaps(nSubWorldID) == 1 then
		Msg2Player("此地你不能使用此道具");
		return 1
	end

	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用心心相映符。");
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用心心相映符。");
		return 1
	end
	
	if (nSubWorldID == 44 or nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223)	or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 ) )then 
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用心心相映符。");
		--AddItem(6,1,18,1,0,0,0);
		return 1
	end;

	if (FORBITMAP_LIST[nSubWorldID] == 1 or FORBIT_TEMPLATEMAP_LIST[nMapTemplateID] == 1) then
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用心心相映符。")
		return 1
	end

	--卫国战争之烽火连城地图，不能使用
	if (checkHFMaps(nSubWorldID) == 1) then
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用心心相映符。");
		return 1
	end;

	if (checkBWMaps(nSubWorldID) == 1) then
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用心心相映符。");
		return 1
	end;
	
	if checkActMaps(nSubWorldID) == 1 then
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用心心相映符。");
		return 1
	end
	
	if (checkZQMaps(nSubWorldID) == 1) then
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用心心相映符。");
		return 1
	end;
	
	if (checkNEWPRACTICEMaps(nSubWorldID) == 1) then
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用心心相映符。");
		return 1
	end;
	
	-- 心心相映符功能被屏蔽，不能使用
	if (IsDisabledUseHeart(PlayerIndex) == 1) then 
		Msg2Player("对不起，您目前不能使用心心相映符。");
		--AddItem(6,1,18,1,0,0,0);
		return 1
	end;

	Lover = GetMateName();
	if (Lover == "") then 
		Msg2Player("未婚人士无法使用！");
		--AddItem(6,1,18,1,0,0,0);
		return 1
	end;
	if (bForever == 0) then
		QueryWiseManForSB("LoverCB_C", "UnlineCB_C", 1000, Lover);
		return 0
	else
		QueryWiseManForSB("LoverCB_F", "UnlineCB_F", 1000, Lover);	
		return 1
	end
end;

--消耗性心心相映付，每次使用成功会消耗一个
function LoverCB_C(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect, nMapTemplateID)
	_LoverCallBack(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect,nMapTemplateID ,0)
end

--永久性心心相映付，不限使用次数
function LoverCB_F(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect,nMapTemplateID)
	_LoverCallBack(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect,nMapTemplateID, 1)
end

--此函数为成功查询信息的回调函数，参数个数和参数顺序不允许改变
function _LoverCallBack(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect,nMapTemplateID,  bForever)
	if (nSubWorldID > 70000) then
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法传入。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0;
	end
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nSubWorldID == tbBATTLEMAP[i] ) then
			Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法传入。");
			if (bForever == 0) then
				AddItem(6,1,18,1,0,0,0);
			end
			return 0;
		end
	end
	
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法传入。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0)
		end;
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法传入。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0)
		end;
		return 1
	end
	
	if (nSubWorldID == 44 or  nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223) or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 )) then 
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法传入。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0)
		end;
		return 0
	end;
	
	if (FORBITMAP_LIST[nSubWorldID] == 1 or FORBIT_TEMPLATEMAP_LIST[nMapTemplateID] == 1 ) then
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法传入。")
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0)
		end
		return 0
	end

	if checkActMaps(nSubWorldID) == 1 then
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法传入。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 1
	end
	
	if (checkBWMaps(nSubWorldID) == 1) then
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法使用心心相映符。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end;
	
	if (checkZQMaps(nSubWorldID) == 1) then
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法使用心心相映符。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end;	
	if (checkTONGMaps(SubWorldIdx2MapCopy(SubWorld)) == 1) then
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法使用心心相映符。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end;	
	if (checkNEWPRACTICEMaps(nSubWorldID) == 1) then
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法使用心心相映符。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0)
		end
		return 0
	end;		

	if checkYDBZMaps(nSubWorldID) == 1 then
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法使用心心相映符。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end
	
	-- 配偶被保护(可能是在自动挂机中，心心相映符功能被屏蔽，不能使用)
	if (bTargetProtect > 0) then 
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法传入。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end;

	--卫国战争之烽火连城地图，不能使用
	if (checkHFMaps(nSubWorldID) == 1) then
		Msg2Player("对不起，您的配偶目前所在地图属于特殊区域，无法使用心心相映符。");
		if (bForever == 0) then
			AddItem(6,1,18,1,0,0,0);
		end
		return 0
	end;

	NewWorld(nSubWorldID,nPosX, nPosY);
	SetFightState(nFightMode)
end;


function UnlineCB_C(TargetName, MoneyToPay)
	return _UnlineCallBack(TargetName, MoneyToPay, 0)
end

function UnlineCB_F(TargetName, MoneyToPay)
	return _UnlineCallBack(TargetName, MoneyToPay, 1)
end

--此函数为失败查询(也就是不在线)信息的回调函数，参数个数和参数顺序不允许改变
function _UnlineCallBack(TargetName, MoneyToPay, bForever)
	Say("<#>对不起，"..TargetName.."<#>目前不在线!",0)
	if (bForever == 0) then
		AddItem(6,1,18,1,0,0,0)
	end;
	return 0
end;
