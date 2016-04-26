--西北北区 龙门镇 黄河码头船夫对话
--suyu
--20031029

CurWharf = 10;
Include("\\script\\global\\station.lua")

function main(sel)
	if (GetLevel() >= 5) then		--等级达到五级
		Say("我们在这个船上做工真的很辛苦！日晒风吹的，现在又遇到了大风浪，恐怕谁都活不了了!", 2, "坐船/WharfFun", "不坐/OnCancel")
	else		
		Talk(1,"","外面太乱了，看你手无缚鸡之力！一出村外我担心你就人头不保了!")
	end
end;

function  OnCancel()
   Talk(1,"","没钱不能坐! ")
end;