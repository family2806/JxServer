Include( "\\script\\item\\checkmapid.lua" )
IncludeLib("BATTLE")

function EatMedicine()
	for j = 1, getn(tbCD_MAP) do
		if ( nMapId == tbCD_MAP[j] ) then
			Msg2Player("�˵���ֻ�����ν�ս����ʹ��");
			return -1
		end
	end
	nowmissionid = BT_GetData(PL_RULEID);	--��ȡ��ǰMISSIONID
	curcamp = GetCurCamp();
	X = floor( X / 8 );
	Y = floor( Y / 16 );
	string = "<#><color=yellow>"..GetName().."<#><color><color=pink>���������ڵ�������<color=yellow>("..X.."<#>��"..Y.."<#>)<color>��������һ��֮������";
	Msg2MSGroup( nowmissionid, string, curcamp );
	Msg2Player("��ʹ����һ���Ÿ룬ͨ����ս�������ڵ����ꡣ");
end
