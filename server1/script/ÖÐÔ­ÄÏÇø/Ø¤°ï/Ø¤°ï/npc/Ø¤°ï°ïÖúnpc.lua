--ؤ���ɰ���NPC
-- By: Dan_Deng(2003-11-25)

Include("\\script\\global\\map_helper.lua")
npc_name = "ؤ��"

function main(sel)
	UTask_gb = GetTask(8)
	player_faction = GetFaction()
	if (player_faction == "gaibang") then		-- ���ŵ���
		RestoreLife()		-- �����������
		RestoreMana()
		RestoreStamina()
		Say("Ta theo ����ؤ���Ѿ�50���ˣ�������Ҳ�Ǻΰ�����ʦ���ˡ���ʲô�����ľ�����.",6,"�˽Ȿ��/faction","�˽Ȿ������/member","�˽����� /task_get","�˽������س�/map_help","�˽Ȿ������/skill_help","������!/nothing")
	elseif (UTask_gb >= 70*256) then				-- ���ų�ʦ
		Say("���ʦ���м��꣬�ѵ����ǵ���ʱ�ļ���𣿺ǺǺ� ",6,"��ϰ���Ź��� /faction","����ͬ���ֵ�/member","�һ����԰�ʲô��/task_get","�˽������س�/map_help","�˽Ȿ������/skill_help","������!/nothing")
	elseif (player_faction ~= "") then			-- �Ǳ��ų�ʦ���������ɣ����ɲ�Ϊ�ռ�ָ�����֣�
		Say("��ӭ����ؤ��! ��֪��ʲôָ��?",3,"�˽���/faction","�˽��λӢ��/member","������!/nothing")
	else													-- ����
		Say("ؤ�ﻶӭ��λ�������־֮ʿ!",4,"�˽���/faction","�˽��λӢ��/member","�˽���������/task_get","������!/nothing")
	end
end

----------------- ���ɽ��ܲ��� ----------------------------
function faction()
	Say("�������������ĸ�����? ",5,"ؤ�����Դ/F1","����λ�� /F2","������λ /F3","������ɫ/F4","������!/nothing")
end

function F1()
	Say("������ʷ�ƾã����γ���ʼ�������µ�һ��ĳƺ��ˡ����𽭺�������Ӣ�����Ի��������ĸ�ʱ������ ",2,"�˽���������/main","������!/nothing")
end

function F2()
	Say("������������������ؤ���������ؤ��!",2,"�˽���������/main","������!/nothing")
end

function F3()
	Say("ؤ���Ϊ���µ�һ�������������. ",2,"�˽���������/main","������!/nothing")
end

function F4()
	Say("ؤ����ص��ǣ��ַ���������ļҲƣ�����ؤ���Ҫ�������мҲ������������Ϊ����ֲ��㷺�����ԣ���Ŀ�ڶ࣬��Ϣ��ʱ",2,"�˽���������/main","������!/nothing")
end

----------------- ��Ա���ܲ��� ----------------------------
function member()
	Say("���ҽ����ĸ�?",11,"���������� /Mhe","ִ�������ϲ���/Mmeng","�ư������޿���/Mluo","��������κ����/Mwei","�Ƴj����������/Mshe","�Զ��� /Mzhao","��Զ��/Myuan","����/Mzhang","���� /Mli","���� /Mwang","������!/nothing")
end

function Mhe()
	Say("����������  λ�ã�ؤ��㳡   ����: 191,231<enter>��ź�ˬ��������ϸ���������������Ⱦƣ�������Զһ���ù���һ�����žƺ�����Ȼ�����ȵ������������Ǵ�����д��¾������Ϳ",2,"�˽���������/main","������!/nothing")
end

function Mmeng()
	Say("ִ�������ϲ���   λ�ã�ؤ��㳡   ����: 194,236<enter>Ϊ�˹���������ִ����ɽ����ʱ���Եü����������顣�������ŵ��ֳ�������񣬶���������Զ��һֱʮ���۰�",2,"�˽���������/main","������!/nothing")
end

