Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\crystal_head.lua")

tbNSKT_Crystal3Col = {}

function main(itemidx)
	--���ʹ����Ʒ����
	if(tbNSKT_Crystal:checkCondition() == 0)then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n s� d�ng v�t ph�m! Y�u c�u c�p �� tr�n 50 v� ��  n�p th�.")
		return 1
	end
	-- het event, ��Ʒʹ�õ���
	if (tbNSKT_Crystal:isExpired(itemidx) == 1) then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0; -- delete item
	end
	-- su dung vat pham thanh cong, xoa item
	if (tbNSKT_Crystal3Col:UseItem() == 1)then
		return 0;	
	else
		Talk(1, "", "��i hi�p ��  ��t t�i �a s� d�ng v�t ph�m n�y!")
		return 1 -- ��ɾ��item	
	end
end

function tbNSKT_Crystal3Col:UseItem()
	if (tbNSKT_Crystal and tbNSKT_Crystal:isMaxItemUse() == 0 ) then
		local tbExp = {
								{n_Exp =30e5, n_Rate = 10},
								{n_Exp =25e5, n_Rate = 20},
								{n_Exp =20e5, n_Rate = 70}								
							};
							
		local nTaskValue = GetBitTask(tbNSKT_Crystal.nTaskID, tbNSKT_Crystal.nStartBit, tbNSKT_Crystal.nEndBit)
		local nTemp = (tbNSKT_Crystal.nMaxExp  - nTaskValue) * tbNSKT_Crystal.nScaleFactor
		--neu tbExp = nil, ������������1ɾ����Ʒ
		if (not tbExp) then
			return 1;
		end
		-- ���鲻�ܳ���8ti����
		for i = 1, getn(tbExp) do
			if (nTemp < tbExp[i].n_Exp) then
				tbExp[i].n_Exp = nTemp
			end
		end		
		
		local tbAward = {}
		for i = 1, getn(tbExp) do
			tbAward[i] = {
									[1] = {nExp = tbExp[i].n_Exp},
									[2] = 
											{
												pFun = function (tbItem, nItemCount, szLogTitle)
													%tbNSKT_Crystal:addTask(%tbExp[%i].n_Exp)
												end
											},
									nRate = tbExp[i].n_Rate,
								};
		end
		--�����Ʒ���ܽ���������Ʒ�񲻶�Ҫ�󣬷���1ɾ����Ʒ
		if (not tbAward or getn(tbAward) ~= getn(tbExp)) then
			return 1;
		end
		
		tbNSKT_Crystal:giveAward(tbAward, "Ph�n th��ng EXP k�t tinh tam s�c");		
		return 1;
	end
	return 0; --ʹ��max������ʹ�ã�����ɾ��
end