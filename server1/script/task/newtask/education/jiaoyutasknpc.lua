-- ������ϵͳ
-- BY:XIAOYANG(2004-11-29)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
-----------------------------------���ִ���ʦ-----------------------------
function education_wushi()
	Uworld1000 = nt_getTask(1000)      -- ������ϵͳ
	Uworld1065 = nt_getTask(1065)      -- ��¼���������ı���
	local name = GetName()  
	if ( Uworld1000 == 10 ) and ( Uworld1065 >= 3 ) then   
		Talk(1,"Uworld1000_end1",name.."<#>��ʦ�������������������㡣���Ǹ����ӵ����⡣")
	elseif (( Uworld1000 == 20 ) or ( Uworld1000 == 30 )) then  
		Talk(1,"Uworld1000_end1",name.."<#>��ʦ�������������������㡣���Ǹ����ӵ����⡣")
	elseif (( Uworld1000 == 10 ) or ( Uworld1000 == 20 ) or ( Uworld1000 == 30 )) and ( Uworld1065 < 3 ) then 
		Talk(1,"","��ʦ���������ⶼ������������̫û��˼�˰ɡ�������������")
	elseif ( Uworld1000 == 180 ) and ( Uworld1065 < 5 ) then
		Talk(1,"","զ�������Ǹ��Ҵ����������������������")
	elseif ( Uworld1000 == 180) or ( Uworld1000 == 190 ) then
		if ( Uworld1000 == 180 and Uworld1065 >= 5 ) then
			Uworld1065 = Uworld1065 - 5
			nt_setTask(1065,Uworld1065)
		elseif ( Uworld1000 == 180 ) then
			Talk(1,"no","զ�������Ǹ��Ҵ����������������������")
		end
			nt_setTask(1000,190) --����10start
			Talk(10,"Uworld1000_good4",
			name.."<#>��ʦ����","��ʦ�����򲻸ҵ�������ƽ���۽���զ���������������Ǻǣ��ã�",name.."<#>������ʵ���������ߡ�","��ʦ�����������⣬���⡣",name.."<#>��ʦ�������ں���˵���ء�","��ʦ����������ͷ��Ϊ�˹�ֱ����ʵ��Ϊ��á�û���ϸ��ѵ�����������������Ŀ찡��",name.."<#>������˵��Ҳ̫���ˡ�","��ʦ�������ˣ��������̣�ֻ��ĥ������ղ����Ķ�������������ɴ��¡�",name.."<#>��Ŷ��ԭ����ˡ�","��ʦ�������£��ڴ��������ô�����ȻҲ���ˡ��벻�뽻�������ѣ�",name.."<#>����㡣","��ʦ����F6�򿪺��ѽ��棬����·��Ĳ��Ұ�ť���Ϳ������������ѡ�񣬻����Լ���ȷ��λ����Ȼ��Ҳ���԰�סctrl������Ҽ����Է����ϣ��ڵ����˵���ѡ�����ѡ�")
	else 
		Talk(1,"","���ϴ������ˣ���Ҫ���������ǲ�ϰ�ߡ�")
	end
end

-----------------------------------�ӻ����ϰ�-----------------------------
function zboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
		if ( Uworld1000 == 120 ) or ( Uworld1000 == 130 ) then
			nt_setTask(1000,130) --����7start
			Describe(DescLink_ZaHuoPu.."<#>�������ˣ���������ʲô����<enter>"
			..name.."<#>������������������ѧ�㶫����<enter>�ӻ����ϰ壺�Ǻǣ��Ǹ����ˣ��ִ�С���ѹ������ҡ���������ʲô�����ɽ̸��㰡��<enter>"
			..name.."<#>����̫�����ˡ�<enter>�ӻ����ϰ壺��˵���������Ժ����߽��������ܻ��������ڡ�����������Ĵ��š�<enter>"
			..name.."<#>�����������<enter>�ӻ����ϰ壺��������һ���س��ʵ������߹���������Ŀ��ף���˵���������ž޴����ܡ�<enter>"
			..name.."<#>��Ŷ��<enter>�ӻ����ϰ壺������Ҳ�������Ŷ�����ˣ���������Щ�سǷ�����������Ұ����սʱ��һ��ƣ���˿���ʹ�����ص����л��������<enter>"
			..name.."<#>���������ĺö�����<enter>�ӻ����ϰ壺�ǰ��������������ţ�������Ь��һ˫�������Ǹ������ֵ�˵��С���ˡ�<enter>"
			..name.."<#>��˭�������������죿<enter>�ӻ����ϰ壺�Ǻǣ�С���������Ŷ��",
			2,"��Ҫ�������������ͼֽ/Uworld1000_tianhuanglongqi","�����Ի�/Uworld1000_high7")
		else 
			Talk(1,"","�ӻ����ϰ壺��ȥ����ʲô���������ڼ���ʵ�����á�")
		end
