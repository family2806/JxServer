function brew()
	Say("�������ҩ��Զ���������͹����������ҩ�ƣ�", 6, "�����/god", "���Ǿ�/tiger", "¹�׾�/antler", "�˲ξ�/panax", "����֪������ҩ�Ƶķ���!/aboutbrewing", "��Ҫȥ����ҩ��/no");
end

function god()
	Say("�������Ҫ��3����֥�ݣ��͹��Ѿ���ҩ������?",2, "���ˣ�ʦ�����֤���Ҵ������!/godyes", "����Ҫȥ����ҩ��/no");
end

function tiger()
	Say("������Ҫһ����֥�ݺ�3��¹�ף��͹��Ѿ���ҩ������?",2, "���ˣ�ʦ�����֤���Ҵ������!/tigeryes", "����Ҫȥ����ҩ��/no");
end

function antler()
	Say("¹�׾���Ҫһ����֥�ݺ�3��¹��.�͹��Ѿ���ҩ������?",2, "���ˣ�ʦ�����֤���Ҵ������!/antleryes", "����Ҫȥ����ҩ��/no");
end

function panax()
	Say("�˲ξ���Ҫһ����֥�ݺ�3��¹��. �͹��Ѿ���ҩ������?",2, "���ˣ�ʦ�����֤���Ҵ������!/panaxyes", "����Ҫȥ����ҩ��/no");
end

function godyes()
	if(GetItemCountEx(943) >= 3) then
		local i = random(1,4);
		if(i > 1) then
			for j=1, 3 do 
				DelItemEx(943);			
			end
			AddEventItem(947);
			Say("�ϵ���֥�ݼ����ҵļҴ����飬�������û��˭���Ƴ���!",0);
			Msg2Player("Nh�n ���c 1 b�nh Ti�n Linh t�u");
			WriteLog(date("%H%M%S")..": �˺�"..GetAccount()..", ����"..GetName().."�����Ƴ���1ƿ����ơ�");
		else
			DelItemEx(943);
			Say("��һ����֥δ����ݣ���ҩ��������͹���Ŭ���������İɣ��������",0);
		end
	else
		Say("�͹���Ȼδ��ҩ�ϣ���ԭ���Ҳ��ܰ�æ!",0);
	end
end

function tigeryes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(944) >= 3) then
		local i = random(1, 5);
		if(i > 2) then
			for j=1, 3 do 
				DelItemEx(944);			
			end
			DelItemEx(943);	
			AddEventItem(948);
			Say("Linh ��֥�ݺ��ϵȻ��Ǽ����ҵļҴ����飬�û��Ǿ�û��˭���Ƴ���!",0);
			Msg2Player("���һƿ���Ǿ�");
			WriteLog(date("%H%M%S")..": �˺�"..GetAccount()..", ����"..GetName().."�����Ƴ���1ƿ���Ǿơ�");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("��һ����֥δ����ݣ���ҩ��������͹���Ŭ���������İɣ��������",0);		
			else
				DelItemEx(944);
				Say("�û���δ����ݣ���ҩ��������͹���Ŭ���������İɣ��������",0);
			end		
		end					
	else
		Say("�͹���Ȼδ��ҩ�ϣ���ԭ���Ҳ��ܰ�æ!",0);
	end
end

function antleryes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(945) >= 3) then
		local i = random(1, 2);
		if(i == 1) then
			for j=1, 3 do 
				DelItemEx(945);			
			end
			DelItemEx(943);	
			AddEventItem(949);
			Say("��֥�ݺ��ϵ�¹�׼����ҵļҴ����飬��¹�׾�û��˭���Ƴ���!",0);
			Msg2Player("���һƿ¹�׾�");	
			WriteLog(date("%H%M%S")..": �˺�"..GetAccount()..", ����"..GetName().."�����Ƴ���1ƿ¹�׾ơ�");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("��һ����֥δ����ݣ���ҩ��������͹���Ŭ���������İɣ��������",0);		
			else
				DelItemEx(945);
				Say("��һ��¹��δ����ݣ���ҩ��������͹���Ŭ���������İɣ��������",0);
			end		
		end			
	else
		Say("�͹���Ȼδ��ҩ�ϣ���ԭ���Ҳ��ܰ�æ!",0);
	end
end

function panaxyes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(946) >= 3) then
		local i = random(1, 4);
		if(i > 1) then
			for j=1, 3 do 
				DelItemEx(946);			
			end
			DelItemEx(943);	
			AddEventItem(950);
			Say("��֥�ݺ��ϵ��˲μ����ҵļҴ����飬��¹�׾�û��˭���Ƴ���!",0);
			Msg2Player("���һƿ�˲ξ�");
			WriteLog(date("%H%M%S")..": �˺�"..GetAccount()..", ����"..GetName().."�����Ƴ���1ƿ�˲ξơ�");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("��һ����֥δ����ݣ���ҩ��������͹���Ŭ���������İɣ��������",0);		
			else
				DelItemEx(946);
				Say("��һ���˲�δ����ݣ���ҩ��������͹���Ŭ���������İɣ��������",0);
			end			
		end
	else
		Say("�͹���Ȼδ��ҩ�ϣ���ԭ���Ҳ��ܰ�æ!",0);
	end
end

function aboutbrewing()
	Say("����ֻ������㹻�ϵ�ҩ�ϵ�ҩ��. <enter>�������Ҫ��3����֥��.<enter>���Ǿ���Ҫ��1����֥�ݺ�3������.<enter>¹�׾���Ҫ��һ����֥�ݺ�3��¹��.<enter>�˲ξ���Ҫ��1����֥�ݺ�3���˲�.",0);
end