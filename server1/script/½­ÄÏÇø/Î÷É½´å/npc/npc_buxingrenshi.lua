-- ��ɽ�� ������ʿ �Ի��ű�
-- ���� 2005-01-25

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\xishancun\\xishancun_head.lua")

COUNT_SHENMI_JUANZHOU = 100;

function main()
--	Uworld1064 = nt_getTask(1064) --��ɽ����ɽ������
--	
--	if ( GetLevel() >= 100) then
--	
--		if ( Uworld1064 == 0 ) then	-- ������ǰ�Ի�
--			Describe(DescLink_BuXingRenShi.."<#>���Ǻ�«���óԵ��Ǻ�«���������ֺóԵ��Ǻ�«������λ�͹٣����������������������ɽ����˰ɣ������Ǻ�«�ɣ�<enter>",
--			2,"������̽��ɽ�������/task002","���������Ǻ�«��/task001");
--		elseif ( Uworld1064 == 1 ) then	--�������Ի�
--			Describe(DescLink_BuXingRenShi..format("<#>��%d�����ؾ������Ѿ��ռ�������<enter>", COUNT_SHENMI_JUANZHOU),
--			2,"�����ؾ��ύ��������ʿ/task004","�һ��ǹ�������������/no")
--		elseif ( Uworld1064 >= 2 ) then  --�Ѿ��������
--			Say("������ʿ����ȥ��ɽ���һ��Ҫ��������ѽ��",0)
--		end;
--		
--	else
		Describe(DescLink_BuXingRenShi.."<#>: �Ǻ�«��������! ��λ�͹ٿ�������������������ɽ����˰ɣ������Ǻ�«�ɣ�<enter>",
		1,"���Ǻ�«/task001");
--	end

end;

function task001()
	local name = GetName()
	Talk(1,"",name..": ����Ǻ�«��ó�!")
end;
function task002()
	local name = GetName()
	Describe(DescLink_BuXingRenShi.."<#>:����������ʲô����<enter>"
				..name..format("<#>: ����˵�⸽������֪����ɽ����λ�á�����ָ����ȥ΢ɽ���ķ�����<enter>������ʿ���������Ǵ���ܶ��˶�֪���ģ�������������Ѿ����������ˡ����Ǽ�����ǰ�����ˣ�����Ҫ�ռ��� %������ͼ�����Ҳ������<enter>", COUNT_SHENMI_JUANZHOU),
				2,"�õģ�������ȥ��/task003","��û����Ȥ/no")
end;

function	task003()
	Uworld1064 = nt_getTask(1064)
	nt_setTask(1064,1)
end;

-- ���ؾ��ύ������
function	task004()
GiveItemUI( "����ͼ����", format("������ʿ����� %d������ͼ������Ŀո�ע�⣺����ŵĶ��ڻ�������%d������ͼ�ҽ�������.", COUNT_SHENMI_JUANZHOU,COUNT_SHENMI_JUANZHOU), "juanzhou", "no" );
end;

-- ȷ�����ؾ�����������
function juanzhou(ncount)
	Uworld1064 = nt_getTask(1064)
	local scrollarray = {}
	local scrollcount = 0
	local scrollidx = {}
	local y = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype ==196) then	
			y = y + 1
			scrollidx[y] = nItemIdx;
			scrollarray[i] = GetItemStackCount(nItemIdx)
			scrollcount = scrollcount + scrollarray[i]
		end
	end
	if (y ~= ncount) then
		Say("������ͼ����,���ټ�鿴��!", 2, "����ԭ���ǷŴ��ˣ������·�./task004", "�Ҽ�鿴��ô��/no")
		return
	end
	if (scrollcount > COUNT_SHENMI_JUANZHOU) then
		Say(format("��ֻҪ %d ������ͼ���㲻�ø�����ô.", COUNT_SHENMI_JUANZHOU), 2, "Ŷ��ԭ���ǷŴ��ˣ���������./task004", "�Ҽ�鿴������ô��/no")
		return
	end
	if (scrollcount < COUNT_SHENMI_JUANZHOU) then
		Say("����ҵ�������ͼ�������ټ�鿴��!", 2, "Ŷ��ԭ���ǷŴ��ˣ���������./task004", "�Ҽ�鿴������ô��/no")
		return
	end
	if (scrollcount == COUNT_SHENMI_JUANZHOU) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i])
		end
		nt_setTask(1064,2)
		task005()
	end;		
end;
	
function task005()
	local name = GetName()
	Describe(DescLink_BuXingRenShi..format("<#>: ���벻�����Ѿ��ռ��� %d ������ͼ����һֱ������о����Ѿͷ���.��ɽ��ʮ��Σ�գ��㲻ȥ�ȽϺ�<enter>",COUNT_SHENMI_JUANZHOU)
	..name..format("<#>:��ҪΪ�ҵ���, ���Ѿ��ҵ� %d ������ͼ��, �����ô��ɷ���ô���������һ��΢ɽ������ֻҪ��������ôȥ.<enter>������ʿ������������Ǵ����ɽ��С��(214, 195)Ȼ����������Ҹ�����ȥ�ģ����ͻ�֪����ô���ˡ���סҪǧ��С�� <enter>",COUNT_SHENMI_JUANZHOU),
	1,"�����Ի�/no")
	end;

function no()
end;
