-------------------------------------------------------------------------
-- FileName		:	posthouse.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-04 15:30:14
-- Desc			:	����������ٽű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--�����乤�ߺ���
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
--Include("\\script\\lib\\awardtemplet.lua")--�������ӿ�

IncludeLib("RELAYLADDER");	--���а�


--���������ȥ�������е����������Ӧ��        60-89����90-119����120��������
--citygo �Ĺ��췽ʽ
--�������е������������Ӧֵ����ǰ�������֣�ȥ���������֣��������id����ǰ����id��ȥ�����е�ͼid��x��y
--1201	���������֮���������
--1202	��������ɽ�����������
--1203	��������ǧ�����������

citygo = {
----����ȥ��������(mapid:80)
--{1204,1,"����","�꾩",1201,80,37,1601,3001},
--{1204,2,"����","����",1201,80,1,1561,3114},
--{1204,3,"����","�ٰ�",1201,80,176,1592,2925},
--{1204,4,"����","�ɶ�",1201,80,11,3021,5090},
--{1204,5,"����","����",1201,80,78,1596,3379},
--{1204,6,"����","����",1201,80,162,1674,3132},
--
----�꾩ȥ��������(mapid:37)
--{1204,7,"�꾩","����",1201,37,80,1676,3000},
--{1204,8,"�꾩","����",1201,37,1,1561,3114},
--{1204,9,"�꾩","�ٰ�",1201,37,176,1592,2925},
--{1204,10,"�꾩","�ɶ�",1201,37,11,3021,5090},
--{1204,11,"�꾩","����",1201,37,78,1596,3379},
--{1204,12,"�꾩","����",1201,37,162,1674,3132},
--
----����ȥ��������(mapid:1)
--{1204,13,"����","����",1202,1,80,1676,3000},
--{1204,14,"����","�꾩",1202,1,37,1601,3001},
--{1204,15,"����","�ٰ�",1202,1,176,1592,2925},
--{1204,16,"����","�ɶ�",1202,1,11,3021,5090},
--{1204,17,"����","����",1202,1,78,1596,3379},
--{1204,18,"����","����",1202,1,162,1674,3132},
--
----�ٰ�ȥ��������(mapid:176)
--{1204,19,"�ٰ�","����",1202,176,80,1676,3000},
--{1204,20,"�ٰ�","����",1202,176,1,1561,3114},
--{1204,21,"�ٰ�","�꾩",1202,176,37,1601,3001},
--{1204,22,"�ٰ�","�ɶ�",1202,176,11,3021,5090},
--{1204,23,"�ٰ�","����",1202,176,78,1596,3379},
--{1204,24,"�ٰ�","����",1202,176,162,1674,3132},
--
----�ɶ�ȥ��������(mapid:11)
--{1204,25,"�ɶ�","����",1203,11,80,1676,3000},
--{1204,26,"�ɶ�","����",1203,11,1,1561,3114},
--{1204,27,"�ɶ�","�꾩",1203,11,37,1601,3001},
--{1204,28,"�ɶ�","�ٰ�",1203,11,176,1592,2925},
--{1204,29,"�ɶ�","����",1203,11,78,1596,3379},
--{1204,30,"�ɶ�","����",1203,11,162,1674,3132},
--
----����ȥ��������(mapid:78)
--{1204,31,"����","����",1203,78,80,1676,3000},
--{1204,32,"����","����",1203,78,1,1561,3114},
--{1204,33,"����","�꾩",1203,78,37,1601,3001},
--{1204,34,"����","�ٰ�",1203,78,176,1592,2925},
--{1204,35,"����","�ɶ�",1203,78,11,3021,5090},
--{1204,36,"����","����",1203,78,162,1674,3132},
--
----����ȥ��������(mapid:162)
--{1204,37,"����","����",1201,162,80,1676,3000},
--{1204,38,"����","����",1201,162,1,1561,3114},
--{1204,39,"����","�꾩",1202,162,37,1601,3001},
--{1204,40,"����","�ٰ�",1202,162,176,1592,2925},
--{1204,41,"����","����",1203,162,78,1596,3379},
--{1204,42,"����","�ɶ�",1203,162,11,3021,5090},

--�ɶ�ȥ��������(mapid:11)
{1204,1,"�ɶ�","����",1203,11,162,1674,3132},

--����ȥ��������(mapid:162)
{1204,2,"����","�ɶ�",1203,162,11,3021,5090},

}

-------------------------------------------������ʹ�����������-------------------------------------------------
function especiallymessenger()
--	if ( nt_getTask(1270) == 0 ) then
--		nt_setTask(1270,1)
--		nt_setTask(1205,0)
--		Msg2Player("������ʹ�����ѱ���գ������ڿ�ʼ����������֡�����͡�")
--	end

	--�ߴ��������ֻ�гɶ��ʹ���������
	local _, _, nMapIndex = GetPos()
	local MapId = SubWorldIdx2ID( nMapIndex )
	if MapId ~= 11 and MapId ~= 162 then
		Talk(1,"","�μ���ʹ������ȥ�����<color=red>�ɶ�<color> ���� <color=red> ����<color>!")
		return
	end
	
	nt_setTask(1211,0)
