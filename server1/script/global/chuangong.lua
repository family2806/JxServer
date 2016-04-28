Include([[\script\global\�����õ�\�ξ�\npc\·��_��ɮ.lua]])
Include("\\script\\item\\levelup_item.lua")
Include("\\script\\global\\head_qianzhuang.lua")
Include("\\script\\global\\systemconfig.lua")
IncludeLib("SETTING")

TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr> ��c c� ki�m :<link>"
function cg_getnextdate(oldday, num) --���oldday�ĵ�num ng�y �� ng�y �ڣ�����060227�ĵ�5 ng�y Ϊ060304
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
		Say("S� li�u sai l�m .", 0)
		return
	end
	
	if (gb_GetModule("Truy�n c�ng ") ~= 1) then
		Say("�Բ���Truy�n c�ng ������ʱ�رգ��ٴο���ʱ��͹�ע�ٷ�����!", 0)
		return 
	end
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		Say("��c c� ki�m "..GetName().." �� l�u kh�ng g�p , h�m nay t�m ta c� chuy�n g� ? ",3, "�����������Truy�n c�ng �����顣/chuangong_info", "����ȡ���ϴε�Truy�n c�ng ����!/cg_undo", "Ta ch�ng qua l� t�i b�i ph�ng m�t c�i minh ch� ng��i m� th�i . /OnCancel")
	else
		Say("��c c� ki�m "..GetName().." �� l�u kh�ng g�p , h�m nay t�m ta c� chuy�n g� ? ",2, "�����������Truy�n c�ng �����顣/chuangong_info", "Ta ch�ng qua l� t�i b�i ph�ng m�t c�i minh ch� ng��i m� th�i . /OnCancel")
	end
end

function chuangong_info()
	if (gb_GetModule("Truy�n c�ng ") ~= 1) then
		Say("�Բ���Truy�n c�ng ������ʱ�رգ��ٴο���ʱ��͹�ע�ٷ�����!", 0)
		return 
	end
	local nowday = tonumber(date("%y%m%d"))
	local applytime = GetTask(TV_LAST_APPLY_TIME)
	if (applytime == 0) then
		Describe(strimg.."�������������Ѿã��ȼ���100����160�����ˣ��Ҷ����԰�����һ��Ĺ���ת��һ��'Ԫ��'��һ��10������û��������û�ݹ�ʦ����ֻҪ�������'Ԫ��'���ܻ��Truy�n c�ng �˵�һ��������Ȼһ�����깦�����书Ҳ������ȫ�ϣ�����Ҳ��ʣ��80����ˮƽ�ˡ��������������ޣ��ȼ�Խ�ߵ���Խ�ѽ����书ת��Ϊ'Ԫ��'������һ��100~120������Truy�n c�ng ʱ��������5%��121~150�������10%����150�����ϻ����20%��<color=yellow>������Щ�ѵ��ֵ�����Truy�n c�ng ��<color>", 2, "��ng v�y , ta �� du l�ch giang h� �� l�u , g�n nh�t mu�n tho�i �n . /chuangong_do", "D� nhi�n kh�ng ph�i , ch�ng qua l� t�i h�i th�m m�t ch�t m� th�i . /OnCancel");
	elseif (nowday >= applytime ) then
		Describe(strimg.."Truy�n c�ng ��׼���Ѿ�����."..itemstr..".\n ��ȷ��ҪTruy�n c�ng ����һ���ɾͲ��ܻ�ͷ�˰���<enter>6 th�ng 20 ng�y ����ʱ�ر�Truy�n c�ng ���룬6 th�ng 29 ng�y 24��00����ʱ�ر�Truy�n c�ng ���ܡ�", 3, "��ng v�y , l�ng ta � �� quy�t . /chuangong_dosure","��������ȡ��Truy�n c�ng ��/cg_undo", "Ch� ta suy ngh� th�m m�t �o�n ng�y �i . /OnCancel");
	else
		Describe(strimg.."������׼��Truy�n c�ng ����Ҫ�Ĳ��ϣ���Ҫ�� "..(num2datestr(applytime)).." sau m�i c� th� chu�n b� xong ,", 2, "Th�t l� phi�n to�i minh ch� li�u , v�n b�i � ch� n�y c�m �n /OnCancel", "��������ȡ��Truy�n c�ng ��/cg_undo");
	end
end



function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
	return year.." n�m "..month.." th�ng "..day.." ng�y "
