-- ====================== �ļ���Ϣ ======================

-- ������Ե�����һ׷Ѱ����������NPC�Ի��ű�

-- Edited by �ӷ��~
-- 2008/07/24 13:43

-- ======================================================

Include("\\script\\task\\system\\task_string.lua");				-- �Ի�����ͷ�ļ�
Include("\\script\\event\\guoqing_jieri\\200808\\head.lua");	-- ������Ϣ�ļ�
Include("\\script\\lib\\common.lua");							-- 
Include("\\script\\lib\\awardtemplet.lua")						-- �������ú�����


function main()
	zxmp_reset_vertsk();
	
	-- ���ڻ�ڼ���
	if (zxmp_200808_checkdate() ~= 1) then
		CreateTaskSay({format("<dec><npc>Ch�o %s!", GetName()), "�Ի�����/OnCancel"});
		return 
	end
	
	local sz_msg = "";
	
	for i = 1, getn(TB_ZHUIXUNMIPU_COMPLIST) do
		if (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 1) then
			sz_msg = sz_msg.."<enter>"..TB_ZHUIXUNMIPU_COMPLIST[i].sz_name.." "..TB_ZHUIXUNMIPU_COMPLIST[i].n_count.."��";
		elseif (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 4) then
			sz_msg = sz_msg.."<enter>"..TB_ZHUIXUNMIPU_COMPLIST[i].sz_name.." "..TB_ZHUIXUNMIPU_COMPLIST[i].n_money.." ��";
		else
			print("ZXMP TB_ZHUIXUNMIPU_COMPLIST Invalid");
			return 0;
		end
	end
	
	CreateTaskSay({format("<dec><npc>�ϳ���������Ҫ׼����<enter>%s<enter>, ������ϲ������޷�����.", sz_msg), 
					format("�ϳ� %s/zxmp_compound", "��������"), 
					"�Ի�����/OnCancel"});
end

function OnCancel()
end

-- CalcItemCount
-- ConsumeItem

function zxmp_compound()
	for i = 1, getn(TB_ZHUIXUNMIPU_COMPLIST) do
		
		if (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 1) then
			local ng, nd, np, nl =  unpack(TB_ZHUIXUNMIPU_COMPLIST[i].tb_itemid);
			local n_count, sz_name =	TB_ZHUIXUNMIPU_COMPLIST[i].n_count,
										TB_ZHUIXUNMIPU_COMPLIST[i].sz_name;
			
			local n_curcnt = CalcItemCount(3, ng, nd, np, nl);
			
			if (n_curcnt < n_count) then
				CreateTaskSay({format("<dec><npc>%s ���Ĳ����� %d, �ټ��һ��.", sz_name, n_count), "�Ի�����/OnCancel"});
				return
			end
			
		elseif (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 4) then
			local n_money = TB_ZHUIXUNMIPU_COMPLIST[i].n_money;
			local n_curmon = GetCash();
			
			if (n_curmon < n_money) then
				CreateTaskSay({format("<dec><npc>�����ϴ���Ǯ�������ټ��һ��.", n_money), "�Ի�����/OnCancel"});
				return
			end
		else
			print("ZXMP TB_ZHUIXUNMIPU_COMPLIST Invalid");
			return 0;
		end
	end
	
	local b_succeed = 0;
	
	for i = 1, getn(TB_ZHUIXUNMIPU_COMPLIST) do
		
		if (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 1) then
			local ng, nd, np, nl =  unpack(TB_ZHUIXUNMIPU_COMPLIST[i].tb_itemid);
			local n_count, sz_name =	TB_ZHUIXUNMIPU_COMPLIST[i].n_count,
										TB_ZHUIXUNMIPU_COMPLIST[i].sz_name;
			b_succeed = ConsumeItem(3, n_count, ng, nd, np, nl);
			
			if (b_succeed ~= 1) then
				return
			end
			
		elseif (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 4) then
			local n_money = TB_ZHUIXUNMIPU_COMPLIST[i].n_money;
			
			b_succeed = Pay(n_money);
			
			if (b_succeed ~= 1) then
				return
			end
		else
			print("ZXMP TB_ZHUIXUNMIPU_COMPLIST Invalid");
			return 0;
		end
	end
	
	local nItemIdx = AddItem(6, 1, 1791, 1, 1, 0);
	-- tbAwardTemplet:ITEM_SetExpiredTime(nItemIdx, 20080827);
	-- SyncItem(nItemIdx);
	Msg2Player(format("�õ� %s", "��������"));
end
