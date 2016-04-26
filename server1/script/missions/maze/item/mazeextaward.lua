Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\droptemplet.lua")
tbMazeExtAward = {};
tbMazeExtAward.	tbTSK_GetBaoRuong = 3076;
tbMazeExtAward.tbExpAward = {szName = "经验值", nExp = 2e6}
tbMazeExtAward.tbServerAward = {-- Phan thuong server cu
	[1] = {
		{szName = "经验值", nExp = 10e6},
	},
	[2] = {
			{{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=3},},
			{{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=3},},
			{{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=3},},
			{{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=3},},
			{{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=3},},
			{{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=3},},
			{{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=3},},
			{{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=3},},
			{{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=3},},
			{{szName="金乌器械图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=1},},
			{{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.25},},
			{{szName="金乌盔宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.25},},
			{{szName="金乌衣宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.25},},
			{{szName="金乌鞋宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.25},},
			{{szName="金乌腰带宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.25},},
			{{szName="金乌护腕宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.25},},
			{{szName="金乌项链宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.25},},
			{{szName="金乌佩宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.25},},
			{{szName="金乌上戒宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.125},},
			{{szName="金乌下戒宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.125},},
			{{szName="金乌武器宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.0625},},
			{{szName="行侠令",tbProp={6,1,2566,1,0,0},nCount=5,nRate=50},},
			{{szName="苍狼石",tbProp={6,1,2712,1,0,0},nCount=1,nRate=1},},
			{{szName="云鹿石",tbProp={6,1,2711,1,0,0},nCount=1,nRate=2},},
			{{szName="青驹石",tbProp={6,1,2710,1,0,0},nCount=1,nRate=2},},
			{{szName="白虎盔图谱",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.013},},
			{{szName="白虎衣图谱",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="白虎鞋图谱",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="白虎腰带图谱",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="白虎护腕图谱",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="白虎项链图谱",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="白虎佩图谱",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="白虎上戒图谱",tbProp={6,1,3180,1,0,0},nCount=1,Rate=0.0625},},
			{{szName="白虎下戒图谱",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.0625},},
			{{szName="白虎器械图谱",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.0025},},

	},		
}
function tbMazeExtAward:MazeBossAward(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	tbAwardTemplet:Give(self.tbServerAward[2], 1, {"KiemGiaMeCung", "KillBossLongCuuThienAward"})
	PlayerIndex = nOldPlayer
end

function tbMazeExtAward:_Message(CaptainName)
	local strMessage = format("组队 <color=green> %s <color>已成功消灭在试剑谷的龙九天boss",CaptainName)
	AddGlobalNews(strMessage)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function tbMazeExtAward:MazeStepFinishAward(mate)
		local tbMazeAward = {
			{szName="剑冢宝箱",tbProp={6,1,30203,1,0,0},nCount=1},
		}
		local nOldPlayer = PlayerIndex
		PlayerIndex = mate.m_PlayerIndex
		if PlayerFunLib:CheckTaskDaily(self.tbTSK_GetBaoRuong, 5, format("今天你已获得<color=yellow> 5 <color>次奖励了，不能再领了."), "<") then
			PlayerFunLib:AddTaskDaily(self.tbTSK_GetBaoRuong, 1)
			tbAwardTemplet:Give(tbMazeAward, 1, {"KiemGiaMeCung", "KillBossAward"})
		end	
		PlayerIndex = nOldPlayer
end
