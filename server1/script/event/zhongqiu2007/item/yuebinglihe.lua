--�����2007 �±����
--by С�˶��
--2007-09-07

Include("\\script\\event\\zhongqiu2007\\head.lua")

function mainzhongqiu2007_entry()
	Describe("��٣����κ��������������������ղ��ڻʹ�������ս�����������ѳɺܶ���Ƭ����ʧ�ڸ��ء���˵<color=yellow>�ٰ��Ļ�Ա�� (169/194)<color> ��<color=yellow>�����Ĺ�Ա��(198/208) <color>����Ѱ������������˭���԰������ҵ����������������Ӧ�Ľ���������쵽�ˣ��ڻʹ�Ҳ��Ҫ���ܶ������±�����<color=red>22-09-2007<color> �� <color=red>24h00 ��31-10-2007<color>, ÿ�б����м��ʻ��<color=red>����ͼ��Ƭ<color> ���� <color=red>����ͼ��Ƭ<color>, �����뻻ʲô��",2,"�����������./zhongqiu2007_getlihe","���Ժ����!/NoChoice")
end

function zhongqiu2007_getlihe()
	if check_level() == 0 then
		Say(tb_content["szlevel"],0)
		return 1
	end
	if check_pay() == 0 then
		Say(tb_content["szpay"],0)
		return 1
	end
	if CalcEquiproomItemCount(6,1,1514,-1) < 1 then
		Say("��٣�����û���������±��У��ǲ�����������������",0)
		return 1
	end
	if CalcFreeItemCellCount() < 4 then
		Say("��٣�װ�������λ��������װ��.",0)
		return 1
	end

	local ncurexp = GetTask(TSK_ZHONGQIU2007_LIHE)
	local nexp = 8000000
	if ncurexp >= NZHONGQIU2007_MAX then
		Msg2Player("�i��õľ���ֵ��������.")
		return 1
	else
		if(ncurexp + nexp) >= NZHONGQIU2007_LIHE_MAX then
			nexp = NZHONGQIU2007_LIHE_MAX - ncurexp
		end
		SetTask(TSK_ZHONGQIU2007_LIHE,(ncurexp+nexp))
		AddOwnExp(nexp)
		Msg2Player(format("��� <color=yellow>%s<color> ����ֵ",nexp))
		WriteLog(format("[zhongqiu2007_lihe]\t Date:%s\t Account:%s\t Name:%s\t GetExp:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nexp));
	end
	ConsumeEquiproomItem(1,6,1,1514,-1)
	local nrate = random(1,tb_Mareial_LIHE[1]);
	local nsum = 0
	for nkey,nitem in tb_Mareial_LIHE[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial_LIHE[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local nidx = AddItem(g,d,p,1,0,0)
				Msg2Player(format("�����1 <color=yellow>%s<color>",GetItemName(nidx)))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
				return 0
			end
	end
end
