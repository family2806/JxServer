-- ��ɽ ���� ����NPC
-- By��Dan_Deng(2003-09-23)
--edit by С�˶��(2007-09-14)
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
function about_tong()
	Talk(6,"","�����ʽ��������ʲô���������������Ľ�������!","����������Ѿ���ʦ������������������㲻�������κΰ���У��ٴ���Ҫ����һ���Ľ���������������ͳ��������С��30��!","�ﵽ����ЩҪ�����ֻҪ���ν�ս���ϻ��һ���������Դ���Ϊ��������Ϳ����ˡ�����㽨���İ������㹻�����֧�֣���������ܳ�Ϊ��ʽ��������","������Ҫ����������3��֮������Ҫ�ҵ�16������־Ȥ��Ͷ���˼��룬��������Ļ���ûû�б�İ취�ˣ���3����Խ���������'.","����İ����16��֮�󽭺�����㿼�飬���3��֮�󲻹�16�˽����Ͳ�������İ��","��󣬽������Ҫ�д����ʽ�Ŭ���ﵽĿ���!")
end

function main(sel)
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("��������İ�ᣬ��ʼ������ҵ!",2,"��ʼ����/Direct_CreateTong","��һ��/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 1) and (GetReputeLevel(GetRepute()) >= 1) and (GetLeadLevel() >= 1) and (HaveItem(195) == 1) then
		Talk(4,"create_pay","��ң���ɽ�����ˣ�������Ҫ������������һ����Ϊ�������ɳ�Ϊһ�������أ�","��ɽ�����ˣ�������Ҫȷ���Լ�ӵ����Ӧ��������Ȼ���ҳ�һ���ر����Ʒ��Ϊ�����������˵��ս���Ϸ���ɱ�п��Եõ�������","��ң�������������˵��ѽ���","��ɽ�����ˣ�ԭ�����Ѿ�ӵ�����ˡ�������Ȼ������Ϊ��")
	else				-- �˲���Ϊȱʡ�Ի��������䡣
		Say("<#>����ʲô����?",
			2,
			"<#>�˽⽨�﷽��!/about_tong",
--			"<#>��ȡ������ά��/talk_citytong_award",
			"<#>û��ʲô/nothing")
--		i = random(0,1)
--		if (i == 0) then
--			Talk(1,"","��ɽ�����ˣ�����뽨���Լ��İ�ᣬ��ҪΪ����������ʱ�侫������Ѫ���в��ɰ�;���ϡ�")
--		else
--			Talk(4,"","��ɽ�����ˣ����ʽ��������ʲô���������������Ľ���������","��ɽ�����ˣ�����������Ѿ���ʦ������������������㲻�������κΰ���У��ٴ���Ҫ����һ���Ľ���������������ͳ��������С��30����","��ɽ�����ˣ��ﵽ����ЩҪ�����ֻҪ��ս���ϻ��һ���������Դ���Ϊ��������Ϳ����ˡ�����㽨���İ������㹻�����֧�֣���������ܳ�Ϊ��ʽ����������","��ɽ�����ˣ���󣬿�������õ�������������Ҫ�����ʽ��������Ŀ��Ŭ���ɣ������ˣ�")
--			Talk(6,"","��ɽ�����ˣ����ʽ��������ʲô���������������Ľ���������","��ɽ�����ˣ�����������Ѿ���ʦ������������������㲻�������κΰ���У��ٴ���Ҫ����һ���Ľ���������������ͳ��������С��30����","��ɽ�����ˣ��ﵽ����ЩҪ�����ֻҪ��ս���ϻ��һ���������Դ���Ϊ��������Ϳ����˽�������ˡ�","��ɽ�����ˣ�������Ҫע����ǣ���Ҫȷ���Լ�ӵ����Ӧ��Ӱ�������쵼�������������3�����ҵ�����16��־ͬ����֮����֧���㣬������Ҳ�޷�������������ͨ����֮Ϊ�������ڡ���","��ɽ�����ˣ������κ�ʱ�������İ����������16�˵Ļ�����������������İ�����½��п��飬����������ڲ��ָܻ���16�����ϣ�����ͬ����Ȼ���������İ�ᡣ","��ɽ�����ˣ���󣬿�������õ�������������Ҫ�����ʽ��������Ŀ��Ŭ���ɣ������ˣ�")
--		end
	end
end

function create_pay()
	Say("��ɽ�����ˣ���ô����ֻҪ���㹻���ʽ��ð����ܹ���ת�����Ϳ����ˣ�����˵�и�100�������Ӱɡ�",2,"û���⣬���Ѿ���100����������/create_pay_yes","̫��Ǯ�ˣ���һ���в���/create_pay_no")
end

function create_pay_yes()
	if (GetCash() >= 1000000) then
		Pay(1000000)				-- �շ�
		DelItem(195)			-- ɾ����ص���
		SetTask(99,1)				-- �����ϱ�ǣ�ͬʱ����Ϊ�����еĵ�һ���ˣ����������ˣ���
		Direct_CreateTong()		-- ��ʼ����
	else
		Talk(1,"","��ɽ�����ˣ����ƺ���û����ô��Ǯ���������ǲ��еġ����������㹻�ľ����������������Ұɡ�")
	end
end

function create_pay_no()
	Talk(1,"","��ɽ�����ˣ���ά�ְ������������������Ǻܷ�Ǯ�ģ��������Ҳ�ּۻ��ۣ����Ϸ��������ǲ�Ҫ����ĺá�")
end

function Direct_CreateTong()
	CreateTong(1)				-- ��������Ի��򣬽����ű�����
end

function wait_a_moment()
end

--�õ�һ��������ڰ��ռ��ĳ���,��������ֵ
function gettongownercity()
	--�õ���Ұ������
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--�ֱ�õ��ߴ���еİ����������Ұ�����ƶԱ�
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "" and strCityTongName == strTongName) then 
			return nCityID
		end
	end
	
	--��ʾ������ڵİ��û��ռ�����
	return 0
