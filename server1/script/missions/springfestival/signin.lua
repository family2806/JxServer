Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\signin.lua]]);

SZFILE = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\player.txt]];

function signin_add()
	--���м���
	if (GetTask(TK_CO_PLAYTIMES) >= CO_MAXPLAYTIMES) then
		Say(CO_SIGNNPCNAME.."�������Ѳμ�<color=yellow>"..CO_MAXPLAYTIMES.." ��<color> ��, ������Ҳ���ˣ���ȥ��Ϣ��!", 0);
		return 0;
	end;

	if (GetTask(TK_CO_TOTAL) >= 50) then
		Say(CO_SIGNNPCNAME.."���Ѳμӽ��ջ <color=yellow>50 ��<color> ��, ������Ҳ���ˣ���Ҫ��Ϣ!", 0);
		return 0;
	end;
	
	if (GetLevel() < CO_LEVELLIMIT) then
		Say(CO_SIGNNPCNAME.."��ĵȼ����ͣ��Ҳ�����ð�գ�ʲôʱ��ﵽ<color=yellow>"..CO_LEVELLIMIT.."<color> ������.", 0);
		return 0;
	end;
	
	if (IsCharged() == 0) then
		Say(CO_SIGNNPCNAME.."ֻ�г�ֵ��Ҳ��ܲμӽ��ջ.", 0);
		return 0;
	end;
		
	if (gb_GetTask(FESTIVAL_SHREWMOUSE, 1) ~= 1) then
		local nNowTime = tonumber(GetLocalDate("%H"));
		local bOn = 0;
		if ((nNowTime >= 12 and nNowTime < 14) or 
          (nNowTime >= 19 and nNowTime < 23) or 
          (nNowTime >= 1 and nNowTime < 3)) then
			    bOn = 1;
		end;
		if (bOn == 0) then
			Talk(1, "", CO_SIGNNPCNAME.."30���˻����ÿ����У�ʱ��Ϊ<color=yellow>12: �� 14: 00 , 19: 00 �� 23: 00 ��1: 00 �� 3: 00 <color>.��ҿ����μӰ�.");
			return 0;
		else
			Talk(1, "", CO_SIGNNPCNAME.."��Ҳ��μ�'����30����'����ź����ǣ���·���Ѿ����ˣ������ڵ�0��, ��15��, ��30�֣���45�ֺ����");
			return 0;
		end;
	end;
	return 1;
end;

--	����뿪�ĸ�������
function playerleave_add()
	SetCurCamp(GetCamp());
	tab_Itemlist = {981, 984, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 978, 979, 980, 981, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991, 992, 993, 994};
	
	for i = 1, getn(tab_Itemlist) do
        ConsumeItem( -1, 1000, 6, 1, tab_Itemlist[i], 1 );
    end;
end;

-- 	��ҽ���׼�����ĸ�������
function playergetinprepare_add()
end;

--	��ҽ�����Ϸ���ĸ�������
function playergetingame_add()
	SetTask(TK_CO_PLAYTIMES, GetTask(TK_CO_PLAYTIMES) + 1);
	SetTask(TK_CO_TOTAL, GetTask(TK_CO_TOTAL) + 1);
	SetCurCamp(1);	--������ʱ��Ӫ
end;