--Խ������������Ʒ��
--fmz
--
--
ACT2YEAR_TWhiteBoxRan = {
    tRan = {1000},
    tItemID = { {6,1,1442}},
    tItemName = {"���൰��"}
}
--
ACT2YEAR_TBlueBoxRan = {
    tRan = {10,15,25,125,175,195,295,1000},
    tItemID = {
        {6,1,23},
        {6,1,12},
        {4,353,1},
        {6,1,147,1},
        {6,1,147,2},
        {6,1,147,3},
        {6,1,125},
        {6,1,1443},
    },
    tItemName = {"���޺�","�����ľ�","���챦ʯ","1��������ʯ","2��������ʯ","3��������ʯ",
    "�𻨾�","�������",}
}
--
ACT2YEAR_TYellowBoxRan = {
    tRan = {30,124,174,194,344,944,946,948,950,952,954,956,958,960,962,964,966,968,970,972,974,976,978,980,982,984,986,988,990,992,994,996,998,1000,},
    tItemID = {
        {6,1,23},
        {6,1,147,2},
        {6,1,147,3},
        {6,1,147,4},
        {4,239,1},
        {6,1,1444},
        {6,1,27},
        {6,1,28},
        {6,1,33},
        {6,1,34},
        {6,1,35},
        {6,1,36},
        {6,1,37},
        {6,1,38},
        {6,1,39},
        {6,1,40},
        {6,1,41},
        {6,1,42},
        {6,1,43},
        {6,1,45},
        {6,1,46},
        {6,1,47},
        {6,1,48},
        {6,1,49},
        {6,1,50},
        {6,1,51},
        {6,1,52},
        {6,1,53},
        {6,1,54},
        {6,1,55},
        {6,1,56},
        {6,1,57},
        {6,1,58},
        {6,1,59},
    },
    tItemName = {"���޺�","2��������ʯ","3��������ʯ","4��������ʯ","��ˮ��","�ر�������","�����. �����滨",
    "�ݾ���.�һ���","̫��ȭ��.������","̫������.�ڶ���","������. ì��","����. ����","��������. ��1",
    "�����̷�.��2","��������.��3","���̵���","����˫��","���ؼ�","��ü������ؼ�","�ɵ���. �����Ӱ",
    "������.�Ź��ɾ�","�嶾�Ʒ�. ��1","�嶾����.��2","�嶾������. ��3","������","������","������",
    "���.����","ؤ���Ʒ�","ؤ�����","����ȭ��.��1","���ֹ���.��2","���ֵ���.��3","�ն��ؼ�" }
}
--
function main(nItemIndex)
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > 70712 then
        Say("��Ʒ�ѹ�ʹ����.",0)
        return 0
    end
    local szItemName = GetItemName(nItemIndex)
    local tRan = {}
    local g, d , p = GetItemProp( nItemIndex )
    if p ==  1439 then
        tRan = ACT2YEAR_TWhiteBoxRan
    elseif p == 1441 then
        tRan = ACT2YEAR_TBlueBoxRan
    elseif p == 1440 then
        tRan = ACT2YEAR_TYellowBoxRan
    end
    local nMedalItemGID, nMedalItemDID,nMedalItemPID,nItemLev,szMedalItemName = act2years2007_getgift(tRan)
    if nMedalItemGID == nil or nMedalItemDID == nil or nMedalItemPID  == nil  or szMedalItemName == nil then
        Msg2Player("ʹ��ʧ�ܣ�������һ��.")
        return 1
    end
    --�����������
    if nMedalItemPID ~= 147 then
        nItemLev = 1
    end
    AddItem(nMedalItemGID,nMedalItemDID,nMedalItemPID,nItemLev,0,0)
    Msg2Player(format("��ϲ�����1%s.",szMedalItemName))
    return 0
end
--
function act2years2007_getgift(tRan)
    
    local nCurRan,nMaxNumber
    local nMaxRan = 1000
    nCurRan = random(nMaxRan)
    nMaxNumber = getn(tRan.tRan)
    for i = 1, nMaxNumber do
        if nCurRan <= tRan.tRan[i] then
            return tRan.tItemID[i][1],tRan.tItemID[i][2],tRan.tItemID[i][3],tRan.tItemID[i][4], tRan.tItemName[i]
        end
    end
end
