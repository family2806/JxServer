Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\denggao.lua");


function main()
	jf0904_InitTaskctrl();
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < jf0904_act_dateS or nDate >= jf0904_act_dateE) then
		Say("�����ڻʱ��.", 0);
		return
	end
	Say("��������: ��28-04-2009��31-05-2009��λ�������ԲμӵǶ��������ı���. ��������ֽ�ӡ֧�ݼ�����ӡ��֧�ǰ뵺�ϵ���߷壬�������ĵǶ�֮·ʮ�����Ѽ�࣬ƾ����������������־���ܳɹ�. ʤ���߽��õ����˵Ľ����� ������Ҫ�μ���εǶ�������?", 5,
		"�Ͻ�item��ȡ���۵�./item_exchange_score",
		"�����л��۵�./view_score",
		"�����۵���ߵ�ǰ10��������./view_top10_player",
		"��ȡ�Ƕ��������ǰ10�Ľ���/get_award",
		"��ֻ�ǿ���!/");
end