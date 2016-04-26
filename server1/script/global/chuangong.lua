Include([[\script\global\�����õ�\�ξ�\npc\·��_��ɮ.lua]])
Include("\\script\\item\\levelup_item.lua")
Include("\\script\\global\\head_qianzhuang.lua")
Include("\\script\\global\\systemconfig.lua")
IncludeLib("SETTING")

TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr>���½�:<link>"
function cg_getnextdate(oldday, num) --���oldday�ĵ�num�յ����ڣ�����060227�ĵ�5��Ϊ060304
	local nDay = tonumber(oldday)
	local nYear = floor(nDay / 10000)
	local nMonth = floor((nDay - nYear * 10000) / 100)
	nDay = nDay - nYear * 10000 - nMonth * 100 
	nDay = nDay + num
	
	while (nDay > TBMONTH[nMonth]) do
		nDay = nDay - TBMONTH[nMonth]
		if (nMonth == 12) then
			nMonth = 1
			nYear = nYear + 1
		else
			nMonth = nMonth + 1
		end
	end
	return (nYear * 10000 + nMonth * 100 + nDay)
end

function chuangong_main()
	-- VN_MODIFY_20060427
	if (1) then
		Say("���ݴ���.", 0)
		return
	end
	
	if (gb_GetModule("����") ~= 1) then
		Say("�Բ��𣬴���������ʱ�رգ��ٴο���ʱ��͹�ע�ٷ�����!", 0)
		return 
	end
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		Say("���½���"..GetName().."�þò����ˣ�����������ʲô�£�",3, "����������ڴ��������顣/chuangong_info", "����ȡ���ϴεĴ�������!/cg_undo", "��ֻ�����ݷ�һ����������ѡ�/OnCancel")
	else
		Say("���½���"..GetName().."�þò����ˣ�����������ʲô�£�",2, "����������ڴ��������顣/chuangong_info", "��ֻ�����ݷ�һ����������ѡ�/OnCancel")
	end
end

function chuangong_info()
	if (gb_GetModule("����") ~= 1) then
		Say("�Բ��𣬴���������ʱ�رգ��ٴο���ʱ��͹�ע�ٷ�����!", 0)
		return 
	end
	local nowday = tonumber(date("%y%m%d"))
	local applytime = GetTask(TV_LAST_APPLY_TIME)
	if (applytime == 0) then
		Describe(strimg.."�������������Ѿã��ȼ���100����160�����ˣ��Ҷ����԰�����һ��Ĺ���ת��һ��'Ԫ��'��һ��10������û��������û�ݹ�ʦ����ֻҪ�������'Ԫ��'���ܻ�ô����˵�һ��������Ȼһ�����깦�����书Ҳ������ȫ�ϣ�����Ҳ��ʣ��80����ˮƽ�ˡ��������������ޣ��ȼ�Խ�ߵ���Խ�ѽ����书ת��Ϊ'Ԫ��'������һ��100~120�����ﴫ��ʱ��������5%��121~150�������10%����150�����ϻ����20%��<color=yellow>������Щ�ѵ��ֵ����봫����<color>", 2, "�ǵģ����Ѿ����������Ѿã�����������ˡ�/chuangong_do", "��Ȼ���ǣ�ֻ��������һ�¶��ѡ�/OnCancel");
	elseif (nowday >= applytime ) then
		Describe(strimg.."������׼���Ѿ�����."..itemstr..".\n ��ȷ��Ҫ��������һ���ɾͲ��ܻ�ͷ�˰���<enter>6��20�պ���ʱ�رմ������룬6��29��24��00����ʱ�رմ������ܡ�", 3, "�ǵģ��������Ѿ���/chuangong_dosure","��������ȡ��������/cg_undo", "�����ٿ���һ�����Ӱɡ�/OnCancel");
	else
		Describe(strimg.."������׼����������Ҫ�Ĳ��ϣ���Ҫ�� "..(num2datestr(applytime)).." ֮�����׼���ã�,", 2, "�����鷳�����ˣ����ڴ�л����/OnCancel", "��������ȡ��������/cg_undo");
	end
end



function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
	return year.."��"..month.."��"..day.."��"
