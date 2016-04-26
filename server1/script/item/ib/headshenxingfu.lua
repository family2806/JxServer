tbVNGWORDPOS= tbVNGWORDPOS or {}
tbVNGWORDPOS.tbOtherMap = {
		{523,1579,3121	,"明月镇襄阳",},
		{521,1579,3121	,"明月镇成都",},
		{520,1579,3121	,"明月镇凤翔",},
		{525,1579,3121	,"明月镇大理",},
		{524,1579,3121	,"明月镇扬州",},
		{522,1579,3121	,"明月镇汴京",},
		{526,1579,3121	,"明月镇临安",},
		{55,1602,3125		,"桃花源",},
	};

function tbVNGWORDPOS:GotoOtherMap()
	local tab_Content = {};
	local nCount = getn(self.tbOtherMap);
	for i = 1, nCount do
		tinsert(tab_Content, self.tbOtherMap[i][4].."/#tbVNGWORDPOS:GotoStepPos( "..i..")");
	end
	tinsert(tab_Content, "离开/no");
	Say("神行符，到你想去的地方.", getn(tab_Content), tab_Content);
end

function tbVNGWORDPOS:GotoStepPos(nIdx)
	local tbOtherMap = self.tbOtherMap[nIdx];
	NewWorld(tbOtherMap[1], tbOtherMap[2], tbOtherMap[3]);
	SetFightState(0);
	Msg2Player("请坐好，我们去"..tbOtherMap[4].."吧");
end

