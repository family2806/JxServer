 Include("\\script\\task\\newtask\\newtask_head.lua")
 
function IsPickable( nItemIndex, nPlayerIndex )
	return 1
end
 
function PickUp( nItemIndex )
	local Uworld1065 = nt_getTask(1065)+1
	local Uworld1066 = nt_getTask(1066)
	local Uworld1000 = nt_getTask(1000)
	nt_setTask(1065,Uworld1065)
	if ( Uworld1000 == 10 ) and ( Uworld1065 >= 3 ) then 
		Msg2Player("���ѻ�����������⣬����ȥ����ʦ�Ի��ˡ�")
	elseif ( Uworld1000 == 180) and ( Uworld1065 >= 5 ) then
		Msg2Player("���ѻ����������⣬����ȥ����ʦ�Ի��ˡ�")
	elseif ( Uworld1065 == 1 ) and ( Uworld1066 == 0 ) then
		Msg2Player("�����ڿ��Ե������ִ������ʦ����һЩ������������񿩡����������񲻵������õ���Ǯ��Ҳ�����Ի������Ŷ��")
	elseif ( Uworld1066 ~= 0 ) then
		if ( Uworld1066 == Uworld1065 ) then
			Msg2Player("���Ѿ�������㹻�����⣬���Ի�ȥ����ʦ�������ˡ�")
		end
	end
	return 0 ; --ɾ����Ʒ
end