-- ��������.lua (ʥ���)
Include([[\script\missions\chrismas\ch_head.lua]]);
Include([[\script\missions\chrismas\xmas_day.lua]]);

tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
500000
};

tabRate = {
	{0, 0.69, 0.27, 0.04},
	{0, 0.83, 0.14, 0.03},
	{0, 0.86, 0.13, 0.01},
	{0, 0.85, 0.15, 0},
	{0, 0.9, 0.1, 0},
	{0, 0.95, 0.05, 0},
	{0.27, 0.68, 0.05, 0},
	{0.37, 0.59, 0.04, 0},
	{0.61, 0.36, 0.03, 0},
	{0.72, 0.26, 0.02, 0}
};

function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20061222) then
		Describe(DescLink_LiGuan.."ʥ���ڿ���!", 1, "�����Ի�/oncancel");
	else
		Describe(DescLink_LiGuan.."������ʥ���ڿ��֣���֪������ʥ������ʲô���?", 5, 
			"��˵ʥ�����˵�������/want_xmasevent",
			"������ѩ��./want_snowman",
			"������ѩ�˻���Ʒ./want_gift",
			"�����˽�����/xmas_about",
			"�����ں�æ���Ժ����./oncancel");
	end;
end;

function want_xmasevent()
	if (isXmasTime() ~= 1) then
		Describe(DescLink_LiGuan.."лл�㣬���Ѿ��ҵ��������.",1, "�����Ի�/oncancel");
		return 0;
	end;
	Describe(DescLink_LiGuan.."�Ҹոյ���һ��������������кܶ�ʥ���������԰����һ�����?", 4,
	"��Ȼ������./onok",
	"���Ѿ��ҵ�������./award",
	"����ʥ���./detail",
	"�����Һ�æ���п�����Ŷ./oncancel")
end;


function onok()
	if (50 > GetLevel()) then
		strTalk = DescLink_LiGuan.."�������û�дﵽ50���������ܲμ�ʥ�����";
		Describe(strTalk, 1, "�����Ի�/oncancel");
		return
	end;
	Describe(DescLink_LiGuan.."Ŷ��������лл�ˣ����ȵ��Ǳ�׼��׼������һ��ʹ��㵽�����߶��ĵط���", 2, "�õġ�/wantjoin", "��ͻȻ��Щ���£��ȵȵȰɡ�/oncancel");
end;

function award()
	local nCount = GetTask(TK_COUNT_ONETIME);
	local nRank = GetTask(TK_RANK);
	SetTask(TK_COUNT_ONETIME, 0);
	SetTask(TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Describe(DescLink_LiGuan.."�����û���ҵ��κε�ʥ������ɡ�", 1, "�����Ի�/oncancel");
		return
	end;
	local strSay = format("������ҵ������ˣ�ʵ��̫���ˣ��ҿ�������һ���ҵ���%d��<color=yellow>ʥ������<color>�����ҵ������%d����ˣ����������Ǹ����������°ɣ��ǺǺ�~", nCount, nRank);
	Describe(DescLink_LiGuan..strSay, 1, "�������/oncancel");
	giveaward(nRank);
end;

function detail()
	Describe(DescLink_LiGuan.."�Ҿ���һ��Ϊ<color=yellow>15<color>���ӣ�������<color=yellow>5<color>����׼��ʱ�䣬�ڱ����μӺ���ᱻ����׼����ͼ�����ʼ����ᱻ����ʥ�������߶��ĵط�����������������<color=yellow>ʥ������<color>�Ļ�ֻҪ�����<color=yellow>������<color>���Ϳ����ˣ���Ȼ�������ܵ�������ҵ����ӣ���ʱ��������û������Ӧ����Щ�����ֻҪ���ҵ��㹻���<color=yellow>ʥ������<color>��ôʥ�����˻���㲻�������Ŷ��", 1, "�����ô���棿�ҿ�����/oncancel");
end;

function giveaward(nRank)
	expaward(nRank);
	goodsaward(nRank);
end;

function expaward(nRank)
	AddOwnExp(tabExp[nRank]);
end;

function goodsaward(nRank)
	local nGoodsType = getgoodtype(nRank);
	if (nGoodsType == 1) then
		AddItem(6, 1, 1008, 1, 0, 0, 0);
		local strsay = "������һ���ƽ�����"
		Msg2Player(strsay);
	elseif (nGoodsType == 2) then
		AddItem(6, 1, 1007, 1, 0, 0, 0);
		local strsay = "������һ��ˮ������"
		Msg2Player(strsay);
	elseif (nGoodsType == 3) then
		AddItem(6, 1, 1006, 1, 0, 0, 0);
		local strsay = "������һ��õ������"
		Msg2Player(strsay);
	elseif (nGoodsType == 4) then
		AddItem(6, 1, 1005, 1, 0, 0, 0);
		local strsay = "������һ����������"
		Msg2Player(strsay);
	end;
end;

function getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 4 do
		nRate[i] = tabRate[nRank][i] * 100;
	end;
	local nBase = 0;
	for i = 1, 4 do
		nBase = nBase + nRate[i];
		if (nBase >= nSeed) then
			return (5 - i);
		end;
	end;
end;

function onsale()

end;

function wantjoin()
	local w, x, y;
	w, x, y = GetWorldPos();
	SetTask(TK_LEAVERMAPID, w);	--�洢����뿪������
	SetTask(TK_LEAVERPOSX, x);
	SetTask(TK_LEAVERPOSY, y);
	joingame() --���뵽��Ϸ��
end;

function xmas_about()
	Describe(DescLink_LiGuan.."�ڻʱ���ڣ������Ҫ������ռ���У��������<color=yellow>ѩ�������ӣ���֦��ñ�ӣ�������Χ��<color>, ����������<color=yellow>�ر�ѩ�˵�ԭ��<color>. �˹�����ʧ�ܣ������� <color=yellow>һ���ѩ��<color>. Ȼ�󣬿�����ѩ������ȡ��Ʒ.", 1, "��֪����/main");
end;

function oncancel()	--ȡ��

end;
