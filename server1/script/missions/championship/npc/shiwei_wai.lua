--���ִ������
Include("\\script\\missions\\championship\\head.lua")
Include("\\script\\missions\\championship\\tryout\\head.lua")
function main()
	Say("������Ա: ��α�����������Ӣ�ۺ����ֺ�����ѡ��90λ���ָ��ִ���μ�ȫ�����ִ�ᣡ����ȥ�μ�ʢ������ִ��!", 1, "ͬ��/want_enrol_option")
end

function want_enrol_option()
	cp_syntaskround()
	if (validateDate(CP_UPTO_TRYOUT, CP_END_TRYOUT)) then
		local optiontab = {
				"�μ�����Ԥѡ��/want_enrol",
				"�鿴�����ڵ�Ԥѡ���ĳɼ�/look_sort",
				"����Ԥѡ������/help_tryout",
				"��һ�����!/OnCancel"
				}
		Say("��ȥ���ִ��", getn(optiontab), optiontab)
	elseif(tonumber(date("%y%m%d%H")) > CP_END_TRYOUT) then
		Say("���ִ��Ԥѡ�������ˣ�����Ե��ٰ������ִ���Ա����ѡ����.", 0)		
	else
		nHour = mod(CP_UPTO_TRYOUT, 100)
		nDay = floor(mod(CP_UPTO_TRYOUT, 10000) / 100)
		nMonth = floor(mod(CP_UPTO_TRYOUT, 1000000) / 10000)
		Say("���ִ��Ԥѡ������֯��"..date("%Y").."��"..nMonth.."��"..nDay.."��"..nHour.."��ʽ��ʼ���������ע!",0)
	end
end

