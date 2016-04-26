-- 文件名　：yinyanghuoxuewan.lua
-- 创建者　：wangjingjun
-- 内容　　：阴阳活血丸
-- 作用	   ：全抗+ 25% 生命+ 500 点 闪避+ 500 点 跑速+ 20% 有效时间15分钟
-- 创建时间：2011-07-15 14:34:59

function main(nItemIndex)
	local nTime = 15 * 60 *18
	local tbSkill = { 1121,256,259,257,}

	for i=1,getn(tbSkill) do
		AddSkillState(tbSkill[i], 1, 1, nTime)
	end	
	Msg2Player("您已使用" .. "阴阳活血丹") 
	return 
end