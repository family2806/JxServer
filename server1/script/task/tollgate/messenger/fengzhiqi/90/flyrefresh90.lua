-------------------------------------------------------------------------
-- FileName		:	enemy_flyrefresh90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-13 11:19:14
-- Desc			:   ��֮��ؿ���boss���ˢ���������ű�[90���ϼ�]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flyrefresh.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

FLYREFRESH_EXP = tonumber( TabFile_GetCell( "tollprize" ,4 ,"shuachu_exp"))   --boss���ˢ��С�־���
FLYREFRESH_MAPID= 389  --��֮��ĵ�ͼid
FLYREFRESH_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,4 ,"shuachu_jifen"))  --��֮���boss���ˢ��С�����������ʹ����


function OnDeath()
	local name = GetName()
	local Uworld1215 = nt_getTask(1215)  --boss���ˢ�ֵĴ�ֿ���
	if (  messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("�Բ���! "..name.."!�����ʹ����ʱ�������꣬����ʧ��!.")
		losemessengertask()
	--elseif ( Uworld1215 == 0 ) then  --û��ˢ�ֵ�����
	--	Msg2Player("����һ��Ѿ������˰��ˣ�������ǲ������κν����á�")
	--	return
	else
		messenger_killrefresh()
	end
end