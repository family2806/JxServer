-- ��ɽ ���� ����NPC
-- By��Dan_Deng(2003-09-23)
--edit by С�˶��(2007-09-14)
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
function about_tong()
	Talk(6,"","Ng��i h�i th�nh l�p bang h�i c� �i�u ki�n g� , ta t� t� n�i cho ng��i nghe !","��u ti�n ng��i nh�t ��nh ph�i xu�t s� ��c l�p x�ng x�o giang h�, ti�p theo ng��i kh�ng th� � b�t k� bang h�i n�o, danh v�ng tr�n 450 v� t�i l�i ��o tr�n 30","Mu�n c� Nh�c V��ng Ki�m ng��i c� th� mua Nh�c V��ng Ki�m L� Bao � k� tr�n c�c ho�c tham gia chi�n tr��ng t�ng kim c� c� h�i nh�n ���c","Sau khi th�nh l�p bang h�i c� 3 ng�y th� th�ch, ng��i ph�i chi�u h� ���c �t nh�t 16 ng��i v�o bang","N�u sau 3 h�m bang h�i kh�ng �� 16 ng��i, bang s� t� ��ng b� gi�i t�n","Cu�i c�ng , th�nh l�p bang h�i c�n ph�i c� 100 v�n l��ng ")
end

function main(sel)
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("Tung ho�nh giang h� ph�i l�p bang m�i n�n ch� l�n!",2,"B�t ��u l�p bang /Direct_CreateTong","Ch� m�t ch�t /wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 1) and (GetReputeLevel(GetRepute()) >= 1) and (GetLeadLevel() >= 1) and (HaveItem(195) == 1) then
		Talk(4,"create_pay","Nh� ch�i # kim s�n ch��ng m�n nh�n , xin h�i ta mu�n nh� th� n�o m�i c� th� gi�ng ng��i m�t d�ng tr� th�nh khai t�ng l�p ph�i tr� th�nh m�t gi�p t�ng ch� ��y ? ","Kim s�n ch��ng m�n nh�n # ��u ti�n ng��i mu�n tin ch�c m�nh c� t��ng �ng n�ng l�c , sau �� t�m ra m�t d�ng ��c bi�t v�t ph�m l�m bang ch� t�n v�t , n�i th� d� nh� � tr�n chi�n tr��ng ph�n d�ng gi�t ��ch c� th� l�y ���c nh�c v��ng ki�m ","Nh� ch�i # nh�c v��ng ki�m ? ng��i n�i l� thanh ki�m n�y sao ? ","Kim s�n ch��ng m�n nh�n # th� ra l� ng��i �� c� n� . kh�ng t� , qu� nhi�n tu�i tr� t�i cao . ")
	else				-- �˲���Ϊȱʡ�Ի��������䡣
		Say("<#> ng��i c� chuy�n g� kh�ng ?",
			2,
			"<#> hi�u r� d�ng bang ph��ng ph�p !/about_tong",
--			"<#> nh�n l�y th�nh ch� bang h�i t��ng th��ng /talk_citytong_award",
			"<#> kh�ng c� g� /nothing")
--		i = random(0,1)
--		if (i == 0) then
--			Talk(1,"","Kim s�n ch��ng m�n nh�n # n�u nh� mu�n th�nh l�p m�nh bang h�i , s� v� n� b� ra ��i l��ng th�i gian tinh l�c c�ng t�m huy�t , thi�t kh�ng th� n�a ���ng h�y b� . ")
--		else
--			Talk(4,"","Kim s�n ch��ng m�n nh�n # ng��i h�i th�nh l�p bang h�i c� �i�u ki�n g� , ta t�i t� t� n�i cho ng��i nghe . ","Kim s�n ch��ng m�n nh�n # ��u ti�n ng��i nh�t ��nh ph�i �� xu�t s� ��c l�p x�ng x�o giang h� # ti�p theo ng��i kh�ng th� � b�t k� bang h�i trung # l�n n�a ng��i mu�n c� c� nh�t ��nh giang h� danh v�ng # cu�i c�ng ng��i th�ng su�t l�c kh�ng th� nh� v�i 30 c�p . ","Kim s�n ch��ng m�n nh�n # ��t t�i nh�ng th� n�y y�u c�u sau ng��i ch� c�n t� tr�n chi�n tr��ng ��t ���c m�t thanh nh�c v��ng ki�m l�y n�y l�m bang ch� t�n v�t l� ���c r�i . n�u nh� ng��i th�nh l�p ��ch bang ph�i c� ��y �� nhi�u ng��i �ng h� , c�i n�y bang h�i l� c� th� tr� th�nh ch�nh th�c bang h�i m� v�n h�nh . ","Kim s�n ch��ng m�n nh�n # cu�i c�ng , c� th� t��ng t��ng ���c bang ph�i v�n h�nh c�n c�n ��i l��ng ti�n b�c , h��ng m�c ti�u c�a ng��i c� g�ng l�n , ng��i tu�i tr� #")
--			Talk(6,"","Kim s�n ch��ng m�n nh�n # ng��i h�i th�nh l�p bang h�i c� �i�u ki�n g� , ta t�i t� t� n�i cho ng��i nghe . ","Kim s�n ch��ng m�n nh�n # ��u ti�n ng��i nh�t ��nh ph�i �� xu�t s� ��c l�p x�ng x�o giang h� # ti�p theo ng��i kh�ng th� � b�t k� bang h�i trung # l�n n�a ng��i mu�n c� c� nh�t ��nh giang h� danh v�ng # cu�i c�ng ng��i th�ng su�t l�c kh�ng th� nh� v�i 30 c�p . ","Kim s�n ch��ng m�n nh�n # ��t t�i nh�ng th� n�y y�u c�u sau ng��i ch� c�n t� tr�n chi�n tr��ng ��t ���c m�t thanh nh�c v��ng ki�m l�y n�y l�m bang ch� t�n v�t l� ���c r�i th�nh l�p bang h�i li�u . ","Kim s�n ch��ng m�n nh�n # b�t qu� c�n ph�i ch� � l� , ng��i mu�n tin ch�c m�nh c� t��ng �ng �nh h��ng l�c c�ng n�ng l�c l�nh ��o , ng��i nh�t ��nh ph�i � 3 ng�y b�n trong t�m ���c �t nh�t 16 t�n ch� ��ng ��o h�p ng��i t�i �ng h� ng��i , n�u kh�ng bang h�i c�ng kh�ng c�ch n�o th�nh l�p , ba ng�y nay b�nh th��ng x�ng l� � kh�o nghi�m k� � . ","Kim s�n ch��ng m�n nh�n # h�n n�a b�t c� l�c n�o n�u nh� ng��i bang h�i nh�n s� �t v�i 16 ng��i tho�i , giang h� s� l�p t�c �em ng��i bang h�i l�n n�a ti�n h�nh kh�o nghi�m , n�u nh� � trong v�ng ba ng�y kh�ng th� kh�i ph�c l�i 16 ng��i tr� l�n , giang h� ��ng ��o v�n s� kh�ng th�a nh�n ng��i bang h�i . ","Kim s�n ch��ng m�n nh�n # cu�i c�ng , c� th� t��ng t��ng ���c bang ph�i v�n h�nh c�n c�n ��i l��ng ti�n b�c , h��ng m�c ti�u c�a ng��i c� g�ng l�n , ng��i tu�i tr� #")
--		end
	end
end

function create_pay()
	Say("Kim s�n ch��ng m�n nh�n # nh� v�y , ng��i ch� c�n c� ��y �� ti�n b�c �� cho bang ph�i c� th� v�n chuy�n l�n l� ���c r�i , n�i th� d� nh� c� c� 100 v�n l��ng b�c �i . ",2,"Kh�ng th�nh v�n �� , ta �� c� 100 v�n l��ng b�c /create_pay_yes","Qu� ph� ti�n , �t m�t ch�t c� ���c hay kh�ng /create_pay_no")
end

function create_pay_yes()
	if (GetCash() >= 1000000) then
		Pay(1000000)				-- �շ�
		DelItem(195)			-- ɾ����ص���
		SetTask(99,1)				-- �����ϱ�ǣ�ͬʱ����Ϊ�����еĵ�һ���ˣ����������ˣ���
		Direct_CreateTong()		-- ��ʼ����
	else
		Talk(1,"","Kim s�n ch��ng m�n nh�n # ng��i t�a h� c�ng kh�ng c� nhi�u ti�n nh� v�y a , nh� v�y l� kh�ng ���c . ch� ng��i c� ��y �� kinh t� n�ng l�c t�i t�m ta n�a �i . ")
	end
end

function create_pay_no()
	Talk(1,"","Kim s�n ch��ng m�n nh�n # � duy tr� bang h�i ��ch b�nh th��ng v�n h�nh v�n ch�nh l� r�t ph� ti�n , n�u nh� ng��i �i�u n�y c�ng th�o gi�i ho�n gi�i , theo l�o phu th�y c�n ch�a ph�i mu�n d�ng bang ��ch h�o . ")
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
			Talk(1, "", "<#> ch� c� chi�m l�nh th�nh ph� ��ch bang ph�i m�i c� th� d�n t��ng , d�n huynh �� c�a m�nh �i chi�m l�nh m�t t�a th�nh �i !")
		end
		return 0
	end
	
	local tong_master = GetTongMaster()
	local player_name = GetName()
	if (tong_master ~= player_name) then
		if (show_talk == 1) then
			Talk(1, "", "<#> ch� c� bang ch� m�i c� th� nh�n l�y bang ph�i t��ng th��ng , g�i bang ch� t�i ��y ")
		end
		return 0
	end
	
	local wday = tonumber(date("%w"))	-- ���������ڼ���
	local hour = tonumber(date("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#> ch� c� m�i tu�n m�t 9:00~20:00 m�i l� d�n t��ng th�i gian , ��n l�c �� tr� l�i �i ")
		end
		return 0
	end

	local date = tonumber(date("%Y%m%d"))
	if (date == get_citybonus_date(city_index)) then
		if (show_talk == 1) then
			Talk(1, "", "<#> tu�n n�y ��ch ph�n th��ng �� l�nh , cu�i tu�n tr� l�i �i . ")
		end
		return 0
	end

	return 1
end

-- ��ȡ������ά��
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#> nh�n l�y th�nh ch� bang h�i t��ng th��ng ",
			2,
			"<#> ta mu�n d�n 60 c� /#take_tong_award(60)",
			"<#> ta t�m th�i kh�ng d�n /nothing")
	end
end

-- ��ȡ���
function take_tong_award(count)
	-- һ�����ռһ������
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#> l�ng c�a ng��i t�i ��y , s�a sang l�i sau n�a d�n t��ng .")
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
	local msg =	date("[%y-%m-%d %H:%M] ") .. GetAccount() .. "(".. GetName().. ") get " .. count .. " <#> ��i bao ti�n l� x� from kim s�n ch��ng m�n nh�n "
	WriteLog(msg);
	Talk(1, "", "<#> ��y l� ng��i c�a ��ch ph�n th��ng , c�m �i �i ")
end