function Mluo()
	Say("�ư������޿���   λ�ã�ؤ��㳡   ����: 190,226<enter>Ϊ���Һ񡣳�Ĭ���ԣ�һ�����ԣ���һ���Ѫ�����ܼ������������ܼ���.",2,"�˽���������/main","������!/nothing")
end

function Mwei()
	Say("��������κ����   λ�ã�ؤ��㳡   ����: 191,241<enter> ����𱬹�ֱ���������.",2,"�˽���������/main","������!/nothing")
end

function Mshe()
	Say("�Ƴj����������   λ�ã�ؤ��㳡   ����: 189,236<enter> ʮ����Ϳ��׵�һ����ͷ����������˿���Ц���ǰ��е�����ϲ����һ�����ϡ�",2,"�˽���������/main","������!/nothing")
end

function Mzhao()
	Say("�Զ���  λ�ã���������ͤ��  ����: 213,177<enter>���������������ֱ.",2,"�˽���������/main","������!/nothing")
end

function Myuan()
	Say("��Զ��   λ�ã�ؤ�������� <enter> ���޴����ӣ���ִ�������ϲ��˵�ֶ�ӡ�ϲ������������λ���Ͻ�ѵ�����������ܴ�����˵������Ȥ",2,"�˽���������/main","������!/nothing")
end

function Mzhang()
	Say("����   λ�ã��㳡   ����: 48,84   ����: ���ױ��� ",2,"�˽���������/main","������!/nothing")
end

function Mli()
	Say("����  λ�ã��㳡   ����: 51,85   ����: ����װ��",2,"�˽���������/main","������!/nothing")
end

function Mwang()
	Say("����  λ�ã��㳡   ����: 53,86   ����: ����ҩƷ",2,"�˽���������/main","������!/nothing")
end

----------------- ������ܲ��� ----------------------------
function task_get()
	UTask_gb = GetTask(8)
	if (UTask_gb < 10*256) then	-- δ����
		Say("������δ�������ɣ���������ţ�ֻ��Ҫ�ҵ����Ž������ӣ����²���壬��ס"..UTask_gb..".",4,"�����˽�Ŀǰ����/T_enroll","�˽���������/T_all","�˽���������/main","������!/nothing")
	elseif (UTask_gb >= 10*256) and (UTask_gb < 20*256) then
		Say("Ŀǰ������������, �Ѽ�ס "..UTask_gb..".",4,"�����˽�Ŀǰ����/T_L10","�˽���������/T_all","�˽���������/main","������!/nothing")
	elseif (UTask_gb >= 20*256) and (UTask_gb < 30*256) then
		Say("Ŀǰ��������ǽ�ѵ��Զ��, �Ѽ�ס"..UTask_gb..".",4,"�����˽�Ŀǰ����/T_L20","�˽���������/T_all","�˽���������/main","������!/nothing")
	elseif (UTask_gb >= 30*256) and (UTask_gb < 40*256) then
		Say("Ŀǰ����������ֹ�粨, �Ѽ�ס"..UTask_gb..".",4,"�����˽�Ŀǰ����/T_L30","�˽���������/T_all","�˽���������/main","������!/nothing")
	elseif (UTask_gb >= 40*256) and (UTask_gb < 50*256) then
		Say("Ŀǰ��������Ǳ����ſ�, �Ѽ�ס"..UTask_gb..".",4,"�����˽�Ŀǰ����/T_L40","�˽���������/T_all","�˽���������/main","������!/nothing")
	elseif (UTask_gb >= 50*256) and (UTask_gb < 60*256) then
		Say("Ŀǰ�����������ԭ����ͼ, �Ѽ�ס"..UTask_gb..".",4,"�����˽�Ŀǰ����/T_L50","�˽���������/T_all","�˽���������/main","������!/nothing")
	elseif (UTask_gb >= 60*256) and (UTask_gb < 70*256) then
		Say("Ŀǰ��������ǳ�ʦ �Ѽ�ס"..UTask_gb..".",4,"�����˽�Ŀǰ����/T_L60","�˽���������/T_all","�˽���������/main","������!/nothing")
	elseif (UTask_gb >= 70*256) and (UTask_gb < 80*256) then
		Say("Ŀǰ����������ط�ʦ��, �Ѽ�ס"..UTask_gb..".",4,"�����˽�Ŀǰ����/T_return","�˽���������/T_all","�˽���������/main","������!/nothing")
	else
		Say("����������������߽�������ʱû������, �Ѽ�ס"..UTask_gb..".",3,"�˽���������/T_all","�˽���������/main","������!/nothing")
	end