end

------------------------------------ҩ���ϰ�----------------------------------
function yboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 80 ) or ( Uworld1000 == 90 ) then
		nt_setTask(1000,90) --����5start
		Talk(9,"Uworld1000_high5","ҩ���ϰ壺���˺ð�����Ҫ��ʲô��",name.."<#>��������ûʲôǮ��������������������ġ�","ҩ���ϰ壺Ŷ����ү�������ġ������������ˡ���ʵҲûʲô�ɽ̵ģ��������ҩƷ�Ա���ʱ֮��ɡ�",name.."<#>����л�㡣","ҩ���ϰ壺���ÿ�������������˭��û���Ѵ����ú��ù��ɣ�˵������������˴������һ�����Ҫ���̵ĵط���",name.."<#>����̫�����ˡ�","ҩ���ϰ壺�Ժ���ʲô�˻�ֻ�������ң�����뵥�����򣬿��԰�סshift������Ҽ���",name.."<#>���ã���֪���ˡ�","ҩ���ϰ壺����ȥ�Ҵ�����������ɡ�") 
	else 
		Talk(1,"","ҩ���ϰ壺���˵�ʱ��ǧ��ǵ÷�ҩ��С�����Σ�����ҽ����")
	end
end

------------------------------------����--------------------------------------
function tboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName() 
	 	if ( Uworld1000 == 100 ) or ( Uworld1000 == 110 ) then
			nt_setTask(1000,110) --����6start
			Talk(11,"Uworld1000_high6","������Ӵ����������",name.."<#>���Ǻǣ��������ˡ�","��������Ҫ���ɶ��",name.."<#>��������������Ϣ�ġ�","��������ү���ˣ�",name.."<#>���ǡ�","�������Ǿͺð졣����ʲô�������У������������ѡ���������п��ܼ��������Ŷ��",name.."<#>�����","�������㰴סF4�򿪱�������F3��װ�����棬��������������װ������������Ϳ���ʹ���ˡ�",name.."<#>��лл����","����������������ӻ����ϰ���ȥ�ɣ������Ǹ����ˡ�")
		else
			Talk(1,"","��������ѱ�������̫�б�Ҫ�ˣ�����˭���㶼�ô������⡣")
		end
end    

