Include("\\script\\tagnewplayer\\func_check.lua");
function GetLevel165()
	if (CheckObject() ~= 3) then
		Talk(1, "", "����μ�����.");
		return
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel165) ~= 1) then
			Talk(1, "", "�ý���ֻ��һ�� !");
			return
	end
	SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel165, 1)
	LevelUp(165)
	Msg2Player("�����ոմﵽ165��")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."��ȡ165������")
end


function GetLevel120()
	if (CheckObject() ~= 1) then
		Talk(1, "", "����μ�����.");
		return
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel120) ~= 1) then
			Talk(1, "", "�ý���ֻ��һ�� !");
			return
	end
	SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel120, 1)
	LevelUp(120)
	Msg2Player("�����ոմﵽ120��")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."��ȡ����һ�κ���Ϊ120���Ľ���")
end
