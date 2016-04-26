Include([[\script\missions\springfestival\head.lua]]);


function springfestival06_login()
	if (sf06_isactive() ~= 0) then
		Msg2Player("最近，官府举行<color=yellow>驱赶30岁人活动<color>. 在 <color=yellow>19:00 到23:00<color> 各位人士可以到衙门报名参加活动.")
	end
end

if login_add then login_add(springfestival06_login, 2) end