--	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);--��������
	Describe(DescLink_YiGuan..": ��͢��������ܱ�������֪��, �һ������ڼ�. ���ǣ��ڷ�����Щ����֮ǰ�����������˶�֪��������Ϊ���Ҿ�һ������?",7,
	"��Ը��!/messenger_ido",
	"��������ʹ���� /messenger_finishtask",
	"����ɾ����ʹ���� /messenger_losemytask",
	--"��Ҫ�������ҵ���ʹ�ƺ�/messenger_getlevel",
	--"��Ҫ�û��ֶһ���ʹ�Ľ���/messenger_duihuanprize",
	"�����˽���ʹ����/messenger_what",
	"������кܶ���Ҫ��!/no")
end


-------------------------------------------����������ʹ�����������-----------------------------------------------


function messenger_ido()
	local _, _, nMapIndex = GetPos()
	
	local Uworld1204 = nt_getTask(1204)  --��¼��ҵ����������ÿ���������ʱ���
	local Uworld1028 = nt_getTask(1028)  --�������������
	local MapId = SubWorldIdx2ID( nMapIndex )
	if ( GetLevel() < 120 ) then
		Describe(DescLink_YiGuan..": �Բ���Ŀǰ��ĵȼ�����120��. ������ϰȻ��������.",1,"�����Ի�/no")	
	elseif ( Uworld1204 ~= 0 )  then
		Describe(DescLink_YiGuan..":�Բ���!�����ʹ����δ��ɣ����ܽ���ͬ������������ɸ�����лл!",1,"�����Ի�/no")
--	elseif (  messenger_givetime() == 10 ) then  --�鿴�����Ƿ��йؿ�ʱ��
--		Describe(DescLink_YiGuan.."���Բ�������������ʹ�����е�ʱ���Ѻľ�������������,лл��",1,"�����Ի�/no")
	else
    	local nTaskFlag = check_daily_task_count()--��黹��û���������
    	if nTaskFlag == 0 then
    		Describe(DescLink_YiGuan..":�Բ��𣬽������Ѿ������ˣ�����������",1,"�����Ի�/no")
    		return
    	elseif nTaskFlag == -1 then
    		Describe(DescLink_YiGuan..": �������Ѻ����ˡ��������<color=yellow>ǧ������<color>, �ҽ����������ٲμ�һ��.",1,"�����Ի�/no")
    		return
    	elseif nTaskFlag == 2 then
    		Msg2Player("��ֻ������ǧ������μ�����<color=yellow>�������<color>�ҽ��ջ�����")
    	end
    	
    	WriteLog(format("Account:%s[Name:%s] ����ʹ���� ���������[%d] ��.",
				GetAccount(),
				GetName(),
				nTaskFlag
				)
			);
	if nTaskFlag == 2 then
		tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuTinSuSuDungThienBaoKhoLenh")		
	else
		tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuTinSu")
	end
		
-- ����������ڵ�ͼ�����һ��������У�������������֮��Ķ�Ӧ�����Ͷ�Ӧ�ؿ�������ֵ
--		if ( MapId == 80 ) then
--			local CityId = random(1,6)
--			for i=1,6 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end
--		elseif ( MapId == 37 ) then
--			local CityId = random(7,12)
--			for i=7,12 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end
--		elseif ( MapId == 1 ) then
--			local CityId = random(13,18)
--			for i=13,18 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end	
--		elseif ( MapId == 176 ) then
--			local CityId = random(19,24)
--			for i=19,24 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end		
		if ( MapId == 11 ) then
			if ( messenger_choice(1,1) ~= 10 ) then
					print("messenger_choice error:1")
			end
--			local CityId = random(25,30)
--			for i=25,30 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end		
--		elseif ( MapId == 78 ) then
--			local CityId = random(31,36)
--			for i=31,36 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end
		elseif ( MapId == 162 ) then
			if ( messenger_choice(2,2) ~= 10 ) then
					print("messenger_choice error:2")
			end
--			local CityId = random(37,42)
--			for i=37,42 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end
		else
			Msg2Player("�Բ���! ����Ϊʲô�㲻�ܽ���ʹ��������ϵGM!")
		end
	end
end

--ǰ��ǧ����
function messenger_storewagoner()
	SetRevPos(11,10)
	
	NewWorld(395,1417,3207)
end

-----------------------------------------------������Ҫ������һ��������ʹ���񣬲��ı�����ʹ��������͵���ؿ�����------------------------
function messenger_choice(CityIdTwo,j)
	if ( CityIdTwo == citygo[j][2] ) then	
		--�����ɴ˵�ȥ�˵ص��������	
		nt_setTask( 1204,citygo[j][2] )
		--����ȥ���ĸ��ؿ����������   
		nt_setTask( citygo[j][5],10) --������ʹ����Ĳ���
		local name = GetName()
		Talk(1,"","���ô�"..citygo[j][3].."��"..citygo[j][4].."�ر���ʹ�����,"..citygo[j][3].."��վ��ٵĹ���"..name.."����!")		
		return 10
	end
end


