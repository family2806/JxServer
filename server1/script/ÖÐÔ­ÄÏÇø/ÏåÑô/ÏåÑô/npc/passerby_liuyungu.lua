-- �ذϻ����Ի��ű�

Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include([[\script\global\yuenan_feiyunrenwu.lua]]);	--by liaozhishan 11/15/2006

function main()
	local tab_Content = {
		"������֧������/branch_liuyungu", "˳��·��/no"
	};
	if (v_fy_is_active() == 1) then
		tinsert(tab_Content, "��ȡ100������/v_fy_100_entrance")
		Say("�ҿ��԰�ʲô�� ", getn(tab_Content), tab_Content);
		return
	end;	
	branch_liuyungu();
end