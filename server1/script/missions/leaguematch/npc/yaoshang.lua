function main()
	Say("哈哈，有这么多高手在这里集中，真是令人感动。不瞒你说，我这里的药是最便宜的，你想买什么?", 2, "我只来看看!/want2sale", "不买/OnCancel")
end

function OnCancel()
end

function want2sale()
	Sale(53)
end