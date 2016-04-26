-------------------------------------------------------------------------
-- FileName		:	NewWorldScript_H.lua
-- Author		:	LuoBaohang
-- CreateTime	:	2005-09-02
-- Desc			:  	地图切换触发脚本头文件--函数定义
-------------------------------------------------------------------------
IncludeLib("PARTNER")
IncludeLib("TIMER")
Include("\\script\\tong\\map\\entrance_trap.lua")
Include("\\script\\nationalwar\\nationalwar.lua")
Include("\\script\\missions\\newpracticemap\\head.lua")

aryFuncStore = {} --函数定义，每个函数规定有且只有一个开关参数(进入为1，退出为0)


function SetPartnerSwitch(bIn)
do return end
	if (bIn == 1) then
		PARTNER_CallOutCurPartner(0)
		PARTNER_SetCallOutSwitch(0)
		Msg2Player("同伴召唤开关关闭！")
	else
		PARTNER_SetCallOutSwitch(1)	
		Msg2Player("同伴召唤开关打开！")
	end
end

function CD_ForbidEnemy(bIn)
	if (bIn == 1) then
		SetPKFlag(0)
		ForbidChangePK(1);
		ForbidEnmity(1);
		SetTaskTemp(200,1);
	else
		ForbidChangePK(0);
		SetTaskTemp(200,0);
		ForbidEnmity(0);
	end
end

function forbidCreateTeam(bIn)
	if (bIn == 1) then
		LeaveTeam()
		SetCreateTeam(0)
		--Msg2Player("组队关闭！")
	else
		SetCreateTeam(1)
		--Msg2Player("组队开启！")
	end
end

function UseTownPSwitch(bIn)
	if (bIn == 1) then
		DisabledUseTownP(1)	--禁止使用回城
	else
		DisabledUseTownP(0)	--允许使用回城
	end
end

function setLogoutRevOut(bIn)
	if (bIn == 1) then
		SetLogoutRV(1)
	else
		DisabledUseTownP(0)
	end
end

function setTiShenZhiFu( bIn )
	if (bIn == 1) then
		SetDeathReliveFlag(0)
	else
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		if (nDate <= 20070518) then
			SetDeathReliveFlag(1);
		end;
	end
end;

function noPunish(bIn)
	if (bIn == 1) then
		SetPunish(0)
	else
		SetPunish(1)
	end
end

function forbidUseTownP(bIn)
	if (bIn == 1) then
		DisabledUseTownP(1)
	else
		DisabledUseTownP(0)
	end
end

function setPeaceState(bIn)
	if (bIn == 1) then
		SetFightState(0)
	else
		SetFightState(0)
	end
end

function sjFightState(bIn)
	if (bIn == 1) then
		SetFightState(0)
	end
end


function forbidHeart(bIn)
	if (bIn == 1) then
		DisabledUseHeart(1)
	else
		DisabledUseHeart(0)
	end
end

function restoreCurCamp(bIn)
	if (bIn == 1) then
	else
		SetCurCamp(GetCamp())
	end
end

function forbidStall(bIn)
	if(bIn == 1) then
		DisabledStall(1)
	else
		DisabledStall(0)
	end
end

function TongMap(bIn)
	noPunish(bIn)
	forbidUseTownP(bIn)
	forbidHeart(bIn)
	restoreCurCamp(bIn)
	forbidStall(bIn)
	if (bIn == 1) then
		-- 设临时重生点为祭酒处
		SetTempRevPos(SubWorldIdx2ID(SubWorld),aRevPos.x * 32,aRevPos.y * 32)
		if (GetProductRegion() ~= "vn") then
			-- 作地图有效期及地图禁制等判断操作
			tongmap_entrance();
		end;
	else
		SetRevPos(GetPlayerRev())
	end
	--地图禁制扔出
	if (bIn == 1 and GetMapType(SubWorld) == 1)then
		local nTongID = GetMapParam(SubWorld, 0)
		if (nTongID ~= 0)then
			local _,b = GetTongName()
			if (b ~= nTongID and TONG_GetTongMapBan(nTongID) == 1)then
				local pos = GetMapEnterPos(SubWorldIdx2MapCopy(SubWorld))
				SetFightState(0)
				SetPos(pos.x, pos.y)
			end
		end
	end
end

--	直接进入牢房
function PK10_InPrison(bIn)
	if (bIn == 1) then
		if (GetPK() == 10) then
			SetDeathPunish_PK10(1)
			Msg2Player("<color=green>你的PK值是10已经罪大恶极，直接关进大牢.<color>");
		else
			SetDeathPunish_PK10(0)
		end;
	else
		SetDeathPunish_PK10(0);
	end;
end;

-- A型新练级地图
function NewPractice_A(bIn)
	
	if (bIn == 1) then
		SetFightState(1);
		SetTask(tbNewPracticeMap.TimeLeft_A, GetTask(tbNewPracticeMap.TimeLeft_A)-1);
		TM_SetTimer(tbNewPracticeMap.interval, tbNewPracticeMap.timerId, 1, 0);	
	else
		SetFightState(0);
	end
end


-- B型新练级地图
function NewPractice_B(bIn)

	if (bIn == 1) then
		SetFightState(1);
		SetTask(tbNewPracticeMap.TimeLeft_B, GetTask(tbNewPracticeMap.TimeLeft_B)-1);
		TM_SetTimer(tbNewPracticeMap.interval, tbNewPracticeMap.timerId, 1, 0);
	else
		SetFightState(0);
	end
end

-- 进入/离开可以修炼精炼石的地图
--function JingliEntrance(bIn)
--	DynamicExecute("\\script\\global\\jingli.lua", "WorldEntrance", PlayerIndex, bIn)
--end

aryFuncStore["PARTNER_OFF"] = SetPartnerSwitch
aryFuncStore["CD_Forbid_OFF"] = CD_ForbidEnemy
aryFuncStore["CreateTeam_OFF"] = forbidCreateTeam
-- aryFuncStore["USETOWNP_OFF"] = UseTownPSwitch	-- 功能同 forbidUseTownP
aryFuncStore["LOGINREVOUT_OFF"] = setLogoutRevOut
aryFuncStore["PUNISH_OFF"] = noPunish
aryFuncStore["TISHENZHIREN"] = setTiShenZhiFu
aryFuncStore["USETOWNP_OFF"] = forbidUseTownP
aryFuncStore["FIGHTSTATE_OFF"] = setPeaceState

aryFuncStore["SJFIGHTSTATE_OFF"] = sjFightState
aryFuncStore["HEART_OFF"] = forbidHeart
aryFuncStore["TONG_MAP"] = TongMap
aryFuncStore["RESTORECURCAMP"] = restoreCurCamp
aryFuncStore["STALL_OFF"] = forbidStall
aryFuncStore["PUNISH_PK10"] = PK10_InPrison
aryFuncStore["NATIONALWAR"] = nationalwar_mapevent
aryFuncStore["NEWPRACTICE_A"] = NewPractice_A
aryFuncStore["NEWPRACTICE_B"] = NewPractice_B
--aryFuncStore["JINGLI"] = JingliEntrance