end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then
		Describe(strimg.." ta ��n "..num2datestr(nowday).."�Ϳ���׼���ð���Truy�n c�ng �ˣ�����Ĳ��봫��<enter>6 th�ng 20 ng�y ����ʱ�ر�Truy�n c�ng ���룬6 th�ng 29 ng�y 24��00����ʱ�ر�Truy�n c�ng ���ܡ�",2,"�ǵģ��Ҳ���Truy�n c�ng �ˣ�/cg_undo_sure", "Kh�ng , ta c�n l� mu�n truy�n , m�i v�a r�i nh�t th�i kh�n tr��ng n�i sai r�i m� th�i . /OnCancel")
	else
		Describe(strimg.."��û�и���˵��ҪTruy�n c�ng ����û˵������ôȡ���أ�",1,"K�t th�c ��i tho�i /OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.." ���c r�i , v�y nh�ng th� n�y t�i li�u ta tr��c thu l�i , n�u nh� l�n sau mu�n truy�n l�i c�a n�a chu�n b� �i ",1,"C�m �n minh ch� /OnCancel")
end

function chuangong_do()
	local nEndLevel = GetLevel()
	local nRestExp = GetExp()
	if (nEndLevel < 100) then
		Describe(strimg.."�Ǻǣ���λС�ֵܣ��������ڵĹ����ƺ��������Դ��������ء�Truy�n c�ng ��Ҫ<color=yellow>100��<color>���ϣ��㻹��ȥ��ĥ��ĥ���ɡ�",1,"H�o ta bi�t /OnCancel")
		return
	end
	if (nEndLevel >= 160) then
		Describe(strimg.."�Ǻǣ���λ�ֵܣ�����160�������ǲ���Truy�n c�ng �ġ�",1,"H�o ta bi�t /OnCancel")
		return
	end
	
	local nLevelFullExp = tonumber(GetTabFileData(FILE_LEVEL, nEndLevel+ 1, 2))
	local fPerc = format("%.2f", (nEndLevel)+(nRestExp/nLevelFullExp))
	
	local str = strimg.."�������ڵ��书��Ϊ,���Truy�n c�ng �Ļ���ת��Ϊһ��<color=yellow>�ȼ�:"..fPerc.."<color> ��ch nguy�n th�n �an "
	str = str..client_main(nEndLevel, nRestExp)
	Describe(str..",��������Ҫ׼��һ������,��������ڼ���ʱ������ȡ��Truy�n c�ng ���Ͼ�һ�������䵽����̶Ȳ����ף����������ʱ��úÿ��ǿ��ǰ�",2,"Minh ch� , ta �� quy�t t�m quy �n , ng�i c� th� b�t ��u chu�n b� /chuangong_doprepair1","Nh� v�y a , v�y ta suy ngh� m�t ch�t n�a tr� l�i �i . /OnCancel")
end

function chuangong_doprepair1()
	local nowday = tonumber(date("%y%m%d"))
	local nextday = cg_getnextdate(nowday, 7)
	SetTask(TV_LAST_APPLY_TIME , nextday);
	WriteLog("[Truy�n c�ng ]��"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." ���Truy�n c�ng ���룡")
	Describe(strimg.."�ã����Ҽ���׼�����Truy�n c�ng ���ˣ�һ�����ں�<color=yellow>"..num2datestr(nextday).."<color>���������Ҹ�����ʽTruy�n c�ng ����Ȼ��Ҳ��ʱ������������ȡ��Truy�n c�ng ��", 1,"C�m �n minh ch� , v�y ta m�t tu�n l� sau tr� l�i /OnCancel")
	Msg2Player("���ѳɹ�����Truy�n c�ng ��һ�ܺ������Ҷ��½�������ʽ����Truy�n c�ng �������Ԫ�񵤣�Ҳ����ʱ�Ҷ��½�ȡ��Truy�n c�ng ���룡")
end

function chuangong_dosure()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("��ĵȼ�С��100���򳬹�160������Truy�n c�ng ��",0)
		return
	end
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		Say("�Բ���Truy�n c�ng ʱ�����ϲ���װ�κε�װ����������װ����Truy�n c�ng �ɣ�",0)
		return
	end
	Describe(strimg.."Truy�n c�ng ��Ҫ֧��2����Ʊ�����Ƿ��Ѿ����뱳����������ҪTruy�n c�ng �ˣ���ȷ��ҪTruy�n c�ng ��",2, "2 t�m ng�n phi�u �� chu�n b� xong , x�c ��nh /chuangong_doit1", "Ta suy ngh� th�m m�t ch�t /OnCancel")
end

function chuangong_doit1()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("��ĵȼ�С��100���򳬹�160������Truy�n c�ng ��",0)
		return
	end
	Describe(strimg.."��ȷ��һ�Σ�ע�⣺Truy�n c�ng ��ɺ���Ľ�ɫ�����Զ����ߡ����µ�����ڱ����м������Ԫ��һö��",2, "X�c ��nh /chuangong_doit", "Ta suy ngh� th�m m�t ch�t /OnCancel")
end

function chuangong_doit()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("��ĵȼ�С��100���򳬹�160������Truy�n c�ng ��",0)
		return
	end
	local result = qz_use_silver(2, "��Truy�n c�ng ��")
	if ( result == 0) then
		Describe(strimg.."��ı�����û��2����Ʊ���Ҳ��ܸ���Truy�n c�ng ��", 1, "Oh , th�t xin l�i , ta tr� v� chu�n b� /OnCancel")	
		return
	elseif (result ~= 1) then
		return 
	end
	SetTask(TV_LAST_APPLY_TIME, 0)
	
	local nowday = tonumber(date("%y%m%d"))
	
	local logstr = "[Truy�n c�ng ]��"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." Truy�n c�ng �ɹ���Level:"..GetLevel().." Exp:"..GetExp();
	
	
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