-----------------------------------��������-----------------------------------
function education_tiejiang()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 380 ) or ( Uworld1000 == 390 ) then
		nt_setTask(1000,390) --����20start
		Talk(12,"Uworld1000_repair","�����������ѳ������±�Ȼ���ӻ��ҡ����ã��ʱ������ʱ�Ż��սᰡ��",name.."<#>������������˵ʲô��","������������������ģ�",name.."<#>���ǡ�","��������˵��ʼ�ʵ���һ��֮������ġ���������������ֽ�������֪������������ȷ�Ѫ�갡��",name.."<#>������ʲô�ǡ������������","����������Ժ����Ի�֪�������������������������һ�����ף�����ȥ�ɡ�",name.."<#>����л����","�������ⶫ�����������վã��Ѿ���Щ��ʴ������������������ʹ�ĥһ����",name.."<#>��Ŷ���Ǿ�����ô����","�������ٴκ������죬�������װ�������Ǹ����֣��Ϳ����ü�ͷ�������Ҫ�����װ���ˡ�",name.."<#>���������ްɡ�")
	elseif ( Uworld1000 == 400 ) or ( Uworld1000 == 410 ) then  --ȱ�ٶԿ����Ƿ�����õ��ж�
		nt_setTask(1000,410) --����21start
		Talk(9,"Uworld1000_luck1","�������������Ѿ��޺��˰ɡ�",name.."<#>�������޺��ˡ�","�������㿴��װ���ϵİ����Ա�����û�У�",name.."<#>�������ˣ�������ô���£���û��ȥ�Ҽ����װ������","��������Ϊ���װ���������������������ģ�������װ������һ�������Խ��Զ��������ˮ��ˮ��ľ��ľ���𣬻�������������",name.."<#>��Ŷ��̫���ˡ������ҳ����������м����ˡ�","�����������ҽ�����һ���ر�Ľ�����",name.."<#>������ʲô��","�������ҽ�����һ������״̬����������10�㣬����ֻ�ܳ���1СʱŶ��")
	else 
		Talk(1,"","��������ѱ�������̫�б�Ҫ�ˣ�����˭���㶼�ô������⡣")
	end
end

function Uworld1000_repair() --����˫�ӹ�����һ��
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 390 ) then
		local nItemIdx = 0;
		if ( GetSex() == 0 ) then --��
				if (GetSeries() == 0 ) then
					nItemIdx = AddItem(0,2,0,1,2,255,7);--ˮ��
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 1 ) then --ľ
					nItemIdx = AddItem(0,2,0,1,3,255,7);--����
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 2 ) then --ˮ
					nItemIdx = AddItem(0,2,0,1,1,255,7);--ľ��
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 3 ) then --��
					nItemIdx = AddItem(0,2,0,1,4,255,7);--����
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 4 ) then --��
					nItemIdx = AddItem(0,2,0,1,0,255,7);--����
					SetCurDurability(nItemIdx,14)
				end
			else 
				if (GetSeries() == 0 ) then --��
					nItemIdx = AddItem(0,2,9,1,2,255,7);--Ůˮ��
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 1 ) then --ľ
					nItemIdx = AddItem(0,2,9,1,3,255,7);--Ů����
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 2 ) then --ˮ
					nItemIdx = AddItem(0,2,9,1,1,255,7);--Ůľ��
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 3 ) then --��
					nItemIdx = AddItem(0,2,9,1,4,255,7);--Ů����
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 4 ) then --��
					nItemIdx = AddItem(0,2,9,1,0,255,7);--Ů����
					SetCurDurability(nItemIdx,14)
			end
		end
	end
	nt_setTask(1000,400) --����20end
	Msg2Player("�������㽫��������ã�������������������")	
end

function Uworld1000_luck1()
	local name = GetName()  
	Talk(4,"Uworld1000_luck2",name.."<#>������ʲô��˼��","���������˾���������Ұ�޵Ĳ����У������и��ߵĿ��ܻ�ú�װ��������ֵ���Ϊ255����������Ѹ���1Сʱ�����ˣ��������ء�",name.."<#>�������һ�ġ�","�������ã�����·Զ��������Ի�ȥ�������������ˣ����Ὣ����һ���Ž����㡣")
end

function Uworld1000_luck2()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 410 ) then
	  	AddSkillState(441, 1, 1, 64800)        --��������10һСʱ���ж�
		AddOwnExp(2000)
	end
	nt_setTask(1000,420) --����21end
	Msg2Player("�����������1Сʱ��������1Сʱ�ڣ��������п��ܴ򵽸��õ�װ����")
	if  ( curCamp == 0 ) then
		Msg2Player("������������Ի�ȥ�����Ұ������ˡ�")
	elseif  ( curCamp == 2 ) then
		Msg2Player("������������Ի�ȥ�꾩���ذϻ����ˡ�")
	elseif  ( curCamp == 1 )  then
		Msg2Player("������������Ի�ȥ�ٰ����������ˡ�")
	end
end

----------------------------�ٰ�Ǯׯ�ϰ�----------------------------------------

