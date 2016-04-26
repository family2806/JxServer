--西北南区 凤翔府 路人7岑雄对话

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_cenxiong()
	else
Say("岑雄：俺生在凤翔，长在凤翔，也不知外面的世界是个啥样儿，好歹有一天要出去见识见识。",0)
	end
end;