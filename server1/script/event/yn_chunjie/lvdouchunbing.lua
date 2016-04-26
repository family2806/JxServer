function main()
	--使用后10分钟内，生命和内力增加50％
	AddSkillState(458,1,0,10*60*18)	--血量
	AddSkillState(459,1,0,10*60*18)	--内力
	Msg2Player("<#> 在10分钟内充，血量和内力将增加50%")
end