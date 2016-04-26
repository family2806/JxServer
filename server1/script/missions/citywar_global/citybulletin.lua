--城市公告牌
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
			Say("任职太守，你想要新增赋税吗?", 2, "要/ManageCity", "不用, 我只想看城市的通信? /SayCityStatus");
		else
			SayCityStatus();
		end;
	else
		Say("区域没有管理", 0);
	end;
end;

