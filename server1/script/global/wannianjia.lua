Include("\\script\\event\\pingzi\\200805\\pingzi.lua");	-- ƴ����Ϸ
Include("\\script\\event\\young_hero\\hero.lua");		-- ����Ӣ��
Include("\\script\\task\\system\\task_string.lua");
function main()
	wannianjia_main();
end


function wannianjia_main()
	local nDateH = tonumber(GetLocalDate("%Y%m%d%H"));
	local tbSay = 
	{
		"<dec><npc>���ִ����ѵ��˵����꣬ף��̩�񰲣��Ҽ��Ҹ��������±��������Ƿ���Ҫʲô�أ�",
	}
	if pingzi0805:IsActTime() then
		tinsert(tbSay, "������кϳ���/#pingzi0805:main()");
	end
	if (nDateH >= hero_nDate_S and nDateH <= hero_nDate_E) then
		tinsert(tbSay, "����μ�����Ӣ�ۻ/#here_main()");
	end
	tinsert(tbSay, "�˽⻻ȡ��������/wannianjia_Detailed");
	tinsert(tbSay, "���Ժ�����/OnCancel");
	CreateTaskSay(tbSay);
end
--�˽�һ�����
function wannianjia_Detailed(nStep)
	local tbSay = 
	{
		"<dec><npc>�����������������˽��ĸ����",
		"�˽�ϳ��ֻ#pingzi0805:Detailed()",
		"�˽�����Ӣ�ۻ/#hero_intruduction()",
		"����/wannianjia_main"
	}
	
	CreateTaskSay(tbSay);
end


function OnCancel()
	
end