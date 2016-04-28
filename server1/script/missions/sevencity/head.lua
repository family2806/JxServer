SCRIPT_WARRIORDEATH = "\\script\\missions\\sevencity\\warrior_death.lua"	-- ��������ű�
SCRIPT_MONSTERDEATH	= "\\script\\missions\\sevencity\\monster_death.lua"	-- ���������ű�

FIELD_CHENGDU	= 926	-- Chi�n tr��ng Th�nh ��
FIELD_BIANJING	= 927	-- Chi�n tr��ng Bi�n Kinh
FIELD_DALI		= 928	-- Chi�n tr��ng ��i L�
FIELD_FENGXIANG	= 929	-- Chi�n tr��ng Ph��ng T��ng
FIELD_LINAN 	= 930	-- Chi�n tr��ng L�m An
FIELD_XIANGYANG	= 931	-- Chi�n tr��ng T��ng D��ng
FIELD_YANGZHOU	= 932	--Chi�n tr��ng D��ng Ch�u

FIELD_LIST = {
	FIELD_CHENGDU,		-- Chi�n tr��ng Th�nh ��
	FIELD_BIANJING,		-- Chi�n tr��ng Bi�n Kinh
	FIELD_DALI,			-- Chi�n tr��ng ��i L�
	FIELD_FENGXIANG,	-- Chi�n tr��ng Ph��ng T��ng
	FIELD_LINAN,		-- Chi�n tr��ng L�m An
	FIELD_XIANGYANG,	-- Chi�n tr��ng T��ng D��ng
	FIELD_YANGZHOU,		--Chi�n tr��ng D��ng Ch�u
}

BATTLE_LIST = {
	[11	] = FIELD_CHENGDU,		-- Chi�n tr��ng Th�nh ��
	[37	] = FIELD_BIANJING,		-- Chi�n tr��ng Bi�n Kinh
	[162] = FIELD_DALI,			-- Chi�n tr��ng ��i L�
	[1	] = FIELD_FENGXIANG,	-- Chi�n tr��ng Ph��ng T��ng
	[176] = FIELD_LINAN,		-- Chi�n tr��ng L�m An
	[78	] = FIELD_XIANGYANG,	-- Chi�n tr��ng T��ng D��ng
	[80	] = FIELD_YANGZHOU,		--Chi�n tr��ng D��ng Ch�u
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
		Name = "Chi�n tr��ng Ph��ng T��ng",
		OutPos = {1, 1643, 3271},			-- ��ս��λ��
		MonsterPos = {56608, 112416},		-- ��������
		},
	[FIELD_CHENGDU	] = {
		CityIndex = 2,
		CityName = "Th�nh ��",
		Name = "Chi�n tr��ng Th�nh ��",
		OutPos = {11, 3187, 5183},			-- ��ս��λ��
		MonsterPos = {54976, 105600},		-- ��������
		},
	[FIELD_DALI		] = {
		CityIndex = 3,
		CityName = "��i L�",
		Name = "Chi�n tr��ng ��i L�",
		OutPos = {162, 1681, 3277},			-- ��ս��λ��
		MonsterPos = {55040, 105568},		-- ��������
		},
	[FIELD_BIANJING	] = {
		CityIndex = 4,
		CityName = "Bi�n Kinh",
		Name = "Chi�n tr��ng Bi�n Kinh",
		OutPos = {37, 1693, 3213},			-- ��ս��λ��
		MonsterPos = {56192, 108384},		-- ��������
		},
	[FIELD_XIANGYANG] = {
		CityIndex = 5,
		CityName = "T��ng D��ng",
		Name = "Chi�n tr��ng T��ng D��ng",
		OutPos = {78, 1583, 3381},			-- ��ս��λ��
		MonsterPos = {54944, 105568},		-- ��������
		},
	[FIELD_YANGZHOU	] = {
		CityIndex = 6,
		CityName = "D��ng Ch�u",
		Name = "Chi�n tr��ng D��ng Ch�u",
		OutPos = {80, 1693, 3219},			-- ��ս��λ��
		MonsterPos = {55008, 105568},		-- ��������
		},
	[FIELD_LINAN	]= {
		CityIndex = 7,
		CityName = "L�m An",
		Name = "Chi�n tr��ng L�m An",
		OutPos = {176, 1690, 3290},			-- ��ս��λ��
		MonsterPos = {56160, 108512},		-- ��������
		},
}
