--������ ��������NPC

function main(sel)

if (GetLevel() <= 20) then
Say("�����ǲ��Խ׶�,����Ժ�ţB�Ŀ�������190���������ת��",3,"�������/shengji10");
function shengji10()
for i=1,10 do  AddOwnExp(500000000) end
    AddItem(0,13,4479,10,1,1000)
    AddItem(0,14,3889,10,1,1000)
    AddItem(0,12,3475,10,1,1000)
    Msg2Player("��ϲ��������������!")
end;	


   
else
Say("���Ѿ�190����,��ɳ��˰ɣ�",6,"���������/jwl","��ô�Ե¶/zml","�������/jb","���1000�㼼��/jn","ȡ��/no");
end
end;


function jwl()		
	AddItem(6,1,147,10,0,0) --����
        Msg2Player("��ϲ�����������")		
        end;	

function zml()		
	AddItem(6,1,124,1,0,0) --��Ե¶
        Msg2Player("��ϲ������ô�Ե¶")		
        end;
		
function jb()		
	Earn(200000000)           --����
        Msg2Player("��ϲ��!�������")
        end;
		

function jn()		
	AddMagicPoint(1000)
	Msg2Player(str[3])
	Msg2Player("��ϲ��!���1000�㼼��")
	return 0
	end

		
function no()					
end



