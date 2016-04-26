--万事通样例脚本(BlackBay.03.12.30)

Include([[\script\event\mid_autumn06\fairy_of_midautumn06.lua]]);

function main(sel)
	local tab_Content = {
		"用20000两银子换一个人的消息/Query2", 
		"用3000两银子换一个人的消息/Query3", 
		"不问/Nothing"
	};
	
	if (au06_is_inperiod() == 1) then
		tinsert(tab_Content, "中秋活动/au06_entrance_fairy");
	end;
	Say("我就是万事通，没有什么不知道的。你想要问什么?", getn(tab_Content), tab_Content);
end;

--下面三个函数都调用了 QueryWiseMan 的函数，此函数通知客户端输入一个名字并提交一次查询
--查询成功，系统回调第一个参数指定的回调函数名；查询失败，系统回调第一个参数指定的回调函数名
--回调函数原型请参考下面定义的两个样例函数WisemanCallBack和AbsentCallBack
function Query1()
	if (GetCash() >= 100000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 100000)
	else
		Nothing()
	end
end;

function Query2()
	if (GetCash() >= 20000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 20000)
	else
		Nothing()
	end
end;

function Query3()
	if (GetCash() >= 3000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 3000)
	else
		Nothing()
	end
end;

function Nothing()
	Talk(1, "", "你不是拿我开玩笑吧?")
end;

--此函数为成功查询信息的回调函数，参数个数和参数顺序不允许改变
function WisemanCallBack(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	if MapName == "" then
			Say("对不起, "..TargetName.."现在在特殊区域<color=red>独立帮会区域<color>, 但是不知道医生的具体位置, 这样我就只算半价吧.",0)
			Pay(MoneyToPay / 2)
			return
	elseif (MoneyToPay == 3000) then
		Say("C竔 kia "..TargetName.."现在在<color=red> "..MapName.."<color>你走快点，如果他到别的地方我就不管了. ",1,"多谢/no")
	elseif (MoneyToPay == 20000) then
		Say("那个"..TargetName.."现在在<color=red> "..MapName.."<color>,具体位置可能是<color=red> ( "..nPosX..", "..nPosY..")<color>, 你如果要找他的话就快点. ",1,"多谢/no")
	elseif (MoneyToPay == 100000) then
		SexString = "Nam"
		if (nSex ~= 0) then
			SexString = "N?"
		end
		Say("那个"..TargetName.."尊令!"..PlayerLevel.."侠客"..SexString..",现在的位置是<color=red>"..MapName.."("..nPosX..", "..nPosY..")<color> 的形状.,第. 世界 "..nWorldRank.."名., PK值 "..PKValue..". 你要找他的话就快点. ",1," t?/no")
	end
	Pay(MoneyToPay)
end;

--此函数为失败查询(也就是不在线)信息的回调函数，参数个数和参数顺序不允许改变
function AbsentCallBack(TargetName, MoneyToPay)
	Say("不好意思, "..TargetName.."他现在不在这, 不知道他在哪, 咨询费我只收一半，呵呵. ",0)
	Pay(MoneyToPay / 2)
end;

function no()
end
