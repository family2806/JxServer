IncludeLib("TONG")
Include("\\script\\tong\\tong_header.lua")

function main()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		Msg2Player("�������ȥ�����ǵ�����(��δ�����޷��μӷ��Ӣ����)");
	else
		if (TONG_GetTaskValue(nTongID, TONGTSK_HEROLING) < 120) then
			Msg2Player("���ķ��Ӣ����δ���۹�120�������ܼ�鵾����.");
		else
			Msg2Player("����굾����, ��Ҫ5����");
		end;
	end;
end;