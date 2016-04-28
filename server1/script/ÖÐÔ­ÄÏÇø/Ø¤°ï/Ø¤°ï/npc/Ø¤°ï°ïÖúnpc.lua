--Kh�i �ng�ɰ���NPC
-- By: Dan_Deng(2003-11-25)

Include("\\script\\global\\map_helper.lua")
npc_name = "Kh�i �ng"

function main(sel)
	UTask_gb = GetTask(8)
	player_faction = GetFaction()
	if (player_faction == "gaibang") then		-- ���ŵ���
		RestoreLife()		-- �����������
		RestoreMana()
		RestoreStamina()
		Say("Ta theo ����Kh�i �ng�Ѿ�50���ˣ�������Ҳ�Ǻΰ�����ʦ���ˡ���ʲô�����ľ�����.",6,"T�m hi�u vi�c c�a b�n bang/faction","T�m hi�u c�c v� trong b�n bang/member","T�m hi�u nhi�m v� /task_get","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Kh�ng h�i n�a!/nothing")
	elseif (UTask_gb >= 70*256) then				-- ���ų�ʦ
		Say("Ng��i xu�t s� �� m�y n�m, ch�ng l� v�n c�n nh� ���c nh�ng s� gian kh� l�c �� �? Kh�! Kh�! Kh�!",6,"�n l�i b�n m�n c� s� /faction","Th�m l�i huynh �� ��ng m�n/member","Ta c�n c� th� gi�p g� kh�ng/task_get","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Kh�ng h�i n�a!/nothing")
	elseif (player_faction ~= "") then			-- �Ǳ��ų�ʦ���������ɣ����ɲ�Ϊ�ռ�ָ�����֣�
		Say("��ӭ����Kh�i �ng! ��֪��ʲôָ��?",3,"T�m hi�u qu� bang/faction","T�m hi�u c�c v� anh h�ng/member","Kh�ng h�i n�a!/nothing")
	else													-- ����
		Say("Kh�i �ng��ӭ��λ�������־֮ʿ!",4,"T�m hi�u qu� bang/faction","T�m hi�u c�c v� anh h�ng/member","T�m hi�u �i�u ki�n nh�p m�n/task_get","Kh�ng h�i n�a!/nothing")
	end
end

----------------- ���ɽ��ܲ��� ----------------------------
function faction()
	Say("V�y th� ng��i mu�n nghe ta gi�i thi�u v� b� ph�n n�o c�a b�n bang? ",5,"Kh�i �ng����Դ/F1","V� tr� ��a l� /F2","��a v� giang h� /F3","��c s�c m�n ph�i/F4","Kh�ng h�i n�a!/nothing")
end

