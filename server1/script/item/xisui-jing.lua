--Create by yfeng ,2004-3-9
--����֮�飬80���������ʹ��֮�󣬿��Ի��1��Ǳ��
--���ÿ��2�������Զ�һ��Ǳ�ܵ㣬������5��Ǳ�ܵ�
--����89���������ʹ�ÿ��Ի��5��Ǳ�ܵ�
--����Ʒͬһ���ֻ��ʹ��15��
--�������81��4λ��ʾʹ�ø���Ʒ�Ĵ���
function main(sel)
	times = mod(GetTask(81),16)
	point= {
		{pot=1,msg="һ��"},
		{pot=2,msg="����"},
		{pot=3,msg="һЩ"},
		{pot=4,msg="����"},
		{pot=5,msg="�Ķ�"}
	}
	str ={
		"��ѡ�ϴ�辭��������ȥ����Ȼû����:(",
		"��ѡ�ϴ�辭����������ϸ�Ķ����ƺ����%s���档",
		"��ѡ�ϴ�辭��������ȥ�������������档"
	}
	level = GetLevel()
	if(level < 80) then  --�ȼ�̫�ͣ�����ʹ��
		Msg2Player(str[1])
		return 1
	end
	if(times > 14) then --ʹ�ó�������
		Msg2Player(str[3])
		return 1
	end
	if(level > 89) then --���ȼ�����Ǳ��
		level = 89
	end
	index = floor((level -80)/2) +1
	AddProp(point[index].pot)
	SetTask(81,times+1)
	Msg2Player(format(str[2],point[index].msg))
	return 0
end

