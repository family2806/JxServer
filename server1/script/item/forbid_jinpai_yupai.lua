Include("\\script\\battles\\battlehead.lua");

tbForbidMap =
{
	--seven city
	926,
	927,
	928,
	929,
	930,
	931,
	932,
	
	336,	--����ɮ�
	341,	--Į����ԭ
	337,	--��ͷ 1
	338,	--��ͷ 2
	339,	--��ͷ 3
	319,	--���ι�
	333,	--��ɽ��
	37,	--�꾩
	44,	--�ν�ս��
}

function ForbidMap()
	nSubWorldID = SubWorldIdx2ID();
	W,X,Y = GetWorldPos();

	local nMapId = W;
	
	for i = 1, getn(tbBATTLEMAP) do --map �ν�
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
			return 1;
		end
	end	
	
	for i = 1, getn(tbForbidMap) do 
		if (nSubWorldID == tbForbidMap[i]) then
			Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ng v�t ph�m!");
			return 1
		end
	end
	
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then --map �ν�
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ng v�t ph�m!");
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then --�����
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ng v�t ph�m!");
		return 1
	end
	
	return 0
	
end