end

-- ����콱����
function check_award_condition(city_index, show_talk)
	if (city_index == 0) then
		if (show_talk == 1) then
			Talk(1, "", "<#>ֻ��ռ���˳��еİ��ɲ����콱�����Լ����ֵ�ȥռ��һ���ǰ�!")
		end
		return 0
	end
	
	local tong_master = GetTongMaster()
	local player_name = GetName()
	if (tong_master ~= player_name) then
		if (show_talk == 1) then
			Talk(1, "", "<#>ֻ�а����ſ�����ȡ���ɽ������а�������")
		end
		return 0
	end
	
	local wday = tonumber(date("%w"))	-- ���������ڼ���
	local hour = tonumber(date("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#>ֻ��ÿ��һ9:00~20:00�����콱ʱ�䣬��ʱ������")
		end
		return 0
	end

	local date = tonumber(date("%Y%m%d"))
	if (date == get_citybonus_date(city_index)) then
		if (show_talk == 1) then
			Talk(1, "", "<#>���ܵĽ�Ʒ�Ѿ����ˣ����������ɡ�")
		end
		return 0
	end

	return 1
end

-- ��ȡ������ά��
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#>��ȡ������ά��",
			2,
			"<#>������60��/#take_tong_award(60)",
			"<#>����ʱ����/nothing")
	end
end

-- ��ȡ���
function take_tong_award(count)
	-- һ�����ռһ������
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#>��ı������ˣ�����֮�����콱.")
		return
	end
	
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local today = tonumber(date("%Y%m%d"))
	set_citybonus_date(city_index, today)
	-- �����
	for i = 1, count do
		AddItem(6,1,1535,1,1,1)
	end
	local msg =	date("[%y-%m-%d %H:%M] ") .. GetAccount() .. "(".. GetName().. ") get " .. count .. " <#>���� from ��ɽ������"
	WriteLog(msg);
	Talk(1, "", "<#> �������ǵĽ�Ʒ����ȥ��")
end
