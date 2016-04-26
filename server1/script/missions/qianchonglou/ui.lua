if MODEL_GAMECLIENT ~= 1 then
	return
end

Include("\\script\\missions\\qianchonglou\\common.lua")
Include("\\script\\script_protocol\\protocol_def_c.lua")


function process_protocol(nOption, nEndTime)
	if tbPlayerHandle.OPERATION_OPEN_UI == nOption then
		ShowFisherUi(nEndTime)
	elseif tbPlayerHandle.OPERATION_CLOSE_UI == nOption then
		ShowFisherUi(0)
	elseif tbPlayerHandle.OPERATION_EXTRA_GUN == nOption then
		SetExtraGun()
	end
end

function get_left_time(nEndTime)
	
	local nCurTime = GetCurServerTime()
	local nLeftTime = nEndTime - nCurTime
	if nLeftTime < 0 then
		return
	end
	local nHourMinute = floor(nLeftTime / 60)
	local nSec = mod(nLeftTime, 60)
	local nHour = floor(nHourMinute/60)
	local nMinute = mod(nHourMinute, 60)
	return format("%d:%02d:%02d", nHour, nMinute, nSec)
end

function use_gun(nGunRank, nX, nY)
	
	local nPoint = tbPlayerHandle:GetBasePoint() + tbPlayerHandle:GetAwardPoint()
	
	if nPoint < nGunRank then
		return Msg2Player("")
	end
	
	local handle = OB_Create()
	nX, nY = ViewPortCoordToSpaceCoord(nX, nY, 0)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, tbPlayerHandle.OPERATION_USE_GUN)
	ObjBuffer:PushByType(handle, OBJTYPE_TABLE, {nGunRank, nX, nY})
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_QIANCHONGLOU", handle)
	OB_Release(handle)
	SetPlayerDoAction(6, 120)	
end


function on_quit()
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, tbPlayerHandle.OPERATION_QUIT)
	ObjBuffer:PushByType(handle, OBJTYPE_TABLE, {})
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_QIANCHONGLOU", handle)
	OB_Release(handle)
end

function OpenQianChongLouUI(nEndTime)
	ShowFisherUi(nEndTime)
end