end

function T_all()
	Say("���˽�ʲô���� ",10,"��������/T_enroll","�������/T_L10","�����ѵ��Զ��/T_L20","�����ֹ�粨/T_L30","�������ſ�/T_L40","������ԭ��ͼ��/T_L50","�����ʦ/T_L60","�����ط�ʦ��/T_return","�˽���������/main","������!/nothing")
end

function T_enroll()
	Talk(1,"t_all","������ѧ���գ�ֻ����ϵ���ʼ����������ɣ�ͬʱ�ȼ�Ϊ10�����ϣ����������ִ�ͱ��ɵ��ӶԻ�������Ҫ�����������Ȼ���������5�����񣬽�ѧ���书����ƺš���ɳ�ʦ������ճɳ�ʦ")
end

function T_L10()
	Talk(5,"t_all","���ż�10�����Ϻ�����Խ�����ȥ���׾ƣ�ͨ����������㽫��Ϊִ�����ӣ�ѧ���书<color=blue> ؤ�����, ؤ��ȭ��<color>. ","��һ������<color=blue> ���������Ҵ�<color> �����������־�: ��Ȫ <color=red>, ���괺, �ٻ���,����¶��˫�Դ���. <color>. ","�ڶ���: ��<color=blue> ���ݾ�¥<color> �����־�, <color> ���� <color=red>������Ȫ��<color> �������< color>��ȥ��","������: ��<color=blue> ��������� <color>��¥�Ա�<color=blue>. ��Ӧ����Ҫ��, <color=blue>�õ���Ȫ��","���Ĳ��� ���� <color=blue> ؤ�� <color>, ��<color=blue>������ color>�����־�<color=red>���� <color>�������")
end

function T_L20()
	Talk(4,"t_all","����������׾ƺ���ĵȼ���Ϊ20. ����Խ������ѵ��Զ��. �iȥ��ɴ�����, �㱻��Ϊִ�����ӣ�ѧ���书<color=blue>����΢��<color>. ","��һ��: �� <color=blue> ���ִ�<color>��һλ<color=blue>ؤ�����<color>, �������ѵ<color=blue>��Զ��<color>. ","�ڶ���: �ҵ���Զ��, �����.","������: ����color=blue>ؤ��<color>, ��<color=blue>�ϲ���<color>����, ������� ")
end

function T_L30()
	Talk(6,"t_all","����������ѵ��Զ�ź� ��ĵȼ���Ϊ 30, ����Խ������ֹ�粨. �iȥ��ɴ�����, �㱻��Ϊִ�����ӣ� ѧ���书<color=blue>������; ����<color>. ","��һ��: ��<color=blue>�޿���<color>, ����������ȥ<color=blue> ���ݼ��Զ���<color>���û�<color=red> ��д����color>. ","�ڶ���: ��<color=blue>��������ͤ<color>����<color=blue>�Զ���color>, ԭ����Щ�죬�Զ����ĵ�����color=blue>���ɽ <color>����","������: �iȥ<color=blue> ���ɽ<color>, ��ܽ��˵� <color=blue> ����<color>, ����ؤ�����<color=blue> <color>. ","���Ĳ��� ����color=blue>��<color>�Զ���������д��, <color=red>��<color>, �����ȥ��<color=blue>�޿���<color>. ","���岽: ����color=blue>ؤ��<color>, ��<color=red>��<color> ��<color=blue>�޿���<color>, �������")
end

