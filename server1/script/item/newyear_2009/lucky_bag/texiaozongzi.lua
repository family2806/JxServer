Include("\\script\\item\\newyear_2009\\head.lua");

function main()
	newyear0901_resettask();
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_lazhu_expiredtime) then
		Msg2Player("����Ʒ�ѹ���.");
		return 0;
	end
	SetTask(newyear0901_TSK_GetExpUpLimit, 300000);
	Say("�������Ի�õľ���ֵ���Ϊ30��", 0);
end