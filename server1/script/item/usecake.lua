--Խ������������
--fmz
--200705
--
--2007-06-02
--edit by Fmz,���ӻ�þ��������
TSK_ACT2YEARS_EXP_MAX = 1919
function main(nItemIndex)    
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > 70731 then
        Say("�ñ��ѹ��ڣ�����ʹ����!",0)
        return 0
    end
    local nCurAddExp = GetTask(TSK_ACT2YEARS_EXP_MAX)
    if nCurAddExp >= 400000000 then
        Say("�Ѵ�������ƣ�����ʹ�ø���Ʒ��.",0)
        return 1
    end
    local szItemName = GetItemName(nItemIndex)
    local nExpNum,nItemID = 0
    local g, d, p = GetItemProp( nItemIndex )
    if p == 1442 then
        nExpNum = 200000
    elseif p == 1443 then
        nExpNum = 500000
    elseif p == 1444 then
        nExpNum = 1000000
    end
    if (IsMyItem(nItemIndex) ~= 1) then
        return 1
    end
    
    RemoveItemByIndex(nItemIndex);    
    AddOwnExp( nExpNum )
    WriteLog(format("[ʹ�� %s]\t%s\tName:%s\tAccount:%s\t ���� %s ����ֵ.",szItemName,
    GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),nExpNum));
    SetTask(TSK_ACT2YEARS_EXP_MAX,nCurAddExp+nExpNum)
    return 0
end
--