function T_L40()
	Talk(6,"t_all","����������ֹ�粨�� ��ĵȼ���Ϊ 40, ����Խ��������ſ�. ͨ��vi�c ��ɴ�����, �㱻��Ϊ��ͷ���ӣ�ѧ���书<color=blue>�����color>. ","��һ��: �i �Ҵ�������<color=blue>κ����<color>, ����������<color=blue>ɱ��color>����<color=blue>���������ɽ<color>, ����<color=blue>�ſ�<color>��ȫ","�ڶ���: �� <color=blue> ���ڶ�<color> �ҵ����ɱ�ֲ�����<color=blue>�����ɱ��<color>, ��һ��Ҫ�õ�<color=red>�ܺ�<color>. ","������: ����ؤ��<color=blue>��<color>κ����, ��<color=red> �ܺ�<color> ��<color=blue>κ����<color>, ԭ���ܺ��м�¼�˳�͢������˹���Ĺ�Ա���֣�Ҫ���<color=red> �ܺ�<color>���� <color=blue>�ſ�<color>. ","���Ĳ��� �� <color=blue> ����һ�������ù�<color>���ſ�<color=blue> <color>, ���ܺ�����. ","���岽 : ����<color=blue> ؤ��<color>, ��<color=blue> κ����<color> ����, �������")
end

function T_L50()
	Talk(10,"t_all","������������ſ��� ��ĵȼ���Ϊ50, ����Խ�������ԭ��ͼ. �iȥ��ɴ�����, �㱻��Ϊ����ͷ. ѧ���书<color=blue> ����񹷣������л�<color>. ","��һ��: ������color=blue>������color>�� �������<color=red>��ԭ��ͼ<color>��<color=blue>�ٰ�<color> ������͢","�ڶ���: ��<color=blue>�ʹ���ǰ<color>, ���������£�û�����ƣ������˻ʹ�","������: �ҵ� <color=blue> �ſ� <color>, Ҫ����������<color=red>�ӽ�ʹ�<color>. ","���Ĳ��� ����<color=blue>�ʹ���ǰ<color>, �ں������Ի��󣬽���ʹ�������̫��<color=blue>�ܹ���<color>, �� <color=red>��ԭ��ͼ <color> ����","���岽: ���� <color=blue> ȥ<color> �ſ���,���ֲܹ����Ѻͽ��˹��ᣬ��ͼ�ѱ�ƭ��","������: �����η��� <color=blue> �ʹ���ǰ <color>, �˴Σ��ܹ�������֪����������Ҳ���ܽ��ʹ�. ","���߲�����Ҫ��¸<color=blue> С̫��<color>, ��һ�ν���ʹ�<color=blue> ������԰��һ���ܵ�<color> ���� <color=blue>�ܹ���<color>. �ڴ�������󣬶��< color=red>��ԭ��ͼ<color>. ","�ڰ˲������� <color=blue> �� <color>�ſ�, ��<color=red>b��ԭ��ͼ <color>����. ","�ھŲ�: ����color=blue>ؤ��<color>, ��<color=blue>������color>����, ������� ")
end

function T_L60()
	Talk(4,"t_all","���������ԭ��ͼ�󣬮� �ȼ�50����, ����Խ������ʦ ͨ����ɴ�����, �㱻��Ϊ��ң��ؤ��˳����ʦ","��һ��: ���Ʋ�����<color=blue>������<color>�� ������ <color=blue>���ƶ�<color>�� ��<color=red>9������<color>. ","�ڶ���: ��<color=blue>���ƶ�<color>��һ������<color=blue>�ҵ�<color>, 9 ��<color=red>����<color>. ","������: ����<color=blue>ؤ�� <color>, �� <color=red> 9 ������<color>���Ʋ�����<color=blue>������, <color>, �������")
end

function T_return()
	Talk(3,"t_all","ͨ���ط�ʦ��, �㱻��Ϊ9�����ϡ�ѧ�����ɾ�ѧ<color=blue>: ��ң�������ڿ��<color>. ","��һ��: ����ȼ�����60����ȥ������<color=blue>������<color>, ���뷵��ؤ�� ","�ڶ���: ͨ����<color=red>50000 ��<color>, ����ؤ�� ")
end

----------------- ���� ---------------------------
function nothing()
end
