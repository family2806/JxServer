-- ����ְ�ܡ��販ʿ
-- by��Dan_Deng(2003-09-16)

-- ���������ͬ���������ʵ�崦���ļ�
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

function main()
	
	-- ������֮�ص�������
	if taskProcess_002_02:doTaskEntity()~=0 then return end;
	if taskProcess_002_11:doTaskEntity()~=0 then return end;
	
	Talk(3,"","���ǵĲ�������������ģ����Ǵ�������Ĳ����Ĺ��Ӳ衣","�Ĺ��Ӳ����β�һ�����������һ��С�����¿�һ��.","�����ƣ��Ĺز裬�ӽ�ˮ���Ĺز�һ��Ҫ�ý�ˮ�ݲŶԡ�����������ٻ�ɫ��ζ����Ũ���Ǽ�Ʒ��.")
end;
