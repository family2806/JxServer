-------------------------------------------------------------------------
-- FileName		:	enemy_flypoint90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-13 11:19:14
-- Desc			:   ��֮��ؿ��Ķ���������ű�[90���ϼ�]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flypoint.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

FLYPOINT_EXP = tonumber( TabFile_GetCell( "tollprize" ,4 ,"dingdian_exp"))  --����С�־���
FLYPOINT_MAPID= 389  --��֮��ĵ�ͼid
FLYPOINT_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,4 ,"dingdian_jifen"))  --��֮��Ķ���С�����������ʹ����

------��ʹ�����֮�ﶨ��ɱ�ֱ��--------------
--С��ͼ����x��y���������֣�60-79����,
killfly ={
{193,194,"����а��",1},
{181,183,"���",2},
{197,179,"���",3},
{197,172,"���",4},
{198,163,"������",5},
{190,160,"������",6},
{164,162,"�����ƾ�",7},
{164,172,"������",8},
{178,190,"����",9},
{178,187,"���ɿ�",10},
{169,190,"���շ���",11},
{172,193,"������",12},
{165,191,"����",13},
{178,2851,"���ɲ�",14},
{186,183,"���",15},
}


function OnDeath(nNpcIndex)
	local name = GetName()
	local Uworld1214 = nt_getTask(1214)  --�����ֿ���
	local FLY_npcidex = GetNpcParam(nNpcIndex,1)
	
	if (  messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("�Բ���! "..name.."! �����ʹ����ʱ�������꣬����ʧ��!.")
		losemessengertask()
	elseif ( Uworld1214 == 0 ) then  --û�ж���ɱ�ֵ�����
		Msg2Player("�����ѱ�������ϣ������Ҳ���ܻ�ý���.")
		return
	elseif ( FLY_npcidex ~= killfly[Uworld1214][4]) then
		Msg2Player("���˲�����������ȥ�ҵ�����ȷ���ǲ��ǽ𹷵���!")
	else
		messenger_killpoint()
	end
end