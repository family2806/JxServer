Include([[\script\missions\tong\tong_springfestival\head.lua]]);

-- LLG_ALLINONE_TODO_20070802
Include([[\script\item\springfestival2006\itemhead.lua]]);

function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
    if (0 == itemuseplacecheck(2)) then
		return 1;
	end;
    local i;
    for i = 668, 674 do
        AddSkillState(i, 10, 0, 0);
    end;
    AddSkillState(309, 10, 0, 5 * 18); --���ܹ���
    Msg2Player("��ʹ����һ��<color=0xB5FDD7>�����<color>����<color=0xB5FDD7>5����<color>�ڲ���״̬Ӱ�졣");
end;