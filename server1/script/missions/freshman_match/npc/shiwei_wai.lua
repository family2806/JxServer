--���ִ������

Include("\\script\\missions\\freshman_match\\tryout\\head.lua")
function main()
	Say("��������������Ա: ��2005��6��1�յ�2005��6��10��, ÿ��20:�� 23:00������<color=yellow>����������������<color>. ��������Ŀ���Ǹ����֣�50����89����������ͬ�Ž����Ļ��ᣬ������ֵ����գ���ȥ�μӰ�!", 1, "ͬ�� /want_bid_option")
end

function want_enrol_option()
	if (validateDate(CP_UPTO_TRYOUT, CP_END_TRYOUT)) then
		local optiontab = {
				"�μ������������� /want_enrol",
				"�������������ɼ�!/look_sort",
				"����������������/help_freshmanmatch",
				"���Ժ�����!/OnCancel"
				}
		Say("��μ���������������?", getn(optiontab), optiontab)
	elseif(tonumber(date("%y%m%d%H")) >= CP_END_TRYOUT) then
		Say("�������������ѽ���������ǰ��Ŀ��Ե��ٰ�����������������Ա(182, 202) ��ȡ�ƺ�.", 0)
	else
		nHour = mod(CP_UPTO_TRYOUT, 100)
		nDay = floor(mod(CP_UPTO_TRYOUT, 10000) / 100)
		nMonth = floor(mod(CP_UPTO_TRYOUT, 1000000) / 10000)
		Say( "����������������ʼ��"..date( "%Y" ).."��"..nMonth.."�� "..nDay.."�� "..nHour.."��ʽ��ʼ���������ע!", 0 )
	end
end

function want_enrol()
	if ( nt_gettask( CP_TASKID_REGIST ) ~= CP_UPTO_TRYOUT ) then
	
		if (GetLevel() >= 90  ) then
			Say("90�����ϲ��ܲμӱ���.", 0)
			return
		end
		
		if ( GetLevel() < 50 ) then
			Say( "��ĵȼ�����50��Ҫ�󣬲��ܱ�������!", 0 )
			return
		end
		
	end
	local nHour = mod( CP_UPTO_TRYOUT, 100 )
	local opentime = TRYOUT_TIMER_2 / 60 / 60 / FRAME2TIME
	if (GetMissionV( MS_STATE ) == 0) then
		local talkstr = "������������ÿ���"..nHour..":00 ʱ"..opentime..", ������"..date( "%H:%M" )..", �Ժ������!"
		Say(talkstr, 0)
		return
	elseif (GetMissionV(MS_STATE) == 2) then
		local talkstr = "���������������ڽ��У������һ��!"
		Say(talkstr, 0)
		return
	end
		
	Say("������������ÿ���"..nHour..":00 ʱ"..opentime..", ����ʱ��Ϊ5���ӣ�����ʱ��Ϊ15���ӣ���Ҷ����Բμ�."..CP_MAXROUND.."��������������׼�����������������뿪���ߵȵ�����ʱ�䡣.", 2, "����μӱ���!/sure_enrol_1", "���ҿ���/OnCancel")
end

function sure_enrol_1()
	Say("�������������ĺ���ڱ������Ͻ�ʹ��PKҩ����Ҫ������������û�����ҩ�����򽫻ᱻͣ�����ҽ�ɾ������쳣PK״̬�� <color=red>��������ʱ������Ҫ��װ�������Ķȡ����붷�����Ͻ��ƶ���Ʒ������һ�¿���װ��������?",2, "����׼������!/sure_enrol_2", "���Ժ����!/OnCancel")
end

function sure_enrol_2()
	Say("�᳡��Ա:<color=red>����׼������ͱ���������Ҳ����ƶ�װ�������Ʒ�����ǣ�����ʹ����Ʒ�������һ�µ������ϵ���Ʒ������?",2,"ȷ��/sure_enrol", "�һ�δ׼����!/OnCancel")
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
		Say("�����ǵ��󣬸Ҳ���������������������Դ���ҩ���룬���뿪����!", 0)
		return
	end
	
	if (keyitem[1] == 0 and keyitem[2] == 0 and keyitem[3] == 0) then
		Say("Ŀǰ��Ĺ������Ϻ�û����Ʒ����ѡ����Ʒ������ȷλ��!<color=red> ���������󣬾����ƶ���Ʒ����ȷ�Ϲ������ϵ���Ʒ�����������?", 0)
		return 
	end
	
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		local talkstr = "����ǵ�һ�βμӰ�����μ���?"
		Say(talkstr, 2, "����μ�!/pay_enrol_money", "���ҿ���/OnCancel")
		return
	end
	
	join_tryout()
	Msg2Player("�����������󣬲����ƶ�װ�������Ʒ�����ǿ���ʹ����Ʒ");
end

function pay_enrol_money()

		nt_settask(CP_TASKID_REGIST, CP_UPTO_TRYOUT)
		for i = 1084 , 1092 do
			nt_settask(i, 0)
		end
		nt_settask( CP_TASKID_LOGOUT, 0)
		join_tryout()
end

function look_sort()
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		for i = 1096 , 1105 do
			nt_settask(i, 0)
		end
		nt_settask( CP_TASKID_LOGOUT, 0)
	end
	
	if (nt_gettask(CP_TASKID_ROUND) == 0) then
		Say("Ŀǰ�㻹δ���κγ��εı���!", 0)
	else
		Say("����������������ÿ�������μ�"..CP_MAXROUND.."�Σ��������Ѳμ���<color=yellow>"..nt_gettask(CP_TASKID_ROUND).."<color> �Σ�����Ϊ"..nt_gettask(CP_TASKID_POINT)..", ʤ"..nt_gettask(CP_TASKID_WIN).."t��, ��"..nt_gettask(CP_TASKID_LOSE).."��, ��"..nt_gettask(CP_TASKID_TIE).."��.", 0)
	end
end

