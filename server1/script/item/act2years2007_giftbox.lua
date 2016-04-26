--越南两周年活动，礼品盒
--fmz
--
--
ACT2YEAR_TWhiteBoxRan = {
    tRan = {1000},
    tItemID = { {6,1,1442}},
    tItemName = {"海绵蛋糕"}
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
    tItemName = {"铁罗汉","盘软心经","晶红宝石","1级玄晶矿石","2级玄晶矿石","3级玄晶矿石",
    "桂花酒","冰激凌饼",}
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
    tItemName = {"铁罗汉","2级玄晶矿石","3级玄晶矿石","4级玄晶矿石","紫水晶","特别冰激凌饼","袖箭术. 暴雨梨花",
    "陷静术.乱还击","太极拳谱.第三卷","太极剑谱.第二卷","云龙击. 矛法","刘晶. 道法","天王锤法. 卷1",
    "天王商法.卷2","天王道法.卷3","翠烟道法","翠烟双刀","灭剑秘籍","峨眉佛光掌秘籍","飞刀术. 摄魂月影",
    "飞镖术.九宫飞晶","五毒掌法. 卷1","五毒道法.卷2","五毒摄心术. 卷3","御风术","御龙术","御心术",
    "摄魂.咒术","丐帮掌法","丐帮棍法","少林拳法.卷1","少林棍法.卷2","少林道法.卷3","普渡秘籍" }
}
--
function main(nItemIndex)
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > 70712 then
        Say("物品已过使用期.",0)
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
        Msg2Player("使用失败，请再试一次.")
        return 1
    end
    --如果不是玄晶
    if nMedalItemPID ~= 147 then
        nItemLev = 1
    end
    AddItem(nMedalItemGID,nMedalItemDID,nMedalItemPID,nItemLev,0,0)
    Msg2Player(format("恭喜您获得1%s.",szMedalItemName))
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
