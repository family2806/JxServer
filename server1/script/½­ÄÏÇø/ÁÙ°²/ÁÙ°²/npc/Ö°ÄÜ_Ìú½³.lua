-- �ٰ���ְ�ܡ�����
-- by��Dan_Deng(2003-09-16)
--update:zhaowenyi(2005-02-20)������ɫ���ƽ�װ������

Include("\\script\\global\\global_tiejiang.lua")


TIEJIANG_DIALOG = "<dec><npc>����������Ǵ����游��һ���������ģ��Ѿ���Щ��ͷ�ˣ������ٰ�����Ҳ���б���������Ҫ���ʲôѽ��";
function main()
	tiejiang_city(TIEJIANG_DIALOG);
end;


function yes()
	Sale(1);  				--�������׿�
end;