function want_enrol()
	--if ���˺ŵ�������ɫ�ѱ��� then
	--	Say("���ʺ��ڱ������н�ɫ�μ�����Ԥѡ������������ɫ�ڱ������ܲ��������ڷ���������ɫ�ʸ�����ñ���ɫ����������", 0)
	--	return 
	--end
	if (nt_gettask(CP_TASKID_REGIST) == 9) then	--�Ѿ�ȡ���˱����ʸ�
		Say("���Ѿ������˲μ�����Ԥѡ�����ʸ񣬲��ܼ��������μӱ���.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_TITLE) == 9) then		--�Ѿ�ȡ�þ���Ȧ�ʸ�
		Say("����ȡ��ѡ���ʸ񣬲�Ҫ��������λ��!", 0)
		return
	end
	local nHour = mod(CP_UPTO_TRYOUT, 100)
	local opentime = TRYOUT_TIMER_2 / 60 / 60 / FRAME2TIME
	if (GetMissionV(MS_STATE) == 0) then
		local talkstr = "����Ԥѡ����ʼ��ÿ��"..nHour..":00��"..opentime..", ������"..date("%H:%M")..", ����������!"
		Say(talkstr, 0)
		return
	elseif (GetMissionV(MS_STATE) == 2) then
		local talkstr = "������������ڽ��б����������һ��!"
		Say(talkstr, 0)
		return
	end
		
	Say("����Ԥѡ����ʼ��ÿ��"..nHour..":00��"..opentime.." ʱ������ʱ����5���ӣ�����ʱ����10���ӣ�ÿ����ֻ�ܲμ�"..CP_MAXROUND.."�ֱ���. ��׼��������֮�������ѡ���뿪���ǵȴ������ݱ����ɼ�ѡ��5���˴������ɲμ������ܾ���", 2, "����μ�Ԥѡ!/sure_enrol_1", "���ҿ���/OnCancel")
end

function sure_enrol_1()
	Say("������������������������Ͻ�ʹ��<color=red>PKҩƷ<color>, �μ�֮ǰ��Ҫ���������Ƿ��д���ҩƷ�����������򽫻ᱻͣ��. �ҽ����������쳣PK״̬. <color=red>��������ʱ����Ҫ��װ�������ĵ㡣�����������Ͻ�ת����Ʒ����Ҫ�ټ�鹤�����е���Ʒ������",2, "��׼������!/sure_enrol_2", "��һ�����!/OnCancel")
end

function sure_enrol_2()
	Say("�᳡��Ա:<color=red>����׼�����ͱ���������Ҳ���ת�Ʊ��������Ʒ�����ǻ�����ʹ�ù�����ͱ��������Ʒ������һ�¹������е���Ʒ����?",2,"ȷ��/sure_enrol", "�һ�û��׼��!/OnCancel")
end

function sure_enrol()
	local forbiditem_con = 0
	local forbiditem_key = 0
	local keyitem = {}
	local keyitem_g = {}
	local keyitem_d = {}
	local keyitem_p = {}
	for i = 1, 3 do
		keyitem[i] = ITEM_GetImmediaItemIndex (i)
		if (keyitem[i] ~= 0) then
			keyitem_g[i], keyitem_d[i], keyitem_p[i] = GetItemProp(keyitem[i])
		else
			keyitem_g[i] = 0
			keyitem_d[i] = 0
			keyitem_p[i] = 0
		end
	end
	for i = 1, getn(CP_FORBID_ITEM) do
		forbiditem_con = CalcEquiproomItemCount( CP_FORBID_ITEM[i][2][1], CP_FORBID_ITEM[i][2][2], CP_FORBID_ITEM[i][2][3], CP_FORBID_ITEM[i][2][4] )
		if (forbiditem_con > 0) then
			break
		end
		for j = 1, 3 do 
			if (keyitem_g[j] == CP_FORBID_ITEM[i][2][1] and keyitem_d[j] == CP_FORBID_ITEM[i][2][2] and keyitem_p[j] == CP_FORBID_ITEM[i][2][3]) then
				forbiditem_key = 1
				break
			end
		end
	end
	if(forbiditem_con > 0 or forbiditem_key > 0) then
		Say("����󵨣����Ҳ���������������������Դ���ҩ���룬�Ͽ��뿪!", 0)
		return
	end
	
	if (keyitem[1] == 0 and keyitem[2] == 0 and keyitem[3] == 0) then
		Say("��Ĺ�������û��ҩƷ����ҩƷ�Ž���������<color=red>�����������ֹת����Ʒ����ȷ���������Ƿ�������?<color>", 0)
		return 
	end
	
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		local talkstr = "���һ�βμ�ԤѡҪ��10�����ı�����."
		Say(talkstr, 2, "����10����./pay_enrol_money", "���ҿ���/OnCancel")
		return
	end
	
	join_tryout()
	Msg2Player("���������֮�󣬲���ת�Ʊ����е���Ʒ���������ɿ���ʹ�ñ����͹������е���Ʒ��");
end

function pay_enrol_money()
	if (GetCash() >= CP_CASH) then
		Pay(CP_CASH)
		
		nt_settask(CP_TASKID_REGIST, CP_UPTO_TRYOUT)
		for i = 1084 , 1092 do
			nt_settask(i, 0)
		end

		join_tryout()
		return
	end
	Say("��ı����Ѳ�������10��������!", 0)
end

function look_sort()
	if (nt_gettask(CP_TASKID_ROUND) == 0) then
		Say("�����ڻ�û�вμ��κα���!", 0)
	else
		Say("���ִ������Ԥѡ��ÿ�������μ�"..CP_MAXROUND.."��. �������Ѿ��μ���<color=yellow>"..nt_gettask(CP_TASKID_ROUND).."<color> �ֱ���, �õ��ܷ��ǣ�"..nt_gettask(CP_TASKID_POINT)..", ʤ"..nt_gettask(CP_TASKID_WIN).."��, ��"..nt_gettask(CP_TASKID_LOSE).."��, ��"..nt_gettask(CP_TASKID_TIE).."��.", 0)
	end
end

