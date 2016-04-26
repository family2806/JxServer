Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\droptemplet.lua")
tbMazeExtAward = {};
tbMazeExtAward.	tbTSK_GetBaoRuong = 3076;
tbMazeExtAward.tbExpAward = {szName = "�i����ֵ", nExp = 2e6}
tbMazeExtAward.tbServerAward = {-- Phan thuong server cu
	[1] = {
		{szName = "�i����ֵ", nExp = 10e6},
	},
	[2] = {
			{{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=3},},
			{{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=3},},
			{{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=3},},
			{{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=3},},
			{{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=3},},
			{{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=3},},
			{{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=3},},
			{{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=3},},
			{{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=3},},
			{{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=1},},
			{{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.25},},
			{{szName="���ڿ�����",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.25},},
			{{szName="�����±���",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.25},},
			{{szName="����Ь����",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.25},},
			{{szName="������������",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.25},},
			{{szName="���ڻ�����",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.25},},
			{{szName="������������",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.25},},
			{{szName="�����屦��",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.25},},
			{{szName="�����Ͻ䱦��",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.125},},
			{{szName="�����½䱦��",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.125},},
			{{szName="������������",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.0625},},
			{{szName="������",tbProp={6,1,2566,1,0,0},nCount=5,nRate=50},},
			{{szName="����ʯ",tbProp={6,1,2712,1,0,0},nCount=1,nRate=1},},
			{{szName="��¹ʯ",tbProp={6,1,2711,1,0,0},nCount=1,nRate=2},},
			{{szName="���ʯ",tbProp={6,1,2710,1,0,0},nCount=1,nRate=2},},
			{{szName="�׻���ͼ��",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.013},},
			{{szName="�׻���ͼ��",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�׻�Ьͼ��",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�׻�����ͼ��",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�׻�����ͼ��",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�׻�����ͼ��",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�׻���ͼ��",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�׻��Ͻ�ͼ��",tbProp={6,1,3180,1,0,0},nCount=1,Rate=0.0625},},
			{{szName="�׻��½�ͼ��",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.0625},},
			{{szName="�׻���еͼ��",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.0025},},

	},		
}
function tbMazeExtAward:MazeBossAward(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	tbAwardTemplet:Give(self.tbServerAward[2], 1, {"KiemGiaMeCung", "KillBossLongCuuThienAward"})
	PlayerIndex = nOldPlayer
end

function tbMazeExtAward:_Message(CaptainName)
	local strMessage = format("��� <color=green> %s <color>���ѳɹ��������Խ��ȵ�������boss",CaptainName)
	AddGlobalNews(strMessage)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function tbMazeExtAward:MazeStepFinishAward(mate)
		local tbMazeAward = {
			{szName="��ڣ����",tbProp={6,1,30203,1,0,0},nCount=1},
		}
		local nOldPlayer = PlayerIndex
		PlayerIndex = mate.m_PlayerIndex
		if PlayerFunLib:CheckTaskDaily(self.tbTSK_GetBaoRuong, 5, format("�������ѻ��<color=yellow> 5 <color>�ν����ˣ�����������."), "<") then
			PlayerFunLib:AddTaskDaily(self.tbTSK_GetBaoRuong, 1)
			tbAwardTemplet:Give(tbMazeAward, 1, {"KiemGiaMeCung", "KillBossAward"})
		end	
		PlayerIndex = nOldPlayer
end
