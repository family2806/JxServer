Include("\\script\\missions\\qianchonglou\\rule.lua")
Include("\\script\\missions\\qianchonglou\\challenger.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
IncludeLib("SETTING")
function signup()
	if tbPlayerHandle:CheckDate() ~= 1 then
		local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint)
		if nAwardPoint > 0 then
			return Talk(1, "", "����Ҫ����ȡ֮ǰ�Ľ������ܼ����μ�.")
		end
	end
	if ST_IsTransLife() ~= 1  and GetLevel() < 120 then
		return Talk(1, "", format("%d �����²��ܲμӸû", 120))
	end
	local pDungeonType = DungeonType["endless tower"]
	local pChallenger = tbChallenger:new()
	pChallenger:Update()
	if pChallenger:GetPlayTime() <= 0 then
		return Talk(1, "", "�������ʱ��������")
	end
	if pDungeonType then
		local pDungeon = pDungeonType:new_dungeon(pDungeonType.TEMPLATE_MAP_ID, {pChallenger})
		if pDungeon then
			pChallenger:Update()
			local nMapId, nX, nY = pDungeon:GetTowerPos()
			NewWorld(nMapId, nX, nY)
		else
			print("fail")
		end
	end
end

function give_award()
	local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint)
	if nAwardPoint <= 0 then
		return Talk(1, "","�i��Ľ���ֵ���������콱")
	end
	Msg2Player(format("���ѻ��%d ����ֵ�Ľ���.", nAwardPoint))
	tbPlayerHandle:SetAwardPoint(0)
end
--�ر�����¥����- Modified By DinhHQ - 20120402
function dialog()
do return end
	local szTitle = "�򿪸�����ÿ����ҽ����һ��Ļ����֣�ÿ�η������������Ļ����֡���ŭ����ͬ�����ĵĻ�����Ҳ����ͬ������ͨ���������Ļ������������ŭ�ȼ�����ŭ�ȼ�Խ�ߣ����й���Ļ���Խ�󡣴��й���󣬽���ý������������ַ��������Ҳ�����ý�����������ŭ��ÿ�λ���һ�������Ĺ�����ܻ�����Ӧ�ı�ŭ�����Դ�����Χ���еĵ��ˡ�"
	local tbOpt = 
	{
		{"����μ�", signup},
		{"�콱", give_award},
		{"ȡ��"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end


Include("\\script\\misc\\eventsys\\type\\npc.lua")

--pEventType:Reg("���ٻʳ�˾, "����¥", dialog, {})