function education_qianzhuanglaoban()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 360 ) or ( Uworld1000 == 370 ) then
		nt_setTask(1000,370) --����19start
		Talk(4,"Uworld1000_yinpiao","Ǯׯ�ϰ壺���������ˣ�",name.."<#>���ǡ�","Ǯׯ�ϰ壺�������������ҳй����Ķ��飬�����¾����ҵ��¡�",name.."<#>����ʵֻ����ү������������תת��","Ǯׯ�ϰ壺Ŷ�������������Ҹ�����һЩ���߽�����Ҫע������")
	end
end

---------------------------�����˴���-----------------------------------------------
function education_wulinmengchuanren()
Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 340 ) or ( Uworld1000 == 350 ) then 
		nt_setTask(1000,350) --����18start
		Talk(6,"Uworld1000_goon3","�����˴��ˣ��Ǻǣ�С�ѣ������ˡ�",name.."<#>����֪����Ҫ����","�����˴��ˣ�������ǰ����������������Եǰ�̣�����������һ����׼�ġ�",name.."<#>���Ǻǣ���������٩��","�����˴��ˣ����ϰ��������������ڽ������¶����ҵ���",name.."<#>��Ŷ����ô��ʲô����û��");
	end
end

function Uworld1000_tianhuanglongqi()
	Describe("<link=image:\\spr\\Ui3\\������ϵͳ\\����ͼ��\\tianhuanglongqi_01.spr>�������<link>",1,"�����ۿ�/Uworld1000_high7")
end

function Uworld1000_high7()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 130 ) then
		if ( GetSex() == 0 ) then 
			AddItem(0,5,1,1,1,20)         --����һ˫Ь��
		elseif ( GetSex() == 1 ) then 
			AddItem(0,5,3,1,1,20)
		end
		AddItem(5,0,0,0,0,0)         --���������سǷ�
		AddItem(5,0,0,0,0,0)
		AddOwnExp(200)
		nt_setTask(1000,140) --����7end
		Msg2Player("����������ŻسǷ���")
		Msg2Player("�������һ˫Ь�ӡ�")
		Msg2Player("������������ȥ���崦��")
		seteducationnpcpos()
	end
end

function Uworld1000_high5()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 90 ) then
		for i=1,3 do
			AddItem(1,0,0,2,0,0)                          --������ƿ��ҩ
		end
		AddOwnExp(200)
		nt_setTask(1000,100) --����5end
		Msg2Player("�������������ҩˮ��")
		Msg2Player("������������������������Ի���")
		seteducationnpcpos()
	end
end

function Uworld1000_high6()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 110 ) then
		AddOwnExp(200)
		nt_setTask(1000,120) --����6end
		Msg2Player("�������������ӻ������ϰ���ϰ壩�Ի���")
		seteducationnpcpos()
	end
end

function Uworld1000_end1()
	local name = GetName()  
	local Uworld1065 = nt_getTask(1065)
	local Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 10 ) then
		Uworld1065 = Uworld1065-3
		nt_setTask(1065,Uworld1065)
	end
	nt_setTask(1000,30) --����2start
	Talk(5,"Uworld1000_wuxing","��ʦ���������⣿���̵������ѧ���µ��˵����١�����������ȥ��������",name.."<#>�����޼ҳ𣬶�Ҫ���ġ�","��ʦ���Ʋ���������ͦ��־�����ðɣ�������Щƣ���������ڴ������˷�Ұ��Ϯ��������������v��������Դ���������Ѫ�ˡ���󴳵��������ⲻ�����յ�ʱ���ܻص�һ˿һ����Ϣ��˵�����ͼ�������",name.."<#>��Ŷ���Ҷ��ˡ�","��ʦ���������������л��ˡ������ڽ̸���һ������ȭ����")
end

