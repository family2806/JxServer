-- 西山村 不醒人士 对话脚本
-- 李欣 2005-01-25

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\xishancun\\xishancun_head.lua")

COUNT_SHENMI_JUANZHOU = 100;

function main()
--	Uworld1064 = nt_getTask(1064) --西山村西山屿任务
--	
--	if ( GetLevel() >= 100) then
--	
--		if ( Uworld1064 == 0 ) then	-- 接任务前对话
--			Describe(DescLink_BuXingRenShi.."<#>：糖葫芦，好吃的糖葫芦啦！便宜又好吃的糖葫芦啦，这位客官，看你很面生，不是我们西山村的人吧！来串糖葫芦吧？<enter>",
--			2,"向他打探西山屿的秘密/task002","还是来串糖葫芦吧/task001");
--		elseif ( Uworld1064 == 1 ) then	--接任务后对话
--			Describe(DescLink_BuXingRenShi..format("<#>：%d个神秘卷轴你已经收集齐了吗？<enter>", COUNT_SHENMI_JUANZHOU),
--			2,"将神秘卷轴交给不醒人士/task004","我还是过阵子再来找你/no")
--		elseif ( Uworld1064 >= 2 ) then  --已经完成任务
--			Say("不醒人士：你去西山屿后，一定要处处留心呀。",0)
--		end;
--		
--	else
		Describe(DescLink_BuXingRenShi.."<#>: 糖葫芦便宜卖了! 这位客官看着面生，不是我们西山村的人吧！来串糖葫芦吧！<enter>",
		1,"买糖葫芦/task001");
--	end

end;

function task001()
	local name = GetName()
	Talk(1,"",name..": 这个糖葫芦真好吃!")
end;
function task002()
	local name = GetName()
	Describe(DescLink_BuXingRenShi.."<#>:你来找我有什么事吗<enter>"
				..name..format("<#>: 我听说这附近有人知道西山岛的位置。可以指给我去微山岛的方法吗<enter>不醒人士：这岂能是村里很多人都知道的，看来这个事情已经传出江湖了。这是几百年前的事了，大侠要收集够 %神秘密图给我我猜想得起<enter>", COUNT_SHENMI_JUANZHOU),
				2,"好的，我马上去找/task003","我没有兴趣/no")
end;

function	task003()
	Uworld1064 = nt_getTask(1064)
	nt_setTask(1064,1)
end;

-- 神秘卷轴交付界面
function	task004()
GiveItemUI( "交密图交界", format("不醒人士：你放 %d神秘密图在下面的空格。注意：如果放的多于或者少于%d神秘密图我将不接受.", COUNT_SHENMI_JUANZHOU,COUNT_SHENMI_JUANZHOU), "juanzhou", "no" );
end;

-- 确定神秘卷轴数量函数
function juanzhou(ncount)
	Uworld1064 = nt_getTask(1064)
	local scrollarray = {}
	local scrollcount = 0
	local scrollidx = {}
	local y = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype ==196) then	
			y = y + 1
			scrollidx[y] = nItemIdx;
			scrollarray[i] = GetItemStackCount(nItemIdx)
			scrollcount = scrollcount + scrollarray[i]
		end
	end
	if (y ~= ncount) then
		Say("神秘密图不够,你再检查看看!", 2, "啊！原来是放错了，我重新放./task004", "我检查看怎么了/no")
		return
	end
	if (scrollcount > COUNT_SHENMI_JUANZHOU) then
		Say(format("我只要 %d 神秘密图，你不用给我这么.", COUNT_SHENMI_JUANZHOU), 2, "哦，原来是放错了，我再试试./task004", "我检查看看是怎么了/no")
		return
	end
	if (scrollcount < COUNT_SHENMI_JUANZHOU) then
		Say("你给我的神秘密图不够，再检查看看!", 2, "哦，原来是放错了，我再试试./task004", "我检查看看是怎么了/no")
		return
	end
	if (scrollcount == COUNT_SHENMI_JUANZHOU) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i])
		end
		nt_setTask(1064,2)
		task005()
	end;		
end;
	
function task005()
	local name = GetName()
	Describe(DescLink_BuXingRenShi..format("<#>: 真想不到你已经收集了 %d 神秘密图，我一直叮咛你感觉困难就放弃.西山岛十分危险，你不去比较好<enter>",COUNT_SHENMI_JUANZHOU)
	..name..format("<#>:不要为我担心, 我已经找到 %d 神秘密图了, 我堂堂大丈夫怎么会惧怕区区一个微山岛。你只要告诉我怎么去.<enter>不醒人士：你可以在我们村的西山找小二(214, 195)然后告诉他是我告诉你去的，他就会知道怎么做了。记住要千万小心 <enter>",COUNT_SHENMI_JUANZHOU),
	1,"结束对话/no")
	end;

function no()
end;
