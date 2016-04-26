
-- ====================== �ļ���Ϣ ======================

-- ������Եonline Ұ���ٻ����� ������ Ů����
-- Edited by peres
-- 2006/12/26 PM 15:39

-- ��ʦ��Ϊ�Ҵ����·�ʱͻȻЦ��˵�������ó����Խ��Խˮ���ˡ�
-- ��������Ů��������Ժ���и����ĸ������ء�
-- Ů�ӳ����Ժ�һ���Ὣ�����и����������ҵ���΢΢�Ǻ���һ�¡�
-- ��ʦ�����������Ұ�ȹ�����ã���˵���ǵġ�
-- ��Ϊ������Ů��һ����������

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

Include("\\script\\global\\forbidmap.lua");

function main()

	local subworld, x, y = GetWorldPos();
	local mapindex = SubWorldID2Idx(subworld);
	local mapname = SubWorldName(mapindex);	
		
	-- ��ս��״̬����ʹ��
	if GetFightState()==0 then
		Say("ֻ���ڳ��������ִ��ս���������������ͼ����ʹ�ô���Ʒ��", 0);
		return 1;
	end;
	
	if CheckAllMaps(subworld)==1 then
		Say("ֻ���ڳ��������ִ��ս���������������ͼ����ʹ�ô���Ʒ��", 0);
		return 1;
	end;
	
	-- Ұ�ŵ����ͣ�1Ϊ��ͨ�ģ�2Ϊ��ǿ��
	local nBossType = random(1,2);	
	
	-- Ұ�ŵ�ͷ��
	local aryBossTitle = {
		[1] = {"���е�",
			   "�Ĳ����ɵ�",
			   "ӹ����",},
			   
		[2] = {"��ŭ��",
			   "�׺ݵ�",
			   "���ݵ�",},	
	}
	
	local nBossIndex  = {
			[1]=1237,
			[2]=1238,
		}

	local nNpcIndex	 = AddNpcEx(nBossIndex[nBossType],
					95,
					random(0,4),
					mapindex,
					x*32, -- ���� X ƫ��
					y*32, -- ���� Y ƫ��
					1,
					"��"..aryBossTitle[nBossType][random(1,getn(aryBossTitle[nBossType]))].."��Ұ��",
					1);
		
		SetNpcScript(nNpcIndex, "\\script\\global\\seasonnpc_death.lua");
		
		Msg2SubWorld("���棺��� <color=yellow>"..GetName().."<color> ����<color=green>"..mapname.."<color>��Ұ���д����գ�");
		
		return 0;
end;

