--������ ������ ·��7����Ϊ�Ի�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(200) == 1 then
		allbrother_0801_FindNpcTaskDialog(200)
		return 0;
	end

i = random(0,2)

if (i == 0) then
Say("Ba L�ng huy�n c�a ch�ng ta l� m�t v�ng ��t nh�. Nh�ng cu�c s�ng m�i ng��i kh� an b�nh.",0)
return
end;

if (i == 1) then
Say("�Thi�n V��ng Bang ch�nh l� c�u c�nh c�a ch�ng ta. N�u kh�ng c� h� th� thi�n h�nh ��o th� ch�ng ta h�n �� b� b�n tham quan nh�ng nhi�u r�i.",0)
return
end;

if (i == 2) then
Say("Trong m�t c�a b� t�nh. Thi�n V��ng Bang �i�u l� nh�ng v� anh h�ng h�o h�n. Thi�u ni�n trong v�ng �i�u mu�n gia nh�p Thi�n V��ng Bang.",0)
end;

end;