function F1()
	Say("L�ch s� c�a b�n bang �� c� t� l�u. T� l�c s� T�ng �� c� danh x�ng 'Thi�n h� �� nh�t bang' r�i. Danh ch�n giang h�, anh t�i c�a b�n bang nh� 'Ng�a h� t�ng long', th�i n�o c�ng c�!",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F2()
	Say("������������������ؤ���������Kh�i �ng!",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F3()
	Say("Kh�i �ng��Ϊ���µ�һ�������������. ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F4()
	Say("Kh�i �ng���ص��ǣ��ַ���������ļҲƣ�����Kh�i �ng����Ҫ�������мҲ������������Ϊ����ֲ��㷺�����ԣ���Ŀ�ڶ࣬��Ϣ��ʱ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

----------------- ��Ա���ܲ��� ----------------------------
function member()
	Say("Mu�n nghe ta gi�i thi�u v� n�o trong b�n bang?",11,"Bang ch� H� Nh�n Ng� /Mhe","Ch�p ph�p tr��ng l�o M�nh Th��ng L��ng/Mmeng","Ch��ng b�ng tr��ng l�o La Khu�ng Sinh/Mluo","Truy�n c�ng tr��ng l�o Ng�y Li�u �ng/Mwei","Ch��ng B�t tr��ng l�o X� Tam Tr��ng/Mshe","Tri�u �� ch� /Mzhao","M�nh Vi�n T�i/Myuan","Tr��ng T�n/Mzhang","L� T� /Mli","V��ng Ng� /Mwang","Kh�ng h�i n�a!/nothing")
end

function Mhe()
	Say("����������  λ�ã�Kh�i �ng�㳡   ����: 191,231<enter>��ź�ˬ��������ϸ���������������Ⱦƣ�������Զһ���ù���һ�����žƺ�����Ȼ�����ȵ������������Ǵ�����д��¾������Ϳ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mmeng()
	Say("ִ�������ϲ���   λ�ã�Kh�i �ng�㳡   ����: 194,236<enter>Ϊ�˹���������ִ����ɽ����ʱ���Եü����������顣�������ŵ��ֳ�������񣬶���������Զ��һֱʮ���۰�",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mluo()
	Say("�ư������޿���   λ�ã�Kh�i �ng�㳡   ����: 190,226<enter>Ϊ���Һ񡣳�Ĭ���ԣ�һ�����ԣ���һ���Ѫ�����ܼ������������ܼ���.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mwei()
	Say("��������κ����   λ�ã�Kh�i �ng�㳡   ����: 191,241<enter> ����𱬹�ֱ���������.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mshe()
	Say("�Ƴj����������   λ�ã�Kh�i �ng�㳡   ����: 189,236<enter> ʮ����Ϳ��׵�һ����ͷ����������˿���Ц���ǰ��е�����ϲ����һ�����ϡ�",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mzhao()
	Say("Tri�u �� ch�   V� tr�: D��ng Ch�u T� V�ng ��nh B�c   T�a ��: 213,177<enter> D��ng Ch�u l� �� ch� ph�n �� th� 3 � D��ng Ch�u, t�nh t�nh c�n th�n! Nghi�m minh ch�nh tr�c.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Myuan()
	Say("��Զ��   λ�ã�Kh�i �ng������ <enter> ���޴����ӣ���ִ�������ϲ��˵�ֶ�ӡ�ϲ������������λ���Ͻ�ѵ�����������ܴ�����˵������Ȥ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mzhang()
	Say("Tr��ng T�n   V� tr�: Qu�ng tr��ng   T�a ��: 48,84   Ph� tr�ch: Giao d�ch binh kh� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mli()
	Say("L� T�   V� tr�: Qu�ng tr��ng   T�a ��: 51,85   Ph� tr�ch: Giao d�ch trang b� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mwang()
	Say("V��ng Ng�   V� tr�: Qu�ng tr��ng   T�a ��: 53,86   Ph� tr�ch: Giao d�ch D��c ph�m",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

----------------- ������ܲ��� ----------------------------
function task_get()
	UTask_gb = GetTask(8)
	if (UTask_gb < 10*256) then	-- δ����
		Say("ng��i hi�n t�i ch�a nh�p m�n, n�u mu�n nh�p m�n, ch� c�n t�m ���c �� t� ti�p d�n b�n m�n � b�t k� th�n m�i n�o l� ���c, �� ���c ghi nh� "..UTask_gb..".",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_enroll","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_gb >= 10*256) and (UTask_gb < 20*256) then
		Say("Nhi�m v� hi�n gi� c�a ng��i l� nhi�m v� mua r��u, �� ���c ghi nh� "..UTask_gb..".",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L10","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_gb >= 20*256) and (UTask_gb < 30*256) then
		Say("Nhi�m v� hi�n gi� c�a ng��i l� nhi�m v� gi�o hu�n M�nh Vi�n T�i, �� ���c ghi nh� "..UTask_gb..".",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L20","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_gb >= 30*256) and (UTask_gb < 40*256) then
		Say("Nhi�m v� hi�n gi� c�a ng��i l� nhi�m v� N�o Qu� Phong Ba, �� ���c ghi nh� "..UTask_gb..".",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L30","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_gb >= 40*256) and (UTask_gb < 50*256) then
		Say("Nhi�m v� hi�n gi� c�a ng��i l� nhi�m v� b�o v� Tr��ng Tu�n, �� ���c ghi nh� "..UTask_gb..".",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L40","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_gb >= 50*256) and (UTask_gb < 60*256) then
		Say("Nhi�m v� hi�n gi� c�a ng��i l� nhi�m v� Trung Nguy�n ��a H�nh ��, �� ���c ghi nh� "..UTask_gb..".",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L50","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_gb >= 60*256) and (UTask_gb < 70*256) then
		Say("Nhi�m v� hi�n gi� c�a ng��i l� nhi�m v� Xu�t s�, �� ���c ghi nh� "..UTask_gb..".",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L60","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_gb >= 70*256) and (UTask_gb < 80*256) then
		Say("Nhi�m v� hi�n gi� c�a ng��i l� nhi�m v� Tr�ng ph�n s� m�n, �� ���c ghi nh� "..UTask_gb..".",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_return","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	else
		Say("B�y gi� ng��i c� th� t� do h�nh t�u giang h�, t�m th�i ch�a c� nhi�m v� m�i, �� ���c ghi nh� "..UTask_gb..".",3,"T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	end
end

function T_all()
	Say("Mu�n t�m hi�u nhi�m v� g�?",10,"Nhi�m v� nh�p m�n/T_enroll","Nhi�m v� mua r��u/T_L10","Nhi�m v� gi�o hu�n M�nh Vi�n T�i/T_L20","Nhi�m v� n�o qu� phong ba/T_L30","Nhi�m v� b�o h� Tr��ng Tu�n/T_L40","Nhi�m v� Trung nguy�n ��a ��/T_L50","Nhi�m v� xu�t s� /T_L60","Nhi�m v� tr�ng ph�n s� m�n/T_return","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Mu�n nh�p m�n h�c ngh�, ch� thu�c h� H�a, ch�a gia nh�p ph�i kh�c ��ng th�i ��ng c�p tr�n 10, ��n b�t k� T�n Th� Th�n n�o ��i tho�i v�i �� t� b�n ph�i.Tr��c ti�n ph�i ho�n th�nh nhi�m v� nh�p m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�!")
end

function T_L10()
	Talk(5,"t_all","���ż�10�����Ϻ�����Խ�����ȥ���׾ƣ�ͨ����������㽫��Ϊִ�����ӣ�ѧ���书<color=blue> Kh�i �ng����, Kh�i �ngȭ��<color>. ","B��c th� nh�t: ��n ch� c�a<color=blue> Bang ch� H� Nh�n Ng�<color> Ti�p nh�n nhi�m v�. �i mua 5 lo�i r��u n�i ti�ng: Trung Tuy�n < color=red>, Kim L�ng Xu�n, B�ch hoa n��ng, Kinh Hoa L�, Song C�u ��i Kh�c. <color>. ","B��c th� hai: G�p<color=blue> D��ng Ch�u t�u l�u <color> mua ���c 4 lo�i r��u, <color> nh�ng <color=red>c�n Trung Tuy�n t�u<color> th� �� b� T�y B�n Ti�n< color>��n mua tr��c r�i ","B��c th� ba: T�m<color=blue> ���c T�y B�n Ti�n <color>b�n c�nh t�u l�u <color=blue>. ��p �ng ���c nh�ng y�u c�u c�a h�n, <color=blue>nh�n ���c Trung Tuy�n T�u ","���Ĳ��� ���� <color=blue> Kh�i �ng <color>, ��<color=blue>������ color>�����־�<color=red>���� <color>�������")
end

function T_L20()
	Talk(4,"t_all","Sau khi ho�n th�nh nhi�m v� Giao d�ch r��u v� ��ng c�p c�a ng��i �� t�ng l�n c�p 20. ng��i �� c� th� ti�p Ti�p nh�n nhi�m v� gi�o hu�n M�nh Vi�n T�i. �i ��n ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� Ch�p B�t �� t� ���c h�c v� c�ng<color=blue>H�a Ki�m Vi Di<color>. ","��һ��: �� <color=blue> ���ִ�<color>��һλ<color=blue>Kh�i �ng����<color>, �������ѵ<color=blue>��Զ��<color>. ","B��c 2: T�m ���c M�nh Vi�n T�i, ��nh b�i h�n.","������: ����color=blue>Kh�i �ng<color>, ��<color=blue>�ϲ���<color>����, ������� ")
end

function T_L30()
	Talk(6,"t_all","Sau khi ho�n th�nh nhi�m v� gi�o hu�n M�nh Vi�n T�i v� ��ng c�p c�a ng��i �� t�ng l�n 30, ng��i �� c� th� ti�p Ti�p nh�n nhi�m v� N�o Qu� Phong Ba. �i ��n ho�n th�nh nhi�m v� n�y, ng��i ���c th�ng l� Ch�p B�ng �� t�. H�c ���c v� c�ng<color=blue>Gi�ng Long Ch��ng; �� C�u Tr�n<color>. ","B��c th� nh�t: ��n g�p<color=blue>La Khu�ng Sinh<color>, ti�p nh�n nhi�m v�, thay �ng ta ��n<color=blue> D��ng Ch�u g�p Tri�u �� ch� <color>�� l�y quy�n s�ch m� <color=red> �ng ta �ang vi�t d�<color>. ","B��c th� hai: ��n<color=blue>D��ng Ch�u T� V�ng ��nh<color>g�p ���c<color=blue>Tri�u �� ch�<color>, th� ra m�y ng�y nay �� t� c�a Tri�u ch� �<color=blue>Th�c c��ng s�n <color>�� g�y n�n nh�ng chuy�n n�o lo�n, g�y ra l�i ��m ti�u ","������: �iȥ<color=blue> ���ɽ<color>, ��ܽ��˵� <color=blue> ����<color>, ����Kh�i �ng����<color=blue> <color>. ","B��c th� t�: Tr� v�<color=blue>g�p<color>Tri�u �� ch�. �ng �y �� vi�t xong, <color=red>quy�n s�ch <color>, nh� ng��i �em v� giao cho <color=blue>La Khu�ng Sinh<color>. ","���岽: ����color=blue>Kh�i �ng<color>, ��<color=red>��<color> ��<color=blue>�޿���<color>, �������")
end

function T_L40()
	Talk(6,"t_all","Sau khi ho�n th�nh nhi�m v� N�o Qu� phong ba v� ��ng c�p c�a ng��i t�ng l�n c�p 40, th� ng��i �� c� th� ti�p nh�n nhi�m v� b�o h� Tr��ng Tu�n. Th�ng qua vi�c ho�n th�nh nhi�m v� n�y, ng��i s� ���c th�ng l� Long ��u �� t� ���c h�c v� c�ng<color=blue>ho�t B�t L�u Th�<color>. ","B��c th� nh�t: �i t�m Truy�n c�ng tr��ng l�o <color=blue>Ng�y T� c�ng<color>, Ti�p nh�n nhi�m v�: Ti�u di�t<color=blue>b�n s�t th�<color>ng��i Kim �ang <color=blue>mai ph�c � La Ti�u s�n <color>, b�o v� <color=blue>Tr��ng Tu�n<color>an to�n ","B��c th� hai: ��n <color=blue> Long Quan ��ng � La Ti�u s�n <color> t�m th�y v� ti�u di�t b�n s�t th� Kim qu�c<color=blue>�ang mai ph�c � ��<color>, ng��i nh�t ��nh ph�i l�y ���c m�t b�c <color=red>m�t h�m<color>. ","������: ����Kh�i �ng<color=blue>��<color>κ����, ��<color=red> �ܺ�<color> ��<color=blue>κ����<color>, ԭ���ܺ��м�¼�˳�͢������˹���Ĺ�Ա���֣�Ҫ���<color=red> �ܺ�<color>���� <color=blue>�ſ�<color>. ","B��c th� t�: ��n <color=blue> m�t l� qu�n b� m�t � D��ng Ch�u<color>t�m Tr��ng Tu�n<color=blue> <color>, giao b�c m�t h�m cho �ng �y. ","���岽 : ����<color=blue> Kh�i �ng<color>, ��<color=blue> κ����<color> ����, �������")
end

function T_L50()
	Talk(10,"t_all","Sau khi ho�n th�nh nhi�m v� b�o h� Tr��ng Tu�n v� ��ng c�p c�a ng��i �� t�ng l�n c�p 50, th� ng��i c� th� ti�p nh�n nhi�m v� B�n �� Trung Nguy�n. �i ��n ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� ��i Long ��u. H�c ���c v� c�ng<color=blue> B�ng �� �c C�u; Kh�ng Long H�u b�i <color>. ","B��c th� nh�t: ��n g�p bang ch�<color=blue>H� Nh�n Ng�<color>�� ti�p nh�n nhi�m v�. giao<color=red>b�c b�n �� Trung Nguy�n<color>mang ��n<color=blue>L�m An<color> giao cho tri�u ��nh ","B��c th� hai: Tr��c<color=blue>c�a Ho�ng Cung<color>, b� v� binh ng�n c�n, kh�ng c� l�nh b�i th�ng h�nh th� kh�ng th� v�o ���c Ho�ng cung ","B��c th� ba: T�m ���c <color=blue> Tr��ng Tu�n <color>, y�u c�u cho m��n t�m l�nh b�i th�ng h�nh <color=red>�� v�o Ho�ng Cung<color>. ","B��c th� t�: Tr� l�i<color=blue>tr��c c�a Ho�ng Cung<color>, sau khi ��i tho�i v�i v� binh, �i v�o Ho�ng Cung, g�p l�o th�i gi�m<color=blue>T�o c�ng c�ng<color>, giao <color=red>b�c b�n �� Trung Nguy�n <color> cho h�n ","B��c th� n�m: Quay l�i <color=blue> ch� <color> Tr��ng Tu�n, ph�t hi�n ra l�o T�o c�ng c�ng �� s�m �� c�u k�t v�i Kim qu�c. B�c b�n �� �� �� b� g�t l�y m�t r�i ","B��c th� s�u: L�n th� ba quay l�i <color=blue> c�ng Ho�ng cung <color>, l�n n�y T�o c�ng c�ng s�m �� �o�n tr��c, c� ���c l�nh b�i th�ng h�nh v�n kh�ng th� v�o ���c Ho�ng Cung. ","B��c th� b�y: ng��i ph�i h�i l� <color=blue> t�n ti�u th�i gi�m � c�ng b�n <color>, �i v�o Ho�ng cung l�n n�a t�i <color=blue> m�t m�t ��o � Ng� Hoa vi�n <color> t�m g�p ���c <color=blue>T�o c�ng c�ng<color>. Sau khi ��nh b�i b�n v� s�, �o�t l�i< color=red>B�n �� Trung Nguy�n<color>. ","B��c th� t�m: ng��i quay l�i <color=blue> g�p <color>Tr��ng Tu�n, ��a<color=red>b�c B�n �� Trung Nguy�n <color>cho �ng ta. ","�ھŲ�: ����color=blue>Kh�i �ng<color>, ��<color=blue>������color>����, ������� ")
end

function T_L60()
	Talk(4,"t_all","Ho�n th�nh nhi�m v� Trung Nguy�n ��a �� v� ��ng c�p tr�n 50, ng��i c� th� ti�p nh�n nhi�m v� xu�t s�. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l�m Ti�u Dao Th�n C�i, thu�n l�i xu�t s�.","B��c th� nh�t: ��n g�p Ch��ng B�t tr��ng l�o <color=blue>X� tam Tr��ng<color>�� ti�p nh�n nhi�m v�, <color=blue>T��ng V�n ��ng<color>�� t�m<color=red>9 c�i t�i v�i<color>. ","B��c th� hai: V�o<color=blue>T��ng V�n ��ng<color>t�m trong m�t c�i B�o r��ng<color=blue>t�m ���c<color>, 9 c�i<color=red>t�i v�i<color>. ","������: ����<color=blue>Kh�i �ng <color>, �� <color=red> 9 ������<color>���Ʋ�����<color=blue>������, <color>, �������")
end

function T_return()
	Talk(3,"t_all","Th�ng qua Tr�ng ph�n s� m�n, ng��i ���c th�ng l� tr��ng l�o 9 t�i. H�c ���c Tuy�t H�c ch�nh ph�i<color=blue>: Ti�u di�u c�ng v� T�y �i�p cu�ng v�<color>. ","��һ��: ����ȼ�����60����ȥ������<color=blue>������<color>, ���뷵��Kh�i �ng ","�ڶ���: ͨ����<color=red>50000 ��<color>, ����Kh�i �ng ")
end

----------------- ���� ---------------------------
function nothing()
end
