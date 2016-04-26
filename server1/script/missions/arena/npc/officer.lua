Include("\\script\\missions\\arena\\player.lua")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\maps\\checkmap.lua")
IncludeLib("TITLE")

local tbTitle2Id = 
{
	["�������"] = 237,
	["��������"] = 238,
	["һ����ʦ"] = 239,
	["��������"] = 240,
	["��������"] = 241,
	["����Զ��"] = 242,
	["��������"] = 243,
	["���뽭��"] = 244,
	["���ŵ���"] = 245,
}

function want_get_title()
	local szTitle = "����ÿ�ܲμӹ�20������ս�Ϳ��Եõ�����ս����"	
	local tbOpt = 
	{
		{"����������", get_title, {}},

		{"��ֻ�ǿ���"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function get_title()
	if tbPlayer:GetTitleFlag() ~= 0 then
		return Talk(1, "", "һ��ֻ��һ��")
	end
	
	if tbPlayer:GetCurCount() < tbPlayer.PER_WEEK_COUNT then
		return Talk(1, "", format("Ҫ�μӹ� %d���ſ�����ȡ", tbPlayer.PER_WEEK_COUNT))
	end
	
	local szTitle = tbPlayer:GetTitle()
	local nTitleId = %tbTitle2Id[szTitle]
	if not nTitleId then
		return
	end
	
	tbPlayer:SetTitleFlag()
	local nTime = GetCurServerTime() + 60*60*24*7
	nTime = tonumber(FormatTime2String("%m%d%H%M", nTime))
	SetTask(TASK_ACTIVE_TITLE, nTitleId);
	Title_AddTitle(nTitleId, 2, nTime)
	Title_ActiveTitle(nTitleId)
end

function show_introduction()
	local szTitle = "��λ�ã��������Ѿ��ڽ����й㷺������<enter>�������������Ҽ�����λ����ҳ�����Ͻǵľ��������򿪱�������; <enter> ��������������: ÿ�·�ͷ20��������ȡ��������, ������20��Ҳ������ȡ������������; <enter>ս�ӵȼ�: ��������ս���еĸ��˱��ֻ���߻򽵵����ս�ӵȼ�; <enter> ���������̵꣺ʹ���������¹��������ص���"
	local tbOpt = 
	{
		{"����!", },
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function open_credits_shop()
	local nMapId = GetWorldPos()
	if (IsFreshmanMap(nMapId) == 1 or IsCityMap(nMapId) == 1) and GetFightState() == 0 then
		Sale(175, 16)
	else
		Msg2Player("ֻ���ڳ��к�ũ��Ȱ�ȫ�����̵�.")
	end
end


function main()
	--�رվ��������� - Modified By NgaVN - 20120305
	do	
		Talk(1,"","�����ݱ�!")
		return
	end	
	local szTitle = "������,�����Ǿ�������Ա."	
	local tbOpt = 
	{
		{"��ȡ���ܾ�����ս������", want_get_title, {}},
		{"�������������̵�", open_credits_shop, {}},
		{"���ܾ���������", show_introduction, {}},
		{"ȡ��"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end