function Uworld1000_wuxing()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 30 ) then
		AddOwnExp(350)	
		if ( GetSeries() == 0 ) then
			AddMagic(445)   --��
		elseif ( GetSeries() == 1 ) then
			AddMagic(446) 	--ľ
		elseif ( GetSeries() == 2 ) then	
			AddMagic(447) 	--ˮ
		elseif ( GetSeries() == 3 ) then
			AddMagic(448) 	--��
		elseif ( GetSeries() == 4 ) then
			AddMagic(449) 	--��
		end
	end
		nt_setTask(1000,40) --����2end
		seteducationnpcpos()
		Msg2Player("��ѧ��������ȭ��.")
		Talk(2,"","��ʦ�����׹���ֻΪ��������������̫������ֻҪ��������Ӧ�书�������Ƶĵ��ˣ������°빦�������ľ��ľ����������ˮ��ˮ�˻𣬻�˽�","��ʦ��Ϊ��֮�����ڼ�����ΪҪ���������ֿ��ˣ��Ⱦ����⣬Χ¯�ջ�ȥ���������ͻ�ȥ����ͷ�������ɡ�")
end

function Uworld1000_good4()
	local name = GetName()  
	Talk(9,"Uworld1000_changewuxing",name.."<#>��Ŷ��ԭ���������㡣","��ʦ�������ȥ����һ�£��������ҡ�",name.."<#>�����ˣ����Ѿ����Թ��ˡ�","��ʦ��������������һ�����Լ������ѽ�Ϊ�ֵܵĻ�������ȥ������������һ�����С�",name.."<#>�������Ҽ�ס�ˡ�","��ʦ������·Զ�����Ѷ�һ�����Ͷ��˷������������Ϊ֮��","��ʦ�����ˣ�������һ�Ѵ������Եı���������һ�����������Ե����������͸��㡣�����Ƕ�װ���ϣ���ῴ���������е�Ե�ʣ��㽣�ϵİ����Ա������ˡ�",name.."<#>����Ȼ��","��ʦ������뼤��װ�����㿪F4����ÿ��װ��������ʾ�Ľ�ɫ���־�֪��Ҫ��ʲô���Ե�װ���ˡ����ȥ�ɡ��в����Ĵ�F1���Ҳ鿴���������F11��")
end

function Uworld1000_changewuxing()
	local name = GetName()  
	Talk(2,"Uworld1000_high9","��ʦ�����ˣ��ϻط�������书������ʵ����Ч�ģ�Ϊ�Ĳ����������˵��������������ڴ��ڸ��������ļ��ܡ�","��ʦ��������׾��ֻҪ���ڼ���ϰ���������书˵�������ܳ�Ϊ�������֣��ɰ�һ��䣬����Ϊ֮��")
end

