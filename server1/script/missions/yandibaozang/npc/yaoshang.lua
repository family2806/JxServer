function main()
	Say("哈哈，看到那么多高手聚集在这里，真是让人感动。不瞒你说，本店的药品是最便宜的，想要什么?", 2, "我只来看看!/want2sale", "不买/OnCancel")
end

function OnCancel()
end

function want2sale()
	Sale(53)
end