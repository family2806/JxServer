--========�ļ�����==================================--
--�ļ�����/script/event/playerlvlup/event.lua
--���ߣ�yfeng
--�������ڣ�2005-3-31
--����޸����ڣ�
--����������
--	ȫ��ȫ������弶�ж�
--
--��Ϸ�ű���������Ե�����
--��ɽ����ɷ����޹�˾��copyright 1992-2005
--==================================================--
if not EVENTHEAD_LUA then
	Include ("\\script\\event\\eventhead.lua")
end	

TKID_PLAYERLEVELUP = 1081	--���������ţ���¼�弶��ĸ���״̬
TKVAL_PLAYERLEVELUP_OPEN = 1 --�μӳ弶�

SKILLS = {
	{	{318,1},{319,1},{321,1}}, --����
	{	{322,1},{323,1},{325,1}}, --����
	{	{339,1},{302,1},{342,1},{351,0}}, --����
	{	{353,1},{355,1},{390,0}}, --�嶾
	{	{328,1},{380,1},{332,0}}, --����
	{	{336,1},{337,1}}, --����
	{	{357,1},{359,1}}, --ؤ��
	{	{361,1},{362,1},{391,0}}, --����
	{	{365,1},{368,1}}, --�䵱
	{	{372,1},{375,1},{394,0}}, --����
}

--========�ඨ��====================================--
--������EPlayerLevelUp
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	ȫ��ȫ���������弶��ľ��幦��
--��Ա������
--��Ա������
--.GiveTask()
--.PlayerLevelUp()
--==================================================--
EPlayerLevelUp = {
--========��������==================================--
--����ԭ�Σ�.GiveTask()
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	����ҷ�����弶����
--==================================================--
	GiveTask = function()
		if not validateDate(DATESPLAYERLEVELUP,DATEEPLAYERLEVELUP) then
			Talk(1,"","������˼���ʱ���ѽ���!")
			return
		end
		local flag = GetTask(TKID_PLAYERLEVELUP)
		if (flag == TKVAL_PLAYERLEVELUP_OPEN) then
			Talk(1,"","�ǲ����Ѿ������μ�'�����'����?��ô�����ˣ�")
			return
		end
		local level = GetLevel()
		if(	level > 49 and level < 71 ) then
			SetTask(TKID_PLAYERLEVELUP,TKVAL_PLAYERLEVELUP_OPEN)
			Talk(1,"","���Ѿ������μ�'�����'��.��������80��!")
			Msg2Player("���ѽ����������񣬸Ͽ�ȥ����!")
			return
		end
		Talk(1,"","������˼����ĵȼ������ϲμӡ����������Ҫ��!")
		return
	end,
--========��������==================================--
--����ԭ�Σ�EPlayerLevelUp.OnLevelUp()
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	�μӻ����ң�ÿ��һ�����õ�2Сʱ���鷭��
--==================================================--
	OnLevelUp = function ()
		if not validateDate(DATESPLAYERLEVELUP,DATEEPLAYERLEVELUP) then
			return
		end
		local level = GetLevel()
		local flag = GetTask(TKID_PLAYERLEVELUP)
		if(flag == TKVAL_PLAYERLEVELUP_OPEN) then
			if(level < 80 and level > 49 ) then
				EPlayerLevelUp.payDoubleExp()
				return	
			elseif(level == 80) then
				EPlayerLevelUp.payAdvSkills()
			end
		end
	end,
	
	payDoubleExp = function()
		AddSkillState(531,10,1,2*60*60*18)
		AddSkillState(461,1, 1,2*60*60*18)
		Msg2Player("��ϲ���ڡ���������������ˣ�ϵͳ�͸�����2Сʱ��˫������.")
	end,
	
	payAdvSkills = function()
		local faction = GetLastFactionNumber()
		if(faction ~= -1) then
			for i=1,getn(SKILLS[faction+1]) do
				AddMagic(SKILLS[faction+1][i][1],SKILLS[faction+1][i][2])
			end
			Msg2Player("��ϲ���ڴ˴Ρ���������гɹ��������ͬʱѧ��90������")
			AddGlobalNews("���һͬף��"..GetName().."�ڡ���������гɹ��������ͬʱѧ��90������")
			return
		end
		Msg2Player("��ϲ���ڡ���������гɹ��������")
	end,
}

--========��������==================================--
--����ԭ�Σ�PlayerLevelUp
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	��ٿ�����ĶԻ�
--������
--����ֵ��
--������
--==================================================--
function BTNPlayerLevelUp()
	local msg = "��ӭ�μӡ��������. 50��70����Ҷ����Ա����μӣ�ֻ���ڻ�ڼ�����80���Ϳ�������ѧϰ90������"
	local btns = {
		"���뱨���μ�/JoinPlayerLevelUp",
		"�����˽����һ��/AboutPlayerLevelUp"
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end

--========��������==================================--
--����ԭ�Σ�JoinPlayerLevelUp
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	�����μӻ
--==================================================--
function JoinPlayerLevelUp()
	EPlayerLevelUp.GiveTask()
end

--========��������==================================--
--����ԭ�Σ�AboutPlayerLevelUp()
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	���ڳ����Ľ���
--==================================================--
function AboutPlayerLevelUp()
	local msg = ": 50��70��(����50����70��) ���Ե���ٴ������μӡ������������ٻ�ָ����80�������Ŀ�ꡣ�ڱ����μӵȼ��Ժ����ÿ���������Ϳ��Եõ�2Сʱ˫������ֵ(����ʧȥ˫��Ч��)������80�����ﵽ����Ŀ��֮���㽫ѧϰ90�����ܣ��۳�����)."
	local btns ={
		"�μӻ/BTNPlayerLevelUp",
		"�˳�/Quit",
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end

