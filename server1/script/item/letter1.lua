--�����ڵ��ż���������ϵͳ����İ���������
--by xiaoyang(2004\12\25)

Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
local curCamp = nt_getCamp()
	Uworld1001 = nt_getTask(1001)  --����
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld183 = nt_getTask(183)
	Uworld186 = nt_getTask(186)
	Uworld189 = nt_getTask(189)
	local name = GetName()
	if ( Uworld186 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj090.spr>�������<link><enter>���壺"..name.."����������ᣬ�ڽ���һ��ȴ����ͨ͸�������籾����а���֣��ƶ�Ī�硣�뿪�����Ϊ�˴��¶�������ʱ���ƣ���ܿ࣬·����ѣ�����Ҫ���ĺܶ࣬�ֲ��ࡣ��ĳҲ��֪���������һ��֮����ֻ�ܽ�����������һ���һ������͸¶���㣬��������Ӫ�ı�����һ��ǿ���ɱ����֯�������֯�ж��ٸ��֣�ʵ���ж�����û�������ֻ֪����ʮ�������γ�ͨ�еĴ󽫣�������������֣����ֳ����Ĵ������ű�ɱ�����������֯��ء������֯�����ֽС�����Ԩ�¡���ȥ�꾩���ҵ�����һ���и��ϱ������ˣ����Իᰲ�š���ֹ�ڴˣ�ϣ�������Ϊ֮�����ء����塣",1,"�����ź�/no")
		nt_setTask(186,30)
		if ( Uworld1002 < 10 ) then
			nt_setTask(1002,10) --��������ʼ
		end
	end
	return 0
end
	
