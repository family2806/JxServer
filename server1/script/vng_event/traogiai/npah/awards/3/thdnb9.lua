--����������սʤ�� - Created by DinhHQ - 20110607
Include("\\script\\vng_event\\traogiai\\NPAH\\vng_AwardClass.lua")
Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")

tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201108180000
tbCurSeason.nEndDate = 201108252400
tbCurSeason.strName = "��ȡ���µ�һ��9����"
tbCurSeason.strNPC = "ս������"
tbCurSeason.nID = 3
tbCurSeason.tbAccList = {
	["chikilled2"]={[1]={{nAwardID=2,nCount=3},{nAwardID=3,nCount=1},{nAwardID=4,nCount=5},{nAwardID=5,nCount=3},},[2]={{nAwardID=6,nCount=50},},[3]={{nAwardID=6,nCount=24},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[6]={{nAwardID=8,nCount=50},},[7]={{nAwardID=8,nCount=24},},[9]={{nAwardID=10,nCount=32},},[10]={{nAwardID=11,nCount=32},},},
	["luctieuphung1612"]={[1]={{nAwardID=3,nCount=2},{nAwardID=4,nCount=3},{nAwardID=5,nCount=1},},[2]={{nAwardID=6,nCount=50},},[3]={{nAwardID=6,nCount=24},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[8]={{nAwardID=9,nCount=8},},[9]={{nAwardID=10,nCount=16},},[10]={{nAwardID=11,nCount=16},},},
	["buihoaininh2000"]={[2]={{nAwardID=6,nCount=50},},[3]={{nAwardID=6,nCount=24},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[8]={{nAwardID=9,nCount=4},},[9]={{nAwardID=10,nCount=8},},[10]={{nAwardID=11,nCount=8},},},
	["quachvykhang"]={[2]={{nAwardID=6,nCount=50},},[3]={{nAwardID=6,nCount=24},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[8]={{nAwardID=9,nCount=4},},[9]={{nAwardID=10,nCount=8},},[10]={{nAwardID=11,nCount=8},},},
	["nguyentrungthe"]={[2]={{nAwardID=6,nCount=50},},[3]={{nAwardID=6,nCount=24},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[8]={{nAwardID=9,nCount=1},},[9]={{nAwardID=10,nCount=4},},[10]={{nAwardID=11,nCount=4},},},
	["anhhai3000"]={[2]={{nAwardID=6,nCount=50},},[3]={{nAwardID=6,nCount=24},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[8]={{nAwardID=9,nCount=1},},[9]={{nAwardID=10,nCount=4},},[10]={{nAwardID=11,nCount=4},},},
	["andyrockdick"]={[2]={{nAwardID=6,nCount=50},},[3]={{nAwardID=6,nCount=24},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[8]={{nAwardID=9,nCount=1},},[9]={{nAwardID=10,nCount=4},},[10]={{nAwardID=11,nCount=4},},},
	["pkqpnh"]={[2]={{nAwardID=6,nCount=50},},[3]={{nAwardID=6,nCount=24},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[8]={{nAwardID=9,nCount=1},},[9]={{nAwardID=10,nCount=4},},[10]={{nAwardID=11,nCount=4},},},
	["bilong0806"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=32},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["lxkhoi"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=32},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["haohantrolai"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=32},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["khoailactrangian"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=32},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["xuananh000"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=32},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["quyluxaphe"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=32},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["nhatduy03"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=32},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["hoadienvi"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=32},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["minhvcu"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=2},{nAwardID=5,nCount=2},},[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[6]={{nAwardID=8,nCount=32},},[8]={{nAwardID=9,nCount=8},},[9]={{nAwardID=10,nCount=16},},[10]={{nAwardID=11,nCount=16},},},
	["thuonghoai85"]={[1]={{nAwardID=1,nCount=4},},[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[6]={{nAwardID=8,nCount=32},},[8]={{nAwardID=9,nCount=4},},[9]={{nAwardID=10,nCount=8},},[10]={{nAwardID=11,nCount=8},},},
	["todababyosin"]={[1]={{nAwardID=1,nCount=4},},[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[6]={{nAwardID=8,nCount=16},},[8]={{nAwardID=9,nCount=1},},[9]={{nAwardID=10,nCount=4},},[10]={{nAwardID=11,nCount=4},},},
	["mercedesbmw"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[6]={{nAwardID=8,nCount=16},},[8]={{nAwardID=9,nCount=1},},[9]={{nAwardID=10,nCount=4},},[10]={{nAwardID=11,nCount=4},},},
	["wonderloveyou"]={[1]={{nAwardID=1,nCount=4},},[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["doremimi"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["nocrazy"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["voanhduy12345"]={[2]={{nAwardID=6,nCount=32},},[4]={{nAwardID=7,nCount=50},},[5]={{nAwardID=7,nCount=24},},[9]={{nAwardID=10,nCount=2},},[10]={{nAwardID=11,nCount=2},},},
	["leminhphuocpcccc"]={[2]={{nAwardID=6,nCount=16},},[4]={{nAwardID=7,nCount=32},},},
	["meomapluoibieng2"]={[1]={{nAwardID=1,nCount=4},},[2]={{nAwardID=6,nCount=16},},[4]={{nAwardID=7,nCount=32},},},
	["thachsung21"]={[2]={{nAwardID=6,nCount=16},},[4]={{nAwardID=7,nCount=32},},},
	["phuonghuynuisam"]={[2]={{nAwardID=6,nCount=16},},[4]={{nAwardID=7,nCount=32},},},
	["xinlola"]={[2]={{nAwardID=6,nCount=16},},[4]={{nAwardID=7,nCount=32},},},
	["mylosumy"]={[2]={{nAwardID=6,nCount=16},},[4]={{nAwardID=7,nCount=32},},},
	["vodang87pro"]={[2]={{nAwardID=6,nCount=16},},[4]={{nAwardID=7,nCount=32},},},
	["namthienvuong1223"]={[2]={{nAwardID=6,nCount=16},},[4]={{nAwardID=7,nCount=32},},},	
}
tbCurSeason.tbPrizeList = {
	[1] = {szName = "������Ӱ",
		[1] = {szName="[����] ��Ӱ��԰����", nQuality=1, tbProp={0, 536},nCount=1},
		[2] = {szName="[����] ��Ӱ��������", nQuality=1, tbProp={0, 537},nCount=1},
		[3] = {szName="[����] ��Ӱ��ޣ����", nQuality=1, tbProp={0, 538},nCount=1},
		[4] = {szName="[����] ��Ӱ������", nQuality=1, tbProp={0, 539},nCount=1},
	},
	[2] = {szName="�ɷ����� (�ػ�)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=259200,},
	[3] = {szName="�ɷ����� (���ʻ���ɱǹ)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200,},
	[4] = {szName="�ƽ�ӡ (ǿ��)",tbProp={0,3212},nCount=1,nQuality = 1,nExpiredTime=259200,},
	[5] = {szName="�ƽ�ӡ (����)",tbProp={0,3222},nCount=1,nQuality = 1,nExpiredTime=259200,},
	[6] = {szName="�������",tbProp={6,1,2105,1,0,0},nCount=1},
	[7] = {szName="���浤",tbProp={6,1,2264,1,0,0},nCount=1},
	[8] = {szName="�Ͻ��浤",tbProp={6,1,2263,1,0,0},tbParam={2000000000},nCount=1},
	[9] = {szName="����",tbProp={0,10,7,1,0,0},nCount=1},
	[10] = {szName="���-Ӣ��ս��",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=259200},
	[11] = {szName="�ƽ�֮�� (100)",tbProp={6,1,30095,1,0,0},nCount=1},

}
--tbCurSeason.tbFreeBagRequire = {
--	[1] = 0,
--	[2] = 	0,
--	[3] = 0,
--	[4] = 0,
--	[5] = 0,
--	[6] = 1,
--	[7] = 1,
--	[8] = 1,
--	[9] = 1, --fsda
--	[10] = 1,
--	[11] = 1,
--}
tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 4, nBit = 1},
	[2] = {nExtPoint = 4, nBit = 2},
	[3] = {nExtPoint = 4, nBit = 3},
	[4] = {nExtPoint = 4, nBit = 4},
	[5] = {nExtPoint = 4, nBit = 5},
	[6] = {nExtPoint = 4, nBit = 6},
	[7] = {nExtPoint = 4, nBit = 7},
	[8] = {nExtPoint = 4, nBit = 8},
	[9] = {nExtPoint = 4, nBit = 9},
	[10] = {nExtPoint = 4, nBit = 10},
}
tbCurSeason.tbLog = {"THDNB9", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end
