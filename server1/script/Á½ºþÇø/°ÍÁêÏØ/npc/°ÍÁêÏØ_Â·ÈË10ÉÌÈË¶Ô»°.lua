--������ ������ ·��10��ŶԻ�
--�������������񣺰����ļ�ױ
--suyu
-- Update: Dan_Deng(2003-08-10)
--ע�⣺Խ��ֻ��һ��Ԫ�����൱�����ǵ���Ԫ�������ƽн�Ԫ����ǧ��ע�⣬����� 343

function main()
	UTask_world20 = GetTask(48)
	if (CheckStoreBoxState(1) == 0 and  UTask_world20 == 1) then			-- ���������ӵ������������򸽼Ӵ�����
		Say("��ţ�����ʹӴ�ʳ������һ������ı��䣬��������������������ʱ��Ÿ�����Ʒ������Ϊ���ṩ��Ʒ����������ȫ��ԭֻ��һ�ң����޷ֺš���Ҫ��Ҫ������",4,"����/buy_addibox", "�������һ��/task_ring","������չ��/box_help", "û��Ȥ/no")
	elseif (UTask_world20 == 1) then
		task_ring()
	elseif (CheckStoreBoxState(1) == 0) then
		Say("��ţ�����ʹӴ�ʳ������һ������ı��䣬��������������������ʱ��Ÿ�����Ʒ������Ϊ���ṩ��Ʒ����������ȫ��ԭֻ��һ�ң����޷ֺš���Ҫ��Ҫ������",3,"����/buy_addibox", "������չ��/box_help", "û��Ȥ/no")
	else
		other_chat()
	end
end;

function task_ring()
	UTask_world20 = GetTask(48);
	if (UTask_world20 == 1) then
		Say("��ţ���Ҫ����������ױѽ��������Ļ�ʣ�Ĳ����ˣ���Դ���Ķ����ͱ��˵����ඣ�ֻҪ����������",2,"��/yes", "����/other_chat","Kh�ng mua/no")
	end
end

function other_chat()
	Talk(3,"", "��ţ����Ǵ��Ĵ����ģ���һ·�ϵ��˺ܶ࣬�ܲ�̫ƽ��","��û�뵽�Դӽ��˶�ͥ����������û����ʲôǿ�����ˣ���˵��ֲ���֣�","һ��������֪��ԭ�������������µĲ��ǹٸ�������һ����ʲô�����������֯���ѹ�����ô̫ƽ�أ�")
end

function yes()
	if(GetCash() >= 200)then
		Talk(1,"","��ţ������Ѿ���������ˣ��������������ú��ˡ�")
		Pay(200);
		AddEventItem(181);
		Msg2Player("��õ�һ�Զ���");
		AddNote("��õ�һ�Զ���")
--		SetTask(48, 2);
	else
		Talk(1,"","��ţ������ϵ�Ǯ�����ˣ�������Ǯ�����ɡ�")
	end
end;

function buy_addibox()
		local szMsg = 
		{
				"��ţ�����´Ӵ�ʳ������һ������ı��䣬��������������������ʱ��Ÿ������Ʒ������Ϊ���ṩ��Ʒ����������ȫ��ԭֻ��һ�ң����޷ֺš�Ҫ��Ҫ������",	--1
				"40ͭǮ������չ��/#buy_addibox_yes(40)",	--2
				"20ͭǮ������չ��/#buy_addibox_yes(20)",	--3
				"��û��Ȥ/no",			--4
		};
		
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		
		if (nDate >= 20080202 and nDate <= 20080302) then	--���ڻ�ڼ���
			Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		else
			--tinhpn 20100803: Patch Request
			--Say(szMsg[1], 2, szMsg[2], szMsg[4]);
			Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		end;
				
end

function buy_addibox_yes(nNedCount)
	if (nNedCount < 1 or nNedCount == nil) then
		print("Fail!!!!");
		return
	end;
	
	local nCount = CalcEquiproomItemCount(4, 417, 1, 1)
	
	if (nCount < nNedCount) then
		Talk(1,"","�����ϵ�Ǯ�����ˣ�������Ǯ�����ɡ�")
		return 1;
	end
	ConsumeEquiproomItem(nNedCount, 4, 417, 1, 1)
	
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName()..format("]: ���� %d ͭǮ, �õ�1����չ��.",nNedCount),-2,0,0,0);
	OpenStoreBox(1)
	
	UseSilver(1, 2, nNedCount); -- ��Ԫ���һ�ΪͭǮ������ͳ��(ֱ�����ĵ�Ԫ����Ʊ����ͭǮ�һ���ͬ����)
	SaveNow(); -- ��������
	  	
	Talk(1,"","������չ��ɹ���ͬʱ���<color=yellow>װ����<color>���ܣ�")
	Msg2Player("�뵽������������չ��ĳ�ʼ���롣")
end


function box_help()
	str=
	{
	"<#>��ţ�һ����ɫֻ�ܹ���һ����չ�䡣��չ��������ṩ������ʹ�ã���СΪ60���ܺ�ԭ�еĴ�������ͬ��ֻ�ǲ��ܴ�Ž�Ǯ��",
	"<#>������չ����㻹���Եõ�һ��������������ԭ�д����䡢��չ�������װ��������������",
	"<#>�������趨�����Ż������á�����������״̬ʱ������װ�����ܴ��ϻ�ж�£�������Ӱ��ԭ�й��ܣ���PKֵ����ʱ�Ի�����ϵ�װ������",
	"<#>�����趨���룺�������������<color=yellow>�趨����<color>һ�򣬵���С���̣�������0-9Ӧ��10�����֡�",
	"<#>�״��������룬���������Ϊ�趨���ʼ���룻���Ѿ����ù����룬���������Ϊ�޸����롣",
	"<#>�޸�����ǰ����Ҫ����������룬�����������������룬����ȷ���޸�����ɹ������볤������Ϊ1λ���֣��Ϊ9λ��",
	};
	Talk(6,"",str[1],str[2], str[3], str[4], str[5], str[6]);
end
	
	
function no()
end;
