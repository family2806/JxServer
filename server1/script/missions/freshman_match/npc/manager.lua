Include("\\script\\missions\\freshman_match\\head.lua")

--������������Ա
function main()
	Say("��������������Ա: ��2005��6��1�յ�2005��6��10��, ÿ��20:�� 23:00������<color=yellow>������������<color>. ��������Ŀ���Ǹ����֣�50����89����������ͬ�Ž����Ļ��ᣬ������ֵ����գ���ȥ�μӰ�!", 1, "ͬ�� /want_bid_option")
end

function str__findicon(string)
	len = strlen(string)
	for i = 1, len do 
		if (strbyte(string, i) == 93) then
			return 1
		end
	end
	return 0
end

function want_bid_option()
	local optiontab = {}
	if ( validateDate( CP_UPTO_TRYOUT, CP_END_TRYOUT ) ) then	--����������ʱ��ʱ
		talkstr = "��������������Ա: �뱨���μ�������������?"	--�Ѿ����������
		optiontab = {
						"�����μ�������������'/regist_freshman",
						"�������������������'/transtoplace",
						"����������������/help_freshmanmatch",
						"���Ժ�����!/OnCancel"
			}
	elseif(tonumber( date( "%y%m%d%H" ) ) >= CP_END_TRYOUT ) then
		talkstr = "��������������Ա:�������������ѽ���������Լ�������ǰ����."	--�Ѿ����������
		optiontab = {
						"������������/look_freshman",
						"��ȡ���������ƺ�/catch_title",
						"����������������/help_freshmanmatch",
						"���Ժ�����!/OnCancel"
			}
	else
		Say("��������������Ա: ��������������δ��ʼ�����Ե�!", 0);
		return
	end

	Say(talkstr, getn(optiontab), optiontab)
end




function catch_title()	--10������ǰ����ȡ�ƺ�
	local factionnumber = GetLastFactionNumber()
	if( factionnumber < 0 or factionnumber > 9 ) then
		Say("��������������Ա: �㲻��ʮ�����ɵ�����?", 0);
		return
	end
	if( tonumber(date("%y%m%d%H")) < CP_END_TRYOUT ) then
		Say("��������������Ա: ������������δ��������δѡ��ǰ���������ܰ䷢�ƺ�.", 0)
		return
	end
	biwu_loadfile( FactionData[factionnumber + 1][1] );
		for i = 1, 5 do
		Name = biwu_getdata(FactionData[factionnumber+1][1], FactionData[factionnumber+1][2], "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(factionnumber + 20, 1, TITLETIME);
			Title_ActiveTitle(factionnumber + 20);
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]�ﵽ"..FactionTitle[factionnumber+1].."�ƺ�");
			Msg2Player("����"..FactionTitle[factionnumber+1].."�ƺ�");
			return 1
		end
	end
	Say("��������������Ա: �㲻���ʸ���ȡ�������������ƺ�.",0);
	return
end


function look_freshman()
	if (tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		Say("��������������Ա: ��������������δ��������û�о�������������.", 0)
		return
	end
local factab = {"���� /#look_list_fac(1)", "����/#look_list_fac(2)", "����/#look_list_fac(3)", "�嶾/#look_list_fac(4)", "��ü/#look_list_fac(5)", "����/#look_list_fac(6)", "ؤ��/#look_list_fac(7)", "����/#look_list_fac(8)", "�䵱/#look_list_fac(9)", "����/#look_list_fac(10)" , "������!/OnCancel"}
	Say("��������������Ա: �뿴��������������?", getn(factab), factab)
end

function look_list_fac(nfact)
	local ncount = 0
	biwu_loadfile( FactionData[nfact][1] );
	local topfac_mem = {}
	for i = 1, 5 do
		name = biwu_getdata(FactionData[nfact][1], FactionData[nfact][2], "Top"..i);
		 if (name ~= "" and name ~= nil) then
		 	ncount = ncount + 1
		 	topfac_mem[ncount] = name.."/OnCancel"
		 end
	end
	if (ncount > 0) then
		Say("��������������Ա:"..FactionData[nfact][3].."��ѡ��������:", getn(topfac_mem), topfac_mem);
	else
		Say("��������������Ա:"..FactionData[nfact][3].."��ѡ������û��", 0)
	end
end


function regist_freshman()

	if (GetLevel() >= 90  ) then
		Say("��������������Ա: 90�����߸��߼���Ľ����ܲμ�������������������Խ��뿴!", 0)
		return
	end
	
	if ( GetLevel() < 50 ) then
		Say( "��������������Ա: ��ĵȼ�����50��Ҫ�󣬲��ܱ�����������������Խ��뿴.", 0 )
		return
	end
	
	if (GetLastFactionNumber() == -1) then
		Say("��������������Ա: �㲻��ʮ�����ɵ��ˣ����ܲμӱ���������ʮ�����ɺ󣬲��ܲμӱ���!", 0)
		return
	end
	
	if ( nt_gettask( CP_TASKID_REGIST ) == CP_UPTO_TRYOUT ) then
		Msg2Player( "���Ѿ������ˣ�ֱ��ȥ����������������Ա���ܽ�����." )
		transtoplace()
	else
		local talkstr = "��������������Ա: ���һ�β���������������?��μ���"
		Say( talkstr, 2, "���뱨��/sure_regist", "���ҿ���/OnCancel" )
		return
	end
end

function sure_regist()

		nt_settask( CP_TASKID_REGIST, CP_UPTO_TRYOUT )
		for i = 1096 , 1105 do
			nt_settask( i, 0 )
		end
		nt_settask( CP_TASKID_LOGOUT, 0 )
		
		transtoplace()

end



function look_the_time( THETIME )
	local the_year = floor(THETIME / 1000000)
	local the_month = mod(floor(THETIME / 10000), 100)
	local the_date = mod(floor(THETIME / 100), 100)
	local the_hour = mod(THETIME,100)
	return	the_month, the_date, the_hour
end

