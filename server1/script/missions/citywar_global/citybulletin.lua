--���й�����
function SayCityStatus()
	nCityID = GetCityArea();
	Say(GetCitySummary(nCityID) .. "\n" .. NW_GetSealInfo(), 0);
end;

function ManageCity()
	nCityID = GetCityArea();
	OpenCityManageUI(nCityID);
end;

function main()
	nCityID = GetCityArea();
	if (nCityID >= 1 and nCityID <= 7) then
		TongName, MasterName = GetCityOwner(nCityID);
		if (MasterName == GetName()) then
			Say("��ְ̫�أ�����Ҫ������˰��?", 2, "Ҫ/ManageCity", "����, ��ֻ�뿴���е�ͨ��? /SayCityStatus");
		else
			SayCityStatus();
		end;
	else
		Say("����û�й���", 0);
	end;
end;

