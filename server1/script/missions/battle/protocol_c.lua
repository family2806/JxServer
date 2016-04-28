Include("\\script\\script_protocol\\protocol_def_c.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\missions\\battle\\protocol.lua")
Include("\\script\\lib\\common.lua")

STATE2STR = 
{
	[1] = " Ghi Danh Trung ",
	[2] = " Chu�n B� Trung ",
	[3] = " Ti�n H�nh Trung ",
	[4] = " K�t Th�c Trung ",
}

function show_battle_select(tbInfo)
	OpenBattleSelect()
	local nCurRow = tbInfo.nCurPage
	local nMaxRow = tbInfo.nMaxPage
	SetBattleSelectPage(nCurRow, nMaxRow)	
	for i=1, 4 do
		local pInfo = tbInfo[i]
		if pInfo then
			local szId = strfill_center(format("Th� %d tr�ng t�ng kim ", pInfo.nId), 12)
			local szState = strfill_center(STATE2STR[pInfo.nState], 12)
			local szCount1 = strfill_center(format("T�ng %d ng��i ", pInfo.nCount1), 12)
			local szWaiting1 = strfill_center(format("Ch� ��i %d ng��i ", pInfo.nWaiting1), 12)
			local szCount2 = strfill_center(format("Kim %d ng��i ", pInfo.nCount2), 12)
			local szWaiting2 = strfill_center(format("Ch� ��i %d ng��i ", pInfo.nWaiting2), 12)
			
			local szInfo = format(" %s%s<enter> %s%s<enter> %s%s", 
				szId, szState,
				szCount1, szWaiting1,
				szCount2, szWaiting2)
			SetBattleSelectInfo(i - 1, szInfo, pInfo.nId)	
		else
			SetBattleSelectInfo(i - 1, "")	
		end
	end
	
end

function prev_page(nCurRow, nMaxRow)
	local nRow = nCurRow - 4
	if nRow < 0 then
		nRow = 1
	end
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, OPERATION_CHANGE_PAGE)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, nRow)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BATTLE", nHandle)
	OB_Release(nHandle)
end

function next_page(nCurRow, nMaxRow)
	
	local nRow = nCurRow + 4
	if nRow > nMaxRow then
		nRow = nMaxRow
	end
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, OPERATION_CHANGE_PAGE)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, nRow)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BATTLE", nHandle)
	OB_Release(nHandle)
end

function on_select(nId)
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, OPERATION_ON_SELECT)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, nId)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BATTLE", nHandle)
	OB_Release(nHandle)
end


function mouse_wheel(nRow)
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, OPERATION_CHANGE_PAGE)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, nRow)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BATTLE", nHandle)
	OB_Release(nHandle)
end