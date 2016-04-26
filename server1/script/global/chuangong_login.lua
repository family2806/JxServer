Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\head_qianzhuang.lua")
TV_LAST_APPLY_TIME = 1571 -- �ϴ����봫��ʱ��
TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr>���½�:<link>"

function chuangong_login()
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then
			Describe(strimg.."��Ŀǰ<color=yellow>����Ĵ�����׼���׵�<color>����ʱ�������Ҵ�������", 2, "�ã���֪���ˣ���ʱ�һ����ݷá�/cg_OnCancel", "�����������Ҳ��봫���ˣ�����ȡ���������룡/cg_undo");
		else
			Describe(strimg.."��Ŀǰ<color=yellow>�Ѿ����봫����"..(num2datestr(applytime)).." <color>֮�󼴿ɴ�����", 2, "лл�������ѣ����ڴ�л����/cg_OnCancel", "�����������Ҳ��봫���ˣ�����ȡ���������룡/cg_undo");
		end
	end
end

function chuangong_msg()
	print("msgmsg")
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then
			Msg2Player("��Ŀǰ<color=yellow>����Ĵ����Ѿ�׼�����<color=>����ʱ���Ե����½�����ʽ������������Ҫ����2����Ʊ����Ҳ��ǰ׼���á�")
		else
			Msg2Player("��Ŀǰ<color=yellow>�����봫��������ʱ����"..(num2datestr(applytime)).."<color>֮�󣬴�����Ҫ����2����Ʊ����Ҳ��ǰ׼���á�")
		end
	end
end

function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
	return year.."��"..month.."��"..day.."��"
end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then
		Describe(strimg.."�ҵ�"..num2datestr(nowday).."�Ϳ���׼���ð��㴫���ˣ�����Ĳ��봫��",2,"�ǵģ��Ҳ��봫���ˣ�/cg_undo_sure", "�����һ���Ҫ�����ղ�һʱ����˵���˶��ѡ�/cg_OnCancel")
	else
		Describe(strimg.."��û�и���˵��Ҫ��������û˵������ôȡ���أ�",1,"�����Ի�/cg_OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.."�ðɣ�����Щ���������������ˣ�����´�Ҫ���Ļ���׼���ɣ�",1,"лл������/cg_OnCancel")
end

function cg_OnCancel()
		
end

if (GetProductRegion() ~= "vn") then
	login_add(chuangong_msg, 2)
end
