function givemedicine()
	Say("���������治���ҽ��㣡���ҿ��������ҳ�ʲô��!",5, "�������/givegod", "�׻��Ǿ�/givetiger", "��¹�׾�/giveantler", "���˲ξ�/givepanax", "ʦ����ζ����ô����/no");
end

function givegod()
	if(GetItemCountEx(947) >= 1) then
		local i = random(1,3)
		if(i > 1) then
			DelItemEx(947);	
			AddItem(6,1,73,1,0,0);
			Say("�þƣ��þƣ�����ٹ�¶�͸��㣬лл���͸��Һþƣ�������!",0);
			Msg2Player("���һ���ٹ�¶");
			WriteLog(date("%H%M%S")..": �˺�"..GetAccount()..",����"..GetName().."���ڽ�ʦ�ڻ�õ�1���ٹ�¶��");				
		else
			DelItemEx(947);
			Say("��ƿ�ƺ��񻹲����ã���������Ҫ����ȥ�ٷ�һ����ܷ�������ҩ��",0);
		end
	else
		Say("�����ȥ���ˣ������ȥ���ˣ���Ҫ����������������ˣ�", 0);
	end
end

function givetiger()
	if(GetItemCountEx(948) >= 1) then
		local i = random(1,12)
		if(i > 7) then
			DelItemEx(948);	
			AddItem(6,1,72,1,0,0);
			Say("�þƣ��þƣ���ɽ��¶�͸��㣡лл�����Һþƣ�������!",0);
			Msg2Player("�����һ����ɽ��¶");
			WriteLog(date("%H%M%S")..": �˺�"..GetAccount()..", ����"..GetName().."���ڽ�ʦ�ڻ�õ�1����ɽ��¶��");			
		else
			DelItemEx(948);
			Say("��ƿ�ƺ��񻹲����ã���������Ҫ����ȥ�ٷ�һ����ܷ�������ҩ��",0);
		end	
	else
		Say("���Ǿ�ȥ���ˣ����Ǿ�ȥ���ˣ���Ҫ�����������������", 0);
	end
end

function giveantler()
	if(GetItemCountEx(949) >= 1) then
		local i = random(1,4)
		if(i > 1) then
			DelItemEx(949);	
			AddItem(6,1,125,1,0,0);
			Say("�þƣ��þƣ��𻨾��͸��㣡лл�����Һþƣ�������!",0);
			Msg2Player("���һƿ�𻨾�");
			WriteLog(date("%H%M%S")..": �˺�"..GetAccount()..",����"..GetName().."���ڽ�ʦ�ڻ�õ�1ƿ�𻨾ơ�");			
		else
			DelItemEx(949);
			Say("��ƿ�ƺ��񻹲����ã���������Ҫ����ȥ�ٷ�һ����ܷ�������ҩ��",0);
		end		
	else
		Say("¹�׾�ȥ���ˣ�¹�׾�ȥ���ˣ���Ҫ�����������������", 0);
	end
end

function givepanax()
	if(GetItemCountEx(950) >= 1) then
		local i = random(1,5)
		if(i > 1) then
			DelItemEx(950);	
			AddItem(6,1,71,1,0,0);
			Say("�þƣ��þƣ��ɲ�¶�͸��㣡лл�����Һþƣ�������!",0);
			Msg2Player("���һ���ɲ�¶");
			WriteLog(date("%H%M%S")..": �˺�"..GetAccount()..", ����"..GetName().."���ڽ�ʦ�ڻ�õ�1ƿ�ɲ�¶��");			
		else
			DelItemEx(950);
			Say("��ƿ�ƺ��񻹲����ã���������Ҫ����ȥ�ٷ�һ����ܷ�������ҩ��",0);
		end	
	else
		Say("�˲ξ�ȥ���ˣ��˲ξ�ȥ���ˣ���Ҫ�����������������", 0);
	end
end