function Uworld1000_high9()
	Uworld1000 = nt_getTask(1000)
	local Uworld1067 = nt_getTask(1067)
	local Uworld445 = HaveMagic(445)
	local Uworld446 = HaveMagic(446)
	local Uworld447 = HaveMagic(447)
	local Uworld448 = HaveMagic(448)
	local Uworld449 = HaveMagic(449)
	if ( Uworld1000 == 190 ) then
		if ( GetSex() == 0 ) then 
			if ( GetSeries() == 0 ) then--��
				AddVerItem(4,3,0,0,0,1,3,50,1,2,0,0,0,0) --��    
				AddItem(0,4,1,1,1,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 1 ) then--ľ
				AddVerItem(4,3,0,0,0,1,2,50,1,2,0,0,0,0) --��    
				AddItem(0,4,1,1,0,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 2 ) then--ˮ	
				AddVerItem(4,3,0,0,0,1,4,50,1,2,0,0,0,0) --��    
				AddItem(0,4,1,1,3,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 3 ) then--��
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --��    
				AddItem(0,4,1,1,2,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 4 ) then--��
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --��    
				AddItem(0,4,1,1,2,60,2,2,0,0,0,0) --����  
			end
		else 
			if ( GetSeries() == 0 ) then--��
				AddVerItem(4,3,0,0,0,1,3,50,1,2,0,0,0,0) --��    
				AddItem(0,4,0,1,1,60,2,2,0,0,0,0) --����  		
			elseif ( GetSeries() == 1 ) then--ľ
				AddVerItem(4,3,0,0,0,1,2,50,1,2,0,0,0,0) --��    
				AddItem(0,4,0,1,0,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 2 ) then--ˮ	
				AddVerItem(4,3,0,0,0,1,4,50,1,2,0,0,0,0) --��    
				AddItem(0,4,0,1,3,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 3 ) then--��
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --��    
				AddItem(0,4,0,1,2,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 4 ) then--��
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --��    
				AddItem(0,4,0,1,2,60,2,2,0,0,0,0) --����  
			end
		end
	end
	if (( Uworld445 ~= -1 ) or ( Uworld446 ~= -1 ) or ( Uworld447 ~= -1 ) or ( Uworld448 ~= -1 ) or ( Uworld449 ~= -1 )) and ( Uworld1067 <  10 ) then
		if ( Uworld445 ~= -1 ) then
			DelMagic(445)
			AddMagic(534,1)
			AddMagicPoint(Uworld445)
		elseif ( Uworld446 ~= -1 ) then
			DelMagic(446)
			AddMagic(535,1)
			AddMagicPoint(Uworld446)
		elseif ( Uworld447 ~= -1 ) then
			DelMagic(447)
			AddMagic(536,1)
			AddMagicPoint(Uworld447)
		elseif ( Uworld448 ~= -1 ) then
			DelMagic(448)
			AddMagic(537,1)
			AddMagicPoint(Uworld448)
		elseif ( Uworld449 ~= -1 ) then
			DelMagic(449)
			AddMagic(538,1)
			AddMagicPoint(Uworld449)
		end
		nt_setTask(1067,10)
	end
	AddOwnExp(800)
	nt_setTask(1000,200) 
	Msg2Player("��ʦ������һЩ���ѷ�������˵������F1�����в鿴��������Ի�ȥ�������ˡ�")
	Msg2Player("�������һ�ѱ�����һ�����������������������")
	Msg2Player("���Ѿ��õ������������й������ܡ�")
	seteducationnpcpos()
end

function Uworld1000_yinpiao()
	local name = GetName()  
	Talk(1,"Uworld1000_get","Ǯׯ�ϰ壺����������ͨȫ������Ʊ����Ʊ�Ƿ����������Ϸ������ó�׽������ṩ��һ��������Ʒ����Ʊ��ͨ��һ��ͨ����Ϸ��ֵ��ã�Ŀǰֻ�ڽ�ɽ��Ϸ����ͨ��һ��30Ԫ�ĵ㿨�ɳ��������Ʊ��һ��15Ԫ�ĵ㿨�ɳ��һ����Ʊ����ҿ����ٰ���Ǯׯ�һ���Ʊ��ÿ����Ʊ���Զһ���7����Ϸʱ�䡢1500������Ϸ������ 1500 ��ɽ�ҡ��㿨������Ʊ�󣬲����ٻ��ص㿨����Ʊ֮�䲻�����໥�һ�������Ʊ���Զһ���ͭǮ����һ����Ʊ�ܶһ���15öͭǮ����Ʊ����ͭǮ�󣬲����ٻ�����Ʊ�����ˣ�ȥ�ҳ�����������ɡ�")
end

function Uworld1000_get()
	AddOwnExp(5000)
	nt_setTask(1000,380)	--����19end
	Msg2Player("Ǯׯ�ϰ�����ȥ�ҳ������������")	
	seteducationnpcpos()
end


function Uworld1000_goon3()
	local name = GetName()  
	Talk(3,"Uworld1000_queding","�����˴��ˣ����еģ�ֻҪ��������Ϸ�㿨�Ϳ����졣",name.."<#>�������������������ˡ�","�����˴��ˣ��Ǻǣ�С�����ʴ�ӱ����������ȥ���ٰ��ɡ����ٰ���Ǯׯ�ϰ壬������(180��191),��Ҳ�����Щָ�㡣�����ҳ�����ĳ��������ȥ��")
end

function Uworld1000_queding()
	AddOwnExp(5000)
	nt_setTask(1000,360) --����18end 
	Msg2Player("�����˴�������ȥ���ٰ���Ǯׯ�ϰ塣")	
	seteducationnpcpos()
end

function no()
end