end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then
		Describe(strimg.."�ҵ�"..num2datestr(nowday).."�Ϳ���׼���ð��㴫���ˣ�����Ĳ��봫��<enter>6��20�պ���ʱ�رմ������룬6��29��24��00����ʱ�رմ������ܡ�",2,"�ǵģ��Ҳ��봫���ˣ�/cg_undo_sure", "�����һ���Ҫ�����ղ�һʱ����˵���˶��ѡ�/OnCancel")
	else
		Describe(strimg.."��û�и���˵��Ҫ��������û˵������ôȡ���أ�",1,"�����Ի�/OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.."�ðɣ�����Щ���������������ˣ�����´�Ҫ���Ļ���׼���ɣ�",1,"лл������/OnCancel")
end

function chuangong_do()
	local nEndLevel = GetLevel()
	local nRestExp = GetExp()
	if (nEndLevel < 100) then
		Describe(strimg.."�Ǻǣ���λС�ֵܣ��������ڵĹ����ƺ��������Դ��������ء�������Ҫ<color=yellow>100��<color>���ϣ��㻹��ȥ��ĥ��ĥ���ɡ�",1,"����֪���ˣ�/OnCancel")
		return
	end
	if (nEndLevel >= 160) then
		Describe(strimg.."�Ǻǣ���λ�ֵܣ�����160�������ǲ��ܴ����ġ�",1,"����֪���ˣ�/OnCancel")
		return
	end
	
	local nLevelFullExp = tonumber(GetTabFileData(FILE_LEVEL, nEndLevel+ 1, 2))
	local fPerc = format("%.2f", (nEndLevel)+(nRestExp/nLevelFullExp))
	
	local str = strimg.."�������ڵ��书��Ϊ,��������Ļ���ת��Ϊһ��<color=yellow>�ȼ�:"..fPerc.."<color>��Ԫ��"
	str = str..client_main(nEndLevel, nRestExp)
	Describe(str..",��������Ҫ׼��һ������,��������ڼ���ʱ������ȡ���������Ͼ�һ�������䵽����̶Ȳ����ף����������ʱ��úÿ��ǿ��ǰ�",2,"���������Ѿ��Ĺ����������Կ�ʼ׼���ˣ�/chuangong_doprepair1","�������������ٿ��ǿ��������ɡ�/OnCancel")
end

function chuangong_doprepair1()
	local nowday = tonumber(date("%y%m%d"))
	local nextday = cg_getnextdate(nowday, 7)
	SetTask(TV_LAST_APPLY_TIME , nextday);
	WriteLog("[����]��"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." ����������룡")
	Describe(strimg.."�ã����Ҽ���׼����Ĵ������ˣ�һ�����ں�<color=yellow>"..num2datestr(nextday).."<color>���������Ҹ�����ʽ��������Ȼ��Ҳ��ʱ������������ȡ��������", 1,"лл����������һ���ں�������/OnCancel")
	Msg2Player("���ѳɹ����봫����һ�ܺ������Ҷ��½�������ʽ���д����������Ԫ�񵤣�Ҳ����ʱ�Ҷ��½�ȡ���������룡")
end

function chuangong_dosure()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("��ĵȼ�С��100���򳬹�160�����ܴ�����",0)
		return
	end
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		Say("�Բ��𣬴���ʱ�����ϲ���װ�κε�װ����������װ���ٴ����ɣ�",0)
		return
	end
	Describe(strimg.."������Ҫ֧��2����Ʊ�����Ƿ��Ѿ����뱳����������Ҫ�����ˣ���ȷ��Ҫ������",2, "2����Ʊ�Ѿ�׼���ã�ȷ����/chuangong_doit1", "���ٿ���һ��/OnCancel")
end

function chuangong_doit1()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("��ĵȼ�С��100���򳬹�160�����ܴ�����",0)
		return
	end
	Describe(strimg.."��ȷ��һ�Σ�ע�⣺������ɺ���Ľ�ɫ�����Զ����ߡ����µ�����ڱ����м������Ԫ��һö��",2, "ȷ����/chuangong_doit", "���ٿ���һ��/OnCancel")
end

function chuangong_doit()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("��ĵȼ�С��100���򳬹�160�����ܴ�����",0)
		return
	end
	local result = qz_use_silver(2, "�۴�����")
	if ( result == 0) then
		Describe(strimg.."��ı�����û��2����Ʊ���Ҳ��ܸ��㴫����", 1, "�ޣ��Բ����һ�ȥ׼��/OnCancel")	
		return
	elseif (result ~= 1) then
		return 
	end
	SetTask(TV_LAST_APPLY_TIME, 0)
	
	local nowday = tonumber(date("%y%m%d"))
	
	local logstr = "[����]��"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." �����ɹ���Level:"..GetLevel().." Exp:"..GetExp();
	
	
	DoClearSkillCore()
	DoClearPropCore()
	UpdateSkill()
	local endlevel = GetLevel()
	local restexp = GetExp()
	
	ST_LevelUp(80 - endlevel)
	local param5 = chuangong_item(endlevel, restexp)
	logstr = logstr.." ItemParam5:"..param5
	WriteLog(logstr)
end

function chuangong_item(level,restexp)
	if (restexp <0) then
		restexp = 0
	end
	
	nIt = AddItem(6,1,1061,1,0,0,0)
	SetItemMagicLevel(nIt, 1, level)
	SetItemMagicLevel(nIt, 2, restexp)

	m1 = GetByte(restexp, 3)
	m2 = GetByte(restexp, 4)
	m = m1
	m = SetByte(m1, 2, m2)
	
	n1 = SetByte(restexp, 3,0)
	n =  SetByte(n1, 4, 0)

	SetItemMagicLevel(nIt, 3, m)
	SetItemMagicLevel(nIt, 4, n)
	SetItemMagicLevel(nIt, 5, FileName2Id(GetName()))
	SyncItem(nIt)
	return GetItemParam(nIt, 5)
end

function OnCancel()
end