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
	if ( Uworld183 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj075.spr>�������<link><enter>���壺"..name.."���ҹ����ѣ����������������ʱ�������ʱ�򶼻����ɼ����Һܸ�����һֱ��������ֱ���ˣ����Ը�����һ�����ܣ�Ҳ�����ܰﵽ�㡣��֪�Ӻ�ʱ�𣬽����Ĳ�ͬ��Ӫ���Ȼ������������Ϣ����Ⱥ�����Եı������Ÿ�Ϊ�Ӵ����֯���в��ݡ��Ҳ�֪�������Ƿ���ţ������������и������м���ʵ���Ӵ����֯ȴ���ҿ��Կ϶��ġ���˵�����֯�����ֽ����ֿ�ջ�����룬������ʱ�ܽ�������һ����֯�������ǰ�̻���ã�Ҳ����ȥ��಻��Ҫ���鷳�������ȥ������һ����Ī���Ů�ӣ�����������ָ������в���������ǰ�����ң�ԭ���Ժ���֪���Ҵ����ԣ��Դ��ձʣ�ңף��Ը��ɡ����塣",1,"�����ź�/no")
		nt_setTask(183,30)
		if ( Uworld1001 < 10 ) then
	  		nt_setTask(1001,10) --��������ʼ
	  	end
	end
	return 0
end
	
