Include("\\script\\missions\\hsbattle\\hshead.lua");

function CheckCondition()
	if ( GetLevel() >= 60 ) then
		if (Pay(MS_SIGN_MONEY) == 1) then
			return 1;
		end;
 	end;
 	Say("�㲻���ȼ����ߴ���Ǯ�����������ϻ�ɽ����", 0);
 	return 0;
end;