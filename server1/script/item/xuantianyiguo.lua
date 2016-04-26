Include("\\script\\missions\\yandibaozang\\head.lua")

function main()
	
	for nx,ny in YDBZ_MAP_MAP do
		local nsubidx = SubWorldIdx2ID(SubWorld)
		if nsubidx == ny then
			AddSkillState(458,2,0,18*60*40,1)
			AddSkillState(459,2,0,18*60*40,1)
			return 0
		end
	end
	Msg2Player("不能在此使用该物品.")
	return 1
end