---------------------------------------------------������ʹ�ƺ�----------------------------------------------------------------------
--function messenger_getlevel()
--	local Uworld1205 = nt_getTask(1205)
--	local Uworld1206 = nt_getTask(1206)
--	local messenger_reallevelname = ""
--	if ( Uworld1206 == 1 ) then
--		messenger_reallevelname = "ľ����ʹ"
--	elseif ( Uworld1206 == 2 ) then
--		messenger_reallevelname = "ͭ����ʹ"
--	elseif ( Uworld1206 == 3 ) then
--		messenger_reallevelname = "������ʹ"
--	elseif ( Uworld1206 == 4 ) then
--		messenger_reallevelname = "������ʹ"
--	elseif ( Uworld1206 == 5 ) then
--		messenger_reallevelname = "���ͽ�����ʹ"
--	else	
--		messenger_reallevelname = "û���κγƺ�����ʹ"
--	end 
--	Describe(DescLink_YiGuan.."����Ŀǰ��"..messenger_reallevelname.."��������ʹ����Ϊ"..Uworld1205.."�㣬����Ҫ����Ϊ������ʹ�أ�",6,
--		"ľ����ʹ[50��]/messenger_levelmu",
--		"ͭ����ʹ[150��]/messenger_leveltong",
--		"������ʹ[450��]/messenger_levelyin",
--		"������ʹ[800��]/messenger_leveljin",
--		"���ͽ�����ʹ[1500��]/messenger_levelyuci",
--		"��ֻ����㿴��/no")
--end

function messenger_levelmu()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 50 ) then
		if ( Uworld1206 < 1 ) then
			nt_setTask(1206,1)
			nt_setTask(1205,Uworld1205-50)
			Describe(DescLink_YiGuan..": ��ϲ"..name.."���˳�Ϊ��ʹ-ľ!",1,"�����Ի�/no")
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_YiGuan..":"..name.."! ��������ʹ- ľ, ��������, ��Ŭ��!",1,"�����Ի�/no")		
		else
			Describe(DescLink_YiGuan..":"..name.."! ��ĵȼ�������ʹ- ľ, ��ѡ��������ʹ.",2,"����/messenger_getlevel","�����Ի�/no")				
		end
	else
		Describe(DescLink_YiGuan..":�Բ���!  �㲻����������ʹ- ľ������, ��Ŭ����лл!",2,"����/messenger_getlevel","�����Ի�/no")
	end
end

