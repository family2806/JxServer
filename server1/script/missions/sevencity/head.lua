SCRIPT_WARRIORDEATH = "\\script\\missions\\sevencity\\warrior_death.lua"	-- ��������ű�
SCRIPT_MONSTERDEATH	= "\\script\\missions\\sevencity\\monster_death.lua"	-- ���������ű�

FIELD_CHENGDU	= 926	-- Th�nh ��ս��
FIELD_BIANJING	= 927	-- Bi�n Kinhս��
FIELD_DALI		= 928	-- ��i L�ս��
FIELD_FENGXIANG	= 929	-- Ph��ng T��ngս��
FIELD_LINAN 	= 930	-- L�m Anս��
FIELD_XIANGYANG	= 931	-- T��ng D��ngս��
FIELD_YANGZHOU	= 932	--D��ng Ch�uս��

FIELD_LIST = {
	FIELD_CHENGDU,		-- Th�nh ��ս��
	FIELD_BIANJING,		-- Bi�n Kinhս��
	FIELD_DALI,			-- ��i L�ս��
	FIELD_FENGXIANG,	-- Ph��ng T��ngս��
	FIELD_LINAN,		-- L�m Anս��
	FIELD_XIANGYANG,	-- T��ng D��ngս��
	FIELD_YANGZHOU,		--D��ng Ch�uս��
}

BATTLE_LIST = {
	[11	] = FIELD_CHENGDU,		-- Th�nh ��ս��
	[37	] = FIELD_BIANJING,		-- Bi�n Kinhս��
	[162] = FIELD_DALI,			-- ��i L�ս��
	[1	] = FIELD_FENGXIANG,	-- Ph��ng T��ngս��
	[176] = FIELD_LINAN,		-- L�m Anս��
	[78	] = FIELD_XIANGYANG,	-- T��ng D��ngս��
	[80	] = FIELD_YANGZHOU,		--D��ng Ch�uս��
}

PARAM_LIST = {
	FIELD_TONGMEMBER 	= 100, 			-- ÿ������ÿ����������������
	WORLD_TONGMEMBER 	= 200,			-- ������սÿ����������������
	EXPTIMER_INTERVAL	= 1 * 60 * 18,	-- �����齱���ļ����֡����
	TIMEOUT_MONSTER		= 35 * 60 * 18,	-- �����޵�ʱ�䣨֡����
	TIMEOUT_SCORE		= 300 * 18,		-- �������ֽ���ʱ�䣨֡����
}

CAMP_MONSTER 				= 1
SIGNUP_MONEY 				= 20000000
SIGNUP_TIAOZHANLINGCOUNT	= 2000
TIMEAWARD_EXP				= 500000
TIMEAWARD_SCORE				= 1

MAP_INFO = {
	[FIELD_FENGXIANG] = {
		CityIndex = 1,
		CityName = "Ph��ng T��ng",
		Name = "Ph��ng T��ngս��",
		OutPos = {1, 1643, 3271},			-- ��ս��λ��
		MonsterPos = {56608, 112416},		-- ��������
		},
	[FIELD_CHENGDU	] = {
		CityIndex = 2,
		CityName = "Th�nh ��",
		Name = "Th�nh ��ս��",
		OutPos = {11, 3187, 5183},			-- ��ս��λ��
		MonsterPos = {54976, 105600},		-- ��������
		},
	[FIELD_DALI		] = {
		CityIndex = 3,
		CityName = "��i L�",
		Name = "��i L�ս��",
		OutPos = {162, 1681, 3277},			-- ��ս��λ��
		MonsterPos = {55040, 105568},		-- ��������
		},
	[FIELD_BIANJING	] = {
		CityIndex = 4,
		CityName = "Bi�n Kinh",
		Name = "Bi�n Kinhս��",
		OutPos = {37, 1693, 3213},			-- ��ս��λ��
		MonsterPos = {56192, 108384},		-- ��������
		},
	[FIELD_XIANGYANG] = {
		CityIndex = 5,
		CityName = "T��ng D��ng",
		Name = "T��ng D��ngս��",
		OutPos = {78, 1583, 3381},			-- ��ս��λ��
		MonsterPos = {54944, 105568},		-- ��������
		},
	[FIELD_YANGZHOU	] = {
		CityIndex = 6,
		CityName = "D��ng Ch�u",
		Name = "D��ng Ch�uս��",
		OutPos = {80, 1693, 3219},			-- ��ս��λ��
		MonsterPos = {55008, 105568},		-- ��������
		},
	[FIELD_LINAN	]= {
		CityIndex = 7,
		CityName = "L�m An",
		Name = "L�m Anս��",
		OutPos = {176, 1690, 3290},			-- ��ս��λ��
		MonsterPos = {56160, 108512},		-- ��������
		},
}
