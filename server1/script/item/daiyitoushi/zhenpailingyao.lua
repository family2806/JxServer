-- ====================== �ļ���Ϣ ======================

-- ������Ե�����һ������ҩ
-- ʳ�ú�������5��Ǳ�ܵ�
-- ��������ҩ���ñ�������һ��Byte��¼�鵤ʹ�ô������ڶ���Byte��¼��ҩʹ�ô���

-- Edited by �ӷ��~
-- 2008/03/03 23:29

-- ======================================================
Include("\\script\\lib\\gb_modulefuncs.lua")


TSK_ZHENPAILINGDAN_USECNT	=	1882;
TSK_TOUSHI_FLAG				=	1881						-- ������Ͷʦ���˳����ɵı��
														--	 0��δ����תͶ���ɻ�תͶ���ɳɹ�����תְ����һ���������1���ɹ�����תͶ���ɣ�
TSK_TOUSHI_COUNT			=	1883						-- ������Ͷʦ��תְ�Ĵ���

function main(nItemIdx)
--	if (gb_GetModule("SWITH_DAIYITOUSHI") ~= 1) then
--		Say("�Բ��𣬸ù�����ʱ�����ˣ���ʱ������Ժ�֪ͨ", 0);
--		return 1;
--	end
	
	local nValue	= GetTask(TSK_ZHENPAILINGDAN_USECNT);
	local nTimes = GetByte(nValue, 2);
	
	local str ={
		"�о�һ��������ҩ���ǲ���ʹ��(δת���ɲ���ʹ��)",
		"������ҩ�ոշ��£��������̾Ͳ���һ�����������澭����(����5��Ǳ�ܵ�)",
		"����������ҩ������û�й�Ч��(��ʹ�õ����������)"
	}
	
	if(nTimes >= 15) then 				--ʹ�ó�������
		Msg2Player(str[3])
		return 1;
	elseif (GetTask(TSK_TOUSHI_FLAG) == 0 and GetTask(TSK_TOUSHI_COUNT) <= 0) then     	-- תͶ���ɳɹ��ſ�ʹ��
		Msg2Player(str[1])
		return 1;
	else                            	-- ����5��Ǳ�ܵ�
		AddProp(5);
		SetTask(TSK_ZHENPAILINGDAN_USECNT, SetByte(nValue, 2, nTimes + 1));
		Msg2Player(str[2]);
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tAdd Prop 5 by ZhenPaiLingYao",
						"������ҩ",
						GetLocalDate("%Y-%m-%d %X"),
						GetName(), GetAccount()));
		return 0;
	end
end
