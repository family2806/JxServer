Include([[\script\missions\springfestival\head.lua]]);


function springfestival06_login()
	if (sf06_isactive() ~= 0) then
		Msg2Player("������ٸ�����<color=yellow>����30���˻<color>. �� <color=yellow>19:00 ��23:00<color> ��λ��ʿ���Ե����ű����μӻ.")
	end
end

if login_add then login_add(springfestival06_login, 2) end

