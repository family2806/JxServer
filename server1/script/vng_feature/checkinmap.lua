Include("\\script\\activitysys\\playerfunlib.lua")
function PlayerFunLib:VnCheckInCity (strFail)
	local strMessage
	if not strFail or strFail == "default" then
		strMessage = "�ò���Ŀǰ����ִ�У���س��л��ߴ��������."
	else
	 strMessage = strFail
	end
	if GetFightState() ~= 0 then
		lib:ShowMessage(strMessage)
		return nil
	end
	return self:CheckInMap("53,20,99,100,101,121,153,174,11,78,1,162,37,80,176", strMessage)
end