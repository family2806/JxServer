--龙泉村 路人 孔晓
--龙泉村新手任务：后爹好不好
-- By: Dan_Deng(2003-09-03)

function main(sel)
	UTask_world18 = GetTask(18)
	if (UTask_world18 == 3) then		-- 任务中
		Talk(5,"W18_step","Kh鎛g Hi觰! C� ph秈 ngi r蕋 gh衪 ngi cha sau kh玭g?","T筰 sao ngi l筰 n鉯 nh� v藋?","Kh玭g ph秈 sao?","Л琻g nhi猲 l� kh玭g! g 蕐 l� m閠 ngi t鑤. цi i v韎 m� con ta r蕋 t鑤!","Th藅 v藋 �? V藋 th� t鑤 r錳 N誹 bi誸 頲 nh� v藋 th� 玭g 蕐 s� r蕋 vui")
	else				-- 非任务对话
		Talk(1,"","M� con ta trc y u b� m鋓 ngi khinh r�,t� khi 頲 玭g 蕐 b秓 b鋍 th� m鋓 th� u  th藅 s� thay i")
	end
end;

function W18_step()
	SetTask(18,6)
	Talk(1,"","?")
	AddNote("Х hi觰 頲 t﹎ t� c馻 Kh鎛g Hi觰, l藀 t鴆 甶 n鉯 l筰 v韎 玭g ch� t筽 h鉧 cho 玭g 蕐 y猲 t﹎ ")
	Msg2Player("Х hi觰 頲 t﹎ t� c馻 Kh鎛g Hi觰, l藀 t鴆 甶 n鉯 l筰 v韎 玭g ch� t筽 h鉧 cho 玭g 蕐 y猲 t﹎ ")
end
