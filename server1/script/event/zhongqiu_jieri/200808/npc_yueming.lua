Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\hecheng.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\longzhu\\hecheng.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	zhongqiu0808_npc_main()
end
function zhongqiu0808_npc_main()
	if zhongqiu0808_IsActDate() ~= 1 then
		return Say("��ѽ���.", 0)
	end
	local tbSay = 
	{
		"<dec><npc>������05-09-2008 �� 05-10-2008 24:00ʱ���� ,����6�������˽��ĸ��?",
		"����������/zhongqiu0808_hecheng_dialog",
		"����-����/zhongqiu0808_longzhuhecheng_dialog",
		"��ʵ����/#zhongqiu0808_ActContent(1)",
		"�������˻/#zhongqiu0808_ActContent(4)",
		"ս��ѫ�»/#zhongqiu0808_ActContent(3)",
		"ί���ռ��/#zhongqiu0808_ActContent(2)",
		"����ֻ��˳��·��!/OnCancel",
	}
	CreateTaskSay(tbSay);
end



function zhongqiu0808_ActContent(nStep)
	local tbSay = nil
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc>��ʵ������05-09-2008 ��05-10-2008 24�����. ����ʱ��Ϊ��ÿ�ܴ���һ������19:00 - 19:59, 21:30 - 22:29; ���塢����������Ϊ��11:00 - 11:59, 19:00 - 19:59, 21:30 - 22:29. ���ʼ����ʵ������������ð�ͼ���֣���ҿ����ú�����(������NPCС��������) �������(��Ҫ���ݶ����ϱ��Ĵ�������)���ܻ�ý���.",
			"�����Ի�/OnCancel"
		}
		
	elseif nStep == 2 then
		tbSay = 
		{
			"<dec><npc>��05-09-2008 ��05-10-2008 24ʱ, ����԰׾�������ί�н���������",
			"�����Ի�/OnCancel"
		}
	elseif nStep == 3 then
		tbSay = 
		{
			"<dec><npc>�ڻʱ���05-09-2008 ��05-10-2008 24ʱ, ������𷽴󽫳ƺŻ����η��󽫳ƺŵ�ս����ͷ20�˽����ս��ѫ�¡����⣬��ҿ��Ե��η����߽�NPC���������ʹ��2000���ֻ�ȡһ����״���ơ�ʹ��ս��ѫ�º͹�״���ƽ���þ���ֵ���м�ֵ����Ʒ��",
			"�����Ի�/OnCancel"
		}
		
	elseif nStep == 4 then
		tbSay = 
		{
			"<dec><npc>�ڻʱ���ڣ�(05-09-2008 ��05-10-2008 24ʱ), ��ÿ�����塢���������ս����б������˻.",
			"�����Ի�/OnCancel"
		}
	end
	CreateTaskSay(tbSay);
end


function OnCancel()
	
end
