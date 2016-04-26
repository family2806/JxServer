Include("\\script\\event\\teacher_day_200711\\head.lua");
Include("\\script\\event\\teacher_day_200711\\card.lua");
TeacherDay200711_IntervalTime = 60*10;--十分钟

function main(nItemIndex)
	if (GetTask(TSK_TeacherDay200711_CardUseTime) + TeacherDay200711_IntervalTime > GetCurServerTime()) then
		Say("每次使用祝卡需要等10复制才能继续使用.",0)
		return 1;
	end
	local _, _, nParti = GetItemProp(nItemIndex);
	TeacherDay200711_card_main(nParti);
	return 1
end