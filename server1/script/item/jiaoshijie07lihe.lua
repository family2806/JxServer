--½Ì“S­”½Ú07ÀñºÐ
Include("\\script\\lib\\award.lua");
Include("\\script\\event\\teacher_day_200711\\head.lua");
function main()
	local nDate = tonumber(GetLocalDate("%y%m%d%H"));
	if (nDate >= TeacherDay200711_START_TIME and nDate <= TeacherDay200711_UseLimitTime) then--2007Äê11ÔÂ17ÈÕ ÖÁ2007Äê12ÔÂ02ÈÕ 24µã00
		local tbAwardItemPic =
		{
			{nGID =6, nDID = 1, nPID = 1599, szName = "T«n", nRate = 10},--¡°T«n¡±×Ö	
			{nGID =6, nDID = 1, nPID = 1600, szName = "“S­”", nRate = 10},  --¡°“S­”¡±×Ö	
			{nGID =6, nDID = 1, nPID = 1601, szName = "Träng", nRate = 10},   --¡°Träng¡±×Ö	
			{nGID =6, nDID = 1, nPID = 1602, szName = "§¹o", nRate = 10},   --¡°§¹o¡±×Ö	
			{nGID =6, nDID = 0, nPID = 20, szName = "Mai Kh«i Hoa Vò ", nRate = 60},   --Mai Kh«i Hoa Vò 
		}
		local nItemIndex=TeacherDay200711_RandomGetOne(tbAwardItemPic,1,getn(tbAwardItemPic));
		AddItem(tbAwardItemPic[nItemIndex]["nGID"],tbAwardItemPic[nItemIndex]["nDID"],tbAwardItemPic[nItemIndex]["nPID"],1,0,0);
		Msg2Player(format("NhËn ®­îc %d %s",1,tbAwardItemPic[nItemIndex]["szName"]))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tGetItem %d %s.","2007ÄêÔ½ÄÏ½Ì“S­”½Ú»î¶¯",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),1,tbAwardItemPic[nItemIndex]["szName"] ));
		return 0;
	else
		Say("Ô½ÄÏ½Ì“S­”½Ú»î¶¯ÒÑ½áÊø",0)
		return 0;
	end
end

--·µ»ØËæ»úÑ¡ÖÐµÄÒ»¸öÎ»ÖÃ
function TeacherDay200711_RandomGetOne(Item_Talbe,start_index,end_index)
	local rtotal=100000;
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=start_index,end_index do
		Item_Talbe[i]["nRate"] = Item_Talbe[i]["nRate"] or 100;
		rstep=rstep+floor(Item_Talbe[i]["nRate"]*rtotal/100);
		if(rcur <= rstep) then
			return i
		end
	end
	return -1
end