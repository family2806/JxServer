tbVNGWORDPOS= tbVNGWORDPOS or {}
tbVNGWORDPOS.tbOtherMap = {
		{523,1579,3121	,"����������",},
		{521,1579,3121	,"������ɶ�",},
		{520,1579,3121	,"���������",},
		{525,1579,3121	,"���������",},
		{524,1579,3121	,"����������",},
		{522,1579,3121	,"�������꾩",},
		{526,1579,3121	,"�������ٰ�",},
		{55,1602,3125		,"�һ�Դ",},
	};

function tbVNGWORDPOS:GotoOtherMap()
	local tab_Content = {};
	local nCount = getn(self.tbOtherMap);
	for i = 1, nCount do
		tinsert(tab_Content, self.tbOtherMap[i][4].."/#tbVNGWORDPOS:GotoStepPos( "..i..")");
	end
	tinsert(tab_Content, "�뿪/no");
	Say("���з���������ȥ�ĵط�.", getn(tab_Content), tab_Content);
end

function tbVNGWORDPOS:GotoStepPos(nIdx)
	local tbOtherMap = self.tbOtherMap[nIdx];
	NewWorld(tbOtherMap[1], tbOtherMap[2], tbOtherMap[3]);
	SetFightState(0);
	Msg2Player("�����ã�����ȥ"..tbOtherMap[4].."��");
end

