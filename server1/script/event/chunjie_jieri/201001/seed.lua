Include("\\script\\event\\chunjie_jieri\\201001\\plant.lua")

TIME_START1	= 1200
TIME_END1	= 1500
TIME_START2	= 1900
TIME_END2	= 2200

DATE_START	= 100204	-- ���ʼ����
DATE_END	= 100329	-- ���������

function check_time(curr_date, curr_time)
	if (curr_date < DATE_START) then
		Say("����÷�����û��ʼ.")
		return 0
	elseif (curr_date >= DATE_END) then
		Say("����÷����Ѿ�������.")
		return 0
	elseif (curr_time >= TIME_START1 and curr_time < TIME_END1) then
		return 1
	elseif (curr_time >= TIME_START2 and curr_time < TIME_END2) then
		return 1
	else
		Say("����÷���Ļʱ����ÿ��12:00-15:00��19:00-22:00")
		return 0
	end
end

function plant_tree()
	if (tbSeed:Check() == 0) then
		return 0
	end
	local kind = tbSeed:RandomKind()
	if (tbSeed:Grow(kind) == 1) then
		return 1
	else
		WriteLog(format("[EVENT201001 ERROR]%s failed to plant wintersweet tree", GetName()))
		return 0
	end
end

function main()
	local curr_date = tonumber(GetLocalDate("%y%m%d"))
	local curr_time = tonumber(GetLocalDate("%H%M"))
	if (check_time(curr_date, curr_time) == 1 and plant_tree() == 1) then
		return 0
	else
		return 1
	end
end
