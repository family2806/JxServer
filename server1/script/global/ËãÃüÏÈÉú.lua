-- ��������.lua ������ֵ����������
-- By Dan_Deng(2003-11-11)

sexhead = {"Nam","N� "}

Include("\\script\\global\\repute_head.lua")

function main()
	if (GetSex() == 0) then			-- ��Ů�ò�ͬ�ĶԻ�
		Say("�����죺��λNam��������벻��֪��Nam���Ľ���ǰ�̣�ֻҪ500�����ӡ�",2,"���c, �� ta xem th�/view_repute_yes","Kh�ng c�n ��u/no")
	else
		Say("V� n� hi�p n�y kh� ph�ch b�t ph�m!  C� mu�n bi�t t��ng lai s�ng l�n c�a m�nh kh�ng? Ch� c�n 5000 l��ng!",2,"���c, �� ta xem th�/view_repute_yes","Kh�ng c�n ��u/no")
	end
end

function view_repute_yes()
	if (GetCash() < 500) then
		Talk(1,"","L�i m�t ng��i kh�ng c� ti�n n�a, l�m ph� m�t n�a ng�y tr�i")		
		return 0
	end
	Pay(500)
	repute_exp = GetRepute()
	repute_lvl = GetReputeLevel(repute_exp)
	if (repute_lvl == -1) then			-- ����ʱ
		Talk(1,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i")
	elseif (repute_lvl == 0) then
		Talk(2,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i","Danh v�ng giang h� c�a ng��i hi�n t�i l�"..repute_exp.." Giang h� coi ng��i l� <color=red>M�i t�i xu�t giang h�<color>.")
	elseif (repute_lvl == 1) then
		Talk(2,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i","Danh v�ng giang h� c�a ng��i hi�n t�i l�"..repute_exp.."Giang h� coi ng��i l�<color=red>S� nh�p giang h�<color>.")
	elseif (repute_lvl == 2) then
		Talk(2,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i","Danh v�ng giang h� c�a ng��i hi�n t�i l�"..repute_exp.."Giang h� coi ng��i l�<color=red>V� Danh ti�u b�i<color>.")
	elseif (repute_lvl == 3) then
		Talk(2,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i","Danh v�ng giang h� c�a ng��i hi�n t�i l�"..repute_exp.."Giang h� coi ng��i l�<color=red>M�c M�c v� v�n<color>.")
	elseif (repute_lvl == 4) then
		Talk(2,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i","Danh v�ng giang h� c�a ng��i hi�n t�i l�"..repute_exp.."Giang h� coi ng��i l�<color=red>S� Hi�n phong mang<color>.")
	elseif (repute_lvl == 5) then
		Talk(2,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i","Danh v�ng giang h� c�a ng��i hi�n t�i l�"..repute_exp.."Giang h� coi ng��i l�<color=red>Ti�u H�u danh kh�<color>.")
	elseif (repute_lvl == 6) then
		Talk(2,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i","Danh v�ng giang h� c�a ng��i hi�n t�i l�"..repute_exp.."Giang h� coi ng��i l�<color=red>Danh ��u h��ng l��ng<color>.")
	elseif (repute_lvl == 7) then
		Talk(2,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i","Danh v�ng giang h� c�a ng��i hi�n t�i l�"..repute_exp.."Giang h� coi ng��i l�<color=red>Uy Tr�n nh�t ph��ng<color>.")
	elseif (repute_lvl == 8) then
		Talk(2,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i","Danh v�ng giang h� c�a ng��i hi�n t�i l�"..repute_exp.."Giang h� coi ng��i l�<color=red>Ng�o Th� qu�n h�ng<color>.")
	elseif (repute_lvl == 9) then
		Talk(2,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i","Danh v�ng giang h� c�a ng��i hi�n t�i l�"..repute_exp.."Giang h� coi ng��i l�<color=red>Nh�t ��i t�ng s�<color>.")
	else
		Talk(2,"","Th�n long gi� l�m ng��i tr�n gian.M�c d� hi�n gi� ng��i �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh. Ng��i tinh � s� ph�t hi�n ra ng��i l� m�t thi�n t�i","Danh v�ng giang h� c�a ng��i hi�n t�i l�"..repute_exp.."Giang h� coi ng��i l�<color=red>Ti�u Ng�o giang h�<color>.")
	end
end

function no()
end
