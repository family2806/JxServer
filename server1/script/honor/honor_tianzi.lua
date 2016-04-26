-------------------------------------------------------------------------
-- FileName		:	honor_tianzi.lua
-- Author		:   zhangyifan
-- CreateTime	:	2009-05-12
-- Desc			:   天子npc
-------------------------------------------------------------------------

Include( "\\script\\honor\\honor_head.lua" )
Include( "\\script\\lib\\say.lua" );

function main()
	tbHonor_Sys_2009:tianzi_main()
end

function tbHonor_Sys_2009:tianzi_main()
    saypage(getn(self.tbHonor_Tianzi_List.tbHistory), 3, "tbHonor_Sys_2009:page_gen", -1);
end

tbHonor_Sys_2009.tbScoreTitle = 
{
    [1] = {nValue = -3000, strTitle = "昏君"},
    [2] = {nValue = -1001, strTitle = "庸君"},
    [3] = {nValue = -101, strTitle = "无为"},
    [4] = {nValue = 100, strTitle = "清净"},
    [5] = {nValue = 1000, strTitle = "有为"},
    [6] = {nValue = 3000, strTitle = "明君"},
    [7] = {nValue = 3000, strTitle = "圣君"},
}


tbHonor_Sys_2009.tbCapital = 
{
    [0] = "汴京",
    [1] = "临安",
}

function tbHonor_Sys_2009:page_gen(tb_pageinfo, str_parameter)
    local strContent;
    local tbOption = {"离开/#tbHonor_Sys_2009:tianzi_onCancel()",};
    local tbContent = {};
	
	for i = tb_pageinfo.from, tb_pageinfo.to do
	    local strGeneration;
	    
	    local tbTianzi = self.tbHonor_Tianzi_List.tbHistory[i];
	    local strEmperor;
	    local strBeginTime;
	    local strEndTime;
	    local strTitle;
	    local strTong;
	    local strScore;
	    local strCapital;
	    
	    if (i == 1) then
	        strGeneration = "当今圣上";
	    else
	        strGeneration = format("第%d代天子", tb_pageinfo.total - i + 1);
	    end
	    
	    if(tbTianzi.szEmperor == nil or tbTianzi.szEmperor == "") then
            strEmperor = "无";
	        strTitle = "无";
	        strBeginTime = "<color=yellow>无<color>";
	        strEndTime = "<color=yellow>无<color>";
	        strTong = "无";
	        strScore = "无"
	        
	        strCapital = "无"
	    else
	        strEmperor = tbTianzi.szEmperor;
	        strTitle = tbTianzi.szTitle;
	        strBeginTime = format("<color=green>%d<color> 年 <color=green>%02d<color> 月 <color=green>%02d<color> 日", floor(tbTianzi.nBeginTime/10000), floor(mod(tbTianzi.nBeginTime,10000)/100), mod(tbTianzi.nBeginTime,100));

	        if (tbTianzi.nEndTime == 0) then
	            strEndTime = "<color=yellow>出错<color>";
	        else
	            strEndTime = format("<color=green>%d<color> 年 <color=green>%02d<color> 月<color=green>%02d<color> 日", floor(tbTianzi.nEndTime/10000), floor(mod(tbTianzi.nEndTime,10000)/100), mod(tbTianzi.nEndTime,100));
	        end

	        strTong = tbTianzi.szTong;
	        for j = 1, getn(self.tbScoreTitle) do
                if ((strScore == nil or strScore == "") and tbTianzi.nScore <= self.tbScoreTitle[j].nValue) then
                    strScore = self.tbScoreTitle[j].strTitle;
                end
            end
            if (strScore == nil or strScore == "") then
                strScore = self.tbScoreTitle[getn(self.tbScoreTitle)].strTitle;
            end
            strCapital = self.tbCapital[tbTianzi.nSide];
	    end
	   tbContent[getn(tbContent) + 1] = 
        {
            format("%s: <color=yellow>%s<color>", strGeneration, strEmperor),
        }
        tbContent[getn(tbContent) + 1] = 
        {
			format("国号: <color=yellow>%s<color>", strTitle),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("日期: %s", strBeginTime),
        }   
        tbContent[getn(tbContent) + 1] = 
        {
			format("帮会: <color=yellow>%s<color>", strTong),
        }      
        tbContent[getn(tbContent) + 1] = 
        {
            format("退位: %s", strEndTime),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("皇城: <color=yellow>%s<color>", strCapital),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("世人评价: <color=yellow>%s<color>", strScore),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            "--------------------------------------------",
        }
	end
   
    local var_width = {50}
    local var_align = 1
	
	strContent = maketable(tbContent, var_width, var_align);
	
    return strContent, tbOption;
end

function tbHonor_Sys_2009:tianzi_onCancel()
end