function messenger_leveltong()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 150 )  then
		if ( Uworld1206 < 2 ) then
			nt_setTask(1206,2)
			nt_setTask(1205,Uworld1205-150)
			Describe(DescLink_YiGuan..": ��ϲ"..name.."����������ʹ- ͭ!",1,"�����Ի�/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_YiGuan..":"..name.."! ��������ʹ- ͭ,����������,�����Ŭ�� !",1,"�����Ի�/no")				
		else
			Describe(DescLink_YiGuan..":"..name.."! ��ĵȼ�������ʹ-ͭ, ��ѡ��������ʹ.",2,"����/messenger_getlevel","�����Ի�/no")				
		end
	else
		Describe(DescLink_YiGuan..":�Բ���!  �㲻����������ʹ- ͭ������,�����Ŭ�� , c�m �n!",2,"����/messenger_getlevel","�����Ի�/no")
	end
end

function messenger_levelyin()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 450 ) then
		if ( Uworld1206 < 3 ) then
			nt_setTask(1206,3)
			nt_setTask(1205,Uworld1205-450)
			Describe(DescLink_YiGuan..": ��ϲ"..name.."��������Ϊ����ʹ!",1,"�����Ի�/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_YiGuan..":"..name.."! ����������ʹ������Ҫ�����������Ŭ��!",1,"�����Ի�/no")				
		else
			Describe(DescLink_YiGuan..":"..name.."! ��ĵȼ��ѹ�����ʹ����ѡ��������ʹ!",2,"����/messenger_getlevel","�����Ի�/no")				
		end
	else
		Describe(DescLink_YiGuan..":�Բ���!  �㲻��������ʹ�����������������Ŭ����лл!",2,"����/messenger_getlevel","�����Ի�/no")
	end
end

function messenger_leveljin()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 800 ) then
		if ( Uworld1206 < 4 ) then
			nt_setTask(1206,4)
			nt_setTask(1205,Uworld1205-800)
			Describe(DescLink_YiGuan..": ��ϲ"..name.."����������ʹ- ��!",1,"�����Ի�/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_YiGuan..":"..name.."! ��������ʹ- ��,����������,�����Ŭ��!",1,"�����Ի�/no")		
		else
			Describe(DescLink_YiGuan..":"..name.."! ��ĵȼ�������ʹ- ��, ��ѡ��������ʹ!",2,"����/messenger_getlevel","�����Ի�/no")				
		end
	else
		Describe(DescLink_YiGuan..":�Բ���!  �Բ����㲻����������ʹ- �������, �����Ŭ����лл!",2,"����/messenger_getlevel","�����Ի�/no")
	end
end

function messenger_levelyuci()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 1500 ) then
		if ( Uworld1206 < 5 ) then
			nt_setTask(1206,5)
			nt_setTask(1205,Uworld1205-1500)
			Describe(DescLink_YiGuan..": ��ϲ"..name.."��������Ϊ������ʹ����!",1,"�����Ի�/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_YiGuan..":"..name.."�����ǽ�������ʹ������Ҫ�����ˣ������Ŭ��!",1,"�����Ի�/no")				
		end
	else
		Describe(DescLink_YiGuan..":�Բ���! �㲻���Ͻ�������ʹ�����������������Ŭ��!",2,"����/messenger_getlevel","�����Ի�/no")
	end
end

--------------------------------------------����ʹ����------------------------------------------------------
function messenger_finishtask()
	local Uworld1201= nt_getTask(1201)	--���������֮���������
	local Uworld1202= nt_getTask(1202)	--��������ɽ�����������
	local Uworld1203= nt_getTask(1203)	--��������ǧ�����������
	local Uworld1204= nt_getTask(1204)	--�������������ص��������
--	local Uworld1205= nt_getTask(1205)	--��ʹ����
--	local Uworld1206= nt_getTask(1206)	--��ʹ�ƺ�
--	local Uworld1208= nt_getTask(1208)	--��֮��ɱ�ּ�����
--	local Uworld1209= nt_getTask(1209)	--ɽ����ɱ�ּ�����
--	local Uworld1210= nt_getTask(1210)	--ǧ����ɱ�ּ�����
	local Uworld1218= nt_getTask(1218)  --��ʹ������ɴ���������

--	if ( Uworld1201 == 30 ) then
--		if ( messenger_gettime() == 10 ) then
--			Describe(DescLink_YiGuan.."���Բ�����û������ɵĵ�������ȡ������������񱻿���ʧ���ˣ�",1,"�����Ի�/no")
--		else
--			nt_setTask(1218,Uworld1218+1)
--			Describe(DescLink_YiGuan.."����ϲ���Ѿ�����˵�ǰ����",1,"��ȡ����/messenger_flyprize")
--		end
--	elseif ( Uworld1202 == 30 ) then
--		if ( messenger_gettime() == 10 ) then
--			Describe(DescLink_YiGuan.."���Բ�����û������ɵĵ�������ȡ������������񱻿���ʧ���ˣ�",1,"�����Ի�/no")
--		else
--			nt_setTask(1218,Uworld1218+1)
--			Describe(DescLink_YiGuan.."����ϲ���Ѿ�����˵�ǰ����",1,"��ȡ����/messenger_templeprize")
--		end
	if ( Uworld1203 == 30 or Uworld1203 == 25 ) then
		if ( messenger_gettime() == 10 ) then
			Describe(DescLink_YiGuan..":�Բ���!  �㻹δ����������콱�����񣬸���������ʧ����!",1,"�����Ի�/no")
		else
			nt_setTask(1218,Uworld1218+1)
			Describe(DescLink_YiGuan..":  ��ϲ�����������",1,"�콱/messenger_treasureprize")
		end
--	elseif ( Uworld1201 == 25 ) or ( Uworld1202 == 25 ) or ( Uworld1203 == 25 ) then   --����˼���ʹ����
--		if ( messenger_gettime() == 10 ) then
--			Describe(DescLink_YiGuan.."���Բ�����û������ɵĵ�������ȡ������������񱻿���ʧ���ˣ�",1,"�����Ի�/no")
--		else
--			nt_setTask(1218,Uworld1218+1)
--			Describe(DescLink_YiGuan.."����ϲ���Ѿ�����˵�ǰ����",1,"��ȡ����/messenger_simpleprize")	
--		end
--	elseif ( Uworld1201 ~= 0 or Uworld1202 ~= 0 or Uworld1203 ~= 0 ) then
--		Describe(DescLink_YiGuan.."��������ʹ����û����ɣ������Ŭ����",1,"�����Ի�/no")
	elseif Uworld1203 ~= 0 then
		Describe(DescLink_YiGuan..": �Բ����㻹δ����������Աߵ��ϳ�����԰��㵽�����ͼ!",1,"�����Ի�/no")
	else
		Describe(DescLink_YiGuan..": δ�������㻹�����������ˣ�����һ���������������!",1,"�����Ի�/no")
	end
end

function messenger_flyprize()
--	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
--	local Uworld1207 = nt_getTask(1207)
--	local i = random(1,5)
--	AddRepute(i)
--	Msg2Player("��ϲ������"..i.."��������")
--	if ( nt_getTask(1224) ~= 1 ) then
--		if ( GetLevel()>=60 and GetLevel()<=89 ) then
--			if ( nt_getTask(1223) >= 150 ) then
--				messenger_giveplayerexp(1500000)
--			end
--		elseif ( GetLevel()>=90 and GetLevel()<=119 ) then
--			if ( nt_getTask(1223) >= 200 ) then
--				messenger_giveplayerexp(2000000)
--			end			
--		elseif ( GetLevel()>=120 and GetLevel()<=129 ) then
--			if ( nt_getTask(1223) >= 300 ) then
--				messenger_giveplayerexp(3000000)
--			end		
--		elseif ( GetLevel()>=130 ) then
--			if ( nt_getTask(1223) >= 600 ) then
--				messenger_giveplayerexp(6000000)
--			end		
--		end
--	end
--	
--	nt_setTask(1201,0)	--���������֮���������
--	nt_setTask(1204,0)	--�������������ص��������
--	nt_setTask(1207,0)	--��������ǰɱ�ּ���
--	nt_setTask(1211,0)
end

function messenger_templeprize()
-- 	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
--	local Uworld1207 = nt_getTask(1207)
--	local i = random(1,5)
--	AddRepute(i)
--	Msg2Player("��ϲ������"..i.."��������")
--	if ( nt_getTask(1224) ~= 1 ) then
--		if ( GetLevel()>=60 and GetLevel()<=89 ) then
--			if ( nt_getTask(1223) >= 150 ) then
--				messenger_giveplayerexp(1500000)
--			end
--		elseif ( GetLevel()>=90 and GetLevel()<=119 ) then
--			if ( nt_getTask(1223) >= 200 ) then
--				messenger_giveplayerexp(2000000)
--			end			
--		elseif ( GetLevel()>=120 and GetLevel()<=129 ) then
--			if ( nt_getTask(1223) >= 300 ) then
--				messenger_giveplayerexp(3000000)
--			end		
--		elseif ( GetLevel()>=130 ) then
--			if ( nt_getTask(1223) >= 600 ) then
--				messenger_giveplayerexp(6000000)
--			end		
--		end
--	end
--	
--	nt_setTask(1202,0)	--��������ɽ�����������
--	nt_setTask(1204,0)	--�������������ص��������
--	nt_setTask(1207,0)	--��������ǰɱ�ּ���
--	nt_setTask(1211,0)
end

function messenger_treasureprize()
  local nTaskFlag = check_daily_task_count()--��黹��û���������
  if nTaskFlag == 0 then
  	Describe(DescLink_YiGuan..": �Բ��𣬽������Ѻ����ˡ����������������",1,"�����Ի�/no")
  	return
  elseif nTaskFlag == -1 then
  	Describe(DescLink_YiGuan..": ���ǲ�������<color=yellow> ǧ������<color> ��ʧ�ˣ��һ����Ʋ��ܸ��㽱��.",1,"�����Ի�/no")
  	return
  end
  
  --��鱳���ռ�
  local nTodayTaskCount = %get_task_daily(1205)
  local nBagCellNeed = 1
  if nTodayTaskCount == 0 then
  	nBagCellNeed = 2
  end
  if (CalcFreeItemCellCount() < nBagCellNeed) then
		Talk(1, "", format("<#>���װ�������λ, ������װ������%d ��λ��Ȼ�����콱",nBagCellNeed))
		return
	end
	local n_level = GetLevel();
	G_ACTIVITY:OnMessage("FinishMail", 1, n_level);	
	--�۳�ǧ������
	if nTaskFlag == 2 then
	--Fix bug �����ڰ�������ڿ۳�ǧ������- Modifiec by DinhHQ - 20110502
	    	if ConsumeEquiproomItem(1, 6, 1, 2813, -1) == 1 then--�۳�ǧ������
	    		Msg2Player("���ѽ���һ��ǧ������")
	    	else
	    		Talk(1, "", "���ǧ������ȥ�����ˣ���ô��û��?")
	    		return
	    	end
    end
    
   	%add_task_daily(1205, 1)
	nt_setTask(1201,0)	--
	nt_setTask(1202,0)
	nt_setTask(1203,0)
	nt_setTask(1204,0)
	
	nTodayTaskCount = %get_task_daily(1205)--��ȡ�������ļ���ֵ
	WriteLog(format("Account:%s[Name:%s] ��ȡ��ʹ�������� ���������[%d] ��.",
			GetAccount(),
			GetName(),
			nTodayTaskCount
			)
		);
		
	--ÿ���һ�����������3��������
	if nTodayTaskCount == 1 then
		for i = 1, 3 do
			--Fix bug sai level ������- Modified by DinhHQ - 20110921
			AddItem(6,1,2566,1,0,0)--��ȡ��������Ϊ����״̬
		end;
		Msg2Player("����3��������")
	end
	
	--ÿ�ν�������2����ʹ����
	for i = 1, 2 do
		AddItem(6,1,2812,0,0,0)
	end;
	Msg2Player("����2����ʹ����")
end

function messenger_simpleprize()

--	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
--	local i = random(1,5)
--	AddRepute(i)
--	Msg2Player("��ϲ������"..i.."��������")
--	nt_setTask(1201,0)	
--	nt_setTask(1202,0)	
--	nt_setTask(1203,0)	
--	nt_setTask(1204,0)
--	nt_setTask(1207,0)
--	nt_setTask(1211,0)
		
end

--------------------------------------------���ֻ�����-----------------------------------------------------
function messenger_duihuanprize()
	Describe(DescLink_YiGuan..": ��Ʒ��������ʹ���ƺͻƽ�װ��. ���ƿ�����������Ŀ���, �ƽ�װ���������Ӿ���. ����ѡ����?",3,
		"��ʹ���� /messenger_prize_yaopai",
		"�ƽ�װ��/messenger_prize_huangjin",
--		"ͬ�����/messenger_prize_partner",
--		"������Ʒ/messenger_prize_other",
		"�Ժ���˵!/no")
end

function messenger_prize_partner()
	Describe(DescLink_YiGuan..": ��������ոմ���һЩ <color=red>���ص�ͬ����� <color>, ����������?",5,
		"ͬ�м���/no",
		"ͬ�����/messenger_prize_mianju",
		"ͬ����Ʒ/no",
		"����/messenger_duihuanprize",
		"�Ժ���˵!/no")
end

function messenger_prize_mianju()
	Describe(DescLink_YiGuan..": ͬ����߷ֳ�2��: 1��ʹ�ú�10��ʹ��.  �뻻�ĸ�?",4,
	"�����1 ��/prize_mianju_dan",
	"�����10 ��/prize_mianju_shi",
	"����/messenger_prize_partner",
	"��ʱ���ܻ� !/no")
end

function prize_mianju_shi()
	Describe(DescLink_YiGuan..": ���뻻���(10 ��) ������ʿ�׽�����������ʿ�׽�? ���������?",4,
	"�����������ʿ /prize_mianju_shi_shaonian",
	"�����������/prize_mianju_shi_qingnian",
	"����/messenger_prize_mianju",
	"��ʱ���ܻ� !/no")
end

function prize_mianju_shi_shaonian()
	Describe(DescLink_YiGuan..": ��ʼ��!",7,
	"���(10 ��) - �����׽�[40000 ����]/prize_mianju_shi_shaolin_leijian",
	"���(10 ��) - ����Ц˪ [40000 ����]/prize_mianju_shi_shaolin_xiaoshuang",
	"���(10 ��) - ǧ�����[40000 ����]/prize_mianju_shi_shaolin_huoren",
	"���(10 ��) - ���꺣��[40000 ����]/prize_mianju_shi_shaolin_haitang",
	"���(10 ��) - ������ [40000 ����]/prize_mianju_shi_shaolin_jinfeng",
	"����/prize_mianju_shi",
	"��ʱ���ܻ� !/no")
end

function prize_mianju_shi_qingnian()
	Describe(DescLink_YiGuan..": ��ʼ��!",7,
	"���(10 ��) - �����׽�[40000 ����]/prize_mianju_shi_qinglin_leijian",
	"���(10 ��) - ����Ц˪ [40000 ����]/prize_mianju_shi_qinglin_xiaoshuang",
	"���(10 ��) - �������[40000 ����]/prize_mianju_shi_qinglin_huoren",
	"���(10 ��) - ���꺣��[40000 ����]/prize_mianju_shi_qinglin_haitang",
	"���(10 ��) - ������ [40000 ����]/prize_mianju_shi_qinglin_jinfeng",
	"����/prize_mianju_shi",
	"��ʱ���ܻ� !/no")
end

function prize_mianju_shi_qinglin_leijian()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,112,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_shi_qinglin_xiaoshuang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,113,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_shi_qinglin_huoren()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,114,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_shi_qinglin_haitang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,115,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_shi_qinglin_jinfeng()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,116,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_shi_shaolin_leijian()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,102,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_shi_shaolin_xiaoshuang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,103,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_shi_shaolin_huoren()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,104,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_shi_shaolin_haitang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,105,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_shi_shaolin_jinfeng()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,106,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_dan()
	Describe(DescLink_YiGuan..": ���뻻���(1 ��) ������ʿ�׽��������� ��ʿ�׽�? ���������?",4,
	"�����������ʿ/prize_mianju_dan_shaonian",
	"��������� V?/prize_mianju_dan_qingnian",
	"����/messenger_prize_mianju",
	"��ʱ���ܻ� !/no")
end

function prize_mianju_dan_qingnian()
	Describe(DescLink_YiGuan..": ��ʼ��.",7,
	"���(1 ��) - ���� �׽�[10000 ����]/prize_mianju_dan_qinglin_leijian",
	"���(1 ��) - ���� Ц˪ [10000 ����]/prize_mianju_dan_qinglin_xiaoshuang",
	"���(1 ��) - �������[10000 ����]/prize_mianju_dan_qinglin_huoren",
	"���(1 ��) - ���� ����[10000 ����]/prize_mianju_dan_qinglin_haitang",
	"���(1 ��) - ���� ��� [10000 ����]/prize_mianju_dan_qinglin_jinfeng",
	"����/prize_mianju_dan",
	"��ʱ���ܻ� !/no")
end

function prize_mianju_dan_shaonian()
	Describe(DescLink_YiGuan..": ��ʼ��.",7,
	"���(1 ��) - �����׽�[10000 ����]/prize_mianju_dan_shaolin_leijian",
	"��� (1 ��) - ����Ц˪ [10000 ����]/prize_mianju_dan_shaolin_xiaoshuang",
	"���(1 ��) - ǧ�����[10000 ����]/prize_mianju_dan_shaolin_huoren",
	"���(1 ��) - ǧ�꺣��[10000 ����]/prize_mianju_dan_shaolin_haitang",
	"���(1 ��) - ǧ���� [10000 ����]/prize_mianju_dan_shaolin_jinfeng",
	"����/prize_mianju_dan",
	"��ʱ���ܻ� !/no")
end

function prize_mianju_dan_shaolin_leijian()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,97,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_dan_shaolin_xiaoshuang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,98,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_dan_shaolin_huoren()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,99,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_dan_shaolin_haitang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,100,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_dan_shaolin_jinfeng()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,101,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_dan_qinglin_leijian()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,107,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_dan_qinglin_xiaoshuang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,108,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_dan_qinglin_huoren()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,109,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_dan_qinglin_haitang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,110,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_mianju_dan_qinglin_jinfeng()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,111,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ͬ�����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end


function messenger_prize_yaopai()
	Describe(DescLink_YiGuan..": ��ʹ��������ﵽ����ʹ�ƺ����Ӧ���������ǽ���ʹ�������Ի��κ���ʹ���������ľ��ʹ���Ͳ��ܻ�����ʹ�������𣿿�ʼ���ɡ�.",7,
	"��ʹ��- ľ [50��]/prize_yaopai_mu",
	"��ʹ��- ͭ[150��]/prize_yaopai_tong",
	"��ʹ��- �� [450��]/prize_yaopai_yin",
	"����ʹ����[800��]/prize_yaopai_jin",
	"�������� - �� [1500��]/prize_yaopai_yuci",
	"����/messenger_duihuanprize",
	"��ʱ���ܻ� !/no")
end

function prize_yaopai_mu()
	if ( nt_getTask(1205) >= 50 ) then
		AddItem(6,1,885,1,0,0)
		local Uworld1205 = nt_getTask(1205) - 50
		nt_setTask(1205,Uworld1205)
		Msg2Player("���ÿ���ʹ�� -ľ.")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_yaopai_tong()
	if ( nt_getTask(1205) >= 150 ) then
		AddItem(6,1,886,2,0,0)
		local Uworld1205 = nt_getTask(1205) - 150
		nt_setTask(1205,Uworld1205)
		Msg2Player("���ÿ���ʹ��-ͭ.")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_yaopai_yin()
	if ( nt_getTask(1205) >= 450 ) then
		AddItem(6,1,887,3,0,0)
		local Uworld1205 = nt_getTask(1205) - 450
		nt_setTask(1205,Uworld1205)
		Msg2Player("������ʹ��-��.")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end
end

function prize_yaopai_jin()
	if ( nt_getTask(1205) >= 800 ) then
		AddItem(6,1,888,4,0,0)
		local Uworld1205 = nt_getTask(1205) - 800
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 ����ʹ�� -��.")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_yaopai_yuci()
	if ( nt_getTask(1205) >= 1500 ) then
		AddItem(6,1,889,5,0,0)
		local Uworld1205 = nt_getTask(1205) - 1500
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1������ʹ����")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function messenger_prize_huangjin()
	Describe(DescLink_YiGuan..": ��͢�뽱���㣬���Ը���׼����һ�׻ƽ�װ��������ɱ��ʱ�����˫������. ���뻻�ĸ�?",6,
		"��Ӱ��԰����[100000��]/prize_huangjin_shenyuan",
		"��Ӱ��������[70000��]/prize_huangjin_guajian",
		"��Ӱ��ޣ����[70000��]/prize_huangjin_muxu",
		"��Ӱ������[50000��]/prize_huangjin_hongxiu",
		"����/messenger_duihuanprize",
		"��ʱ����/no")
end

function messenger_prize_other()
	Describe(DescLink_YiGuan..": ��͢�кཱܶ����Ŀǰ�����Ʒ���Ի�:",3,
		"���ش���[2000 ����]/prize_other_hongbao",
		"����/messenger_duihuanprize",
		"��ʱ����/no")
end

function prize_other_hongbao()
	if ( nt_getTask(1205) >= 2000 ) then
		local Uworld1205 = nt_getTask(1205) - 2000 
		nt_setTask(1205,Uworld1205)
		AddItem(6,1,402,0,0,0)
		Msg2Player("����1���ش���.")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_huangjin_shenyuan()
	if ( nt_getTask(1205) >= 100000 ) then
		AddGoldItem(0,204)
		local Uworld1205 = nt_getTask(1205) - 100000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 �׺�Ӱ�ƽ�װ��.")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_huangjin_guajian()
	if ( nt_getTask(1205) >= 70000 ) then
		AddGoldItem(0,205)
		local Uworld1205 = nt_getTask(1205) - 70000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 �׺�Ӱ�ƽ�װ��.")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_huangjin_muxu()
	if ( nt_getTask(1205) >= 70000 ) then
		AddGoldItem(0,206)
		local Uworld1205 = nt_getTask(1205) - 70000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 �׺�Ӱ�ƽ�װ��.")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end

function prize_huangjin_hongxiu()
	if ( nt_getTask(1205) >= 50000 ) then
		AddGoldItem(0,207)
		local Uworld1205 = nt_getTask(1205) - 50000
		nt_setTask(1205,Uworld1205)
		Msg2Player("����1 �׺�Ӱ�ƽ�װ��.")
	else
		Describe(DescLink_YiGuan..": �Բ���! �i��Ļ��ֲ�����.",1,"����! /no")
	end 
end
-------------------------------------------ȡ����ʹ����----------------------------------------------------
function messenger_losemytask()
	if ( GetTask(1204) == 0 ) then
		Describe(DescLink_YiGuan..": ��δ����ʹ���񣬲���ɾ��",1,"�����Ի�/no")
	else
		Describe(DescLink_YiGuan..": ��ȷ����ɾ�� ",2,"��!/messenger_lostall","��������!/no")
	end
end
--------------------------------------------����ʲô����ʹ����----------------------------------------------
function messenger_what()
	Describe(DescLink_YiGuan..": ��ʹ�����ǰ�����͢���Ÿ������е����������Ϊ����ڳ�͢���ַ��������ԣ������ŵ�ʱ����������Σ�ա�û������˫ȫ�����Լ��Ž����������˽������������ֻ�дﵽ <color=red> 120������<color> ���ܲμ�.Ŀǰ�㽫�������¹ؿڵ��谭: <color=red> ǧ���� <color>. ����Щ���ڣ���������ͬ�ĵ��˺���ֵĻ��أ�����Ҫ�ô������ǻ�ȥ��ȷѡ����ֻ��ף��ɹ���Ŭ����ս�ѣ�!",4,
	"���ܵ�ͼ�ȼ���/messenger_levelmap",
	--"��֮��ؿ�����/messenger_flyhorse",
	--"ɽ����ؿ�����/messenger_mountaindeity",
	"����ǧ���� /messenger_storehouse",
	--"��ʹ���ƽ���/messenger_orderlevel",
	--"������ʱ����/messenger_limittotask",
	"�����Ի�/no")
end

function messenger_levelmap()
	--Describe(DescLink_YiGuan.."��������ҵĲ�ͬ�ȼ������ǻ��������ֲ�ͬǿ�ȵĵ�ͼ����������������<color=red>60-89����90-119����120<color>�������֡�",2,"����һ��/messenger_what","�����Ի�/no")
	Describe(DescLink_YiGuan..": Ŀǰֻ��<color=red> 120������<color> ����̶�",2,"����/messenger_what","�����Ի�/no")
end

function messenger_flyhorse()
	Describe(DescLink_YiGuan..": �ڷ�����ڣ���������ص����ڣ���������������񣬵��ǣ�ֻ��������ֵ���ڹ��ڣ�������һЩ�򵥵�����һ·�ϣ��㽫�����ܶ��Ҿ����µļǺţ�ͬʱ�кܶ����������ֻ��Ҫ�Ӵ�5������Ϳ��Ե������Ұ��������ء�������ı��ֶ���������ȥ�����Ա������������������������.",2,"����/messenger_what","�����Ի�/no")
end

function messenger_mountaindeity()
	Describe(DescLink_YiGuan..": ��ɽ������ڣ����������ֱ�ӵ����ţ�������������񣬵��ǣ�ֻ��������ֵ���ڹ��ڣ�������һЩ�򵥵�������ɽ�������Ӫ��ʦ��ͽ������ɽ��������ʹ�����ǵ�ͷ�������������ֻ��Ҫ���2���������ܵ�������������ǹ��ء����������񣬶����������а���.",2,"����/messenger_what","�����Ի�/no")
end

function messenger_storehouse()
	Describe(DescLink_YiGuan..": �������Ķӳ���ǧ���ⴳ������ʱ��ϵͳ��������䣬���5������������<color-red> ���պ�������<color> ��<color=red> ����<color> �Ϳ��Դ��ء���Ȼ����Ҫ�򿪱��䣬��Ҫ��� <color=red> �����Աߵ�ǧ�����ػ���boss<color> . <color=red>���з�<color> ��������������򿪿��Ի�ó��������ľ������ˮ�������������������ʹ�ú���԰������״��ǧ�����ػ���boss",2,"����/messenger_what","�����Ի�/no")
end

function messenger_orderlevel()
	Describe(DescLink_YiGuan..":�������ڹ��ڵı��֣����ǽ������һЩ���Σ��㽫��úཱܶ����Ŀǰ�����Ʒ�Ϊ��ʹ - ľ, ��ʹ- ͭ, ��ʹ- ��, ��ʹ- ���Լ�������ʹ- ��. ͬʱ,�㰴 <color=red>F12<color>, ������<color=red>����<color> ��ʹ����֪���Լ���ְ��λ�á�������û��ֻ�ȡ��ʹ�ƺš�Ȼ�󣬿�������ʹ���ֻ�ȡ���ơ���Щ���ƽ���������<color=red>�ָ�<color>���, ��������Ϊ<color=red>1 Сʱ<color>, ʹ�ô���Ϊ<color=red>5 ��<color>.",2,"����/messenger_what","�����Ի�/no")
end

function messenger_limittotask()
	Describe(DescLink_YiGuan..": ����ʹ���������ʱ�� <color=red>2Сʱ<color> �����.ÿ���������ʱ��Ϊ<color=red>2Сʱ<color>. ע�⣬���ڹ���ʱ���㱻ɱ����ɥ������<color=red>����ʧ��<color>!",2,"����/messenger_what","�����Ի�/no")
end

function messenger_giveplayerexp(playerexp)

	local j =random(1,3)

	if ( j == 1 ) then
		tl_addPlayerExp(playerexp-500000)
	elseif ( j == 2 ) then
		tl_addPlayerExp(playerexp)
	elseif ( j == 3 ) then
		tl_addPlayerExp(playerexp+500000)
	end
	Msg2Player("����������ʹ������ֺã���վ����һ�����齱��!")
	nt_setTask(1224,1)  --���õ��콱������Ϊ��  
	nt_setTask(1223,0)
end

function messenger_lostall()
	nt_setTask(1201,0)
	nt_setTask(1202,0)
	nt_setTask(1203,0)
	nt_setTask(1204,0)
	nt_setTask(1207,0)
	nt_setTask(1212,0)
	nt_setTask(1213,0)
	nt_setTask(1214,0)
	nt_setTask(1215,0)
	Msg2Player("��ɹ�������ʹ���� ")
	WriteLog(format("Account:%s[Name:%s] ������ʹ����",
			GetAccount(),
			GetName()
			)
		);
end

function no()
end

function check_daily_task_count()
	local nNormalTaskLimit = 2--һ�����ֻ����������ͨ����
	local nIBTaskLimit = 1--һ�����ֻ����1��IB����
	local nTodayCnt = %get_task_daily(1205)
	if nTodayCnt < nNormalTaskLimit then
		return 1--������ͨ�������
	elseif  nTodayCnt < (nNormalTaskLimit + nIBTaskLimit) then
		local nCountIb = CalcItemCount(-1, 6, 1, 2813, -1)
		if nCountIb >= 1 then
			return 2--����ʹ�õ��߱���
		else
			return -1--����ʹ�õ��ߵ�������û��
		end
	end
	return 0--û�����������
end
