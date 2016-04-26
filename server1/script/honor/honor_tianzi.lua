-------------------------------------------------------------------------
-- FileName		:	honor_tianzi.lua
-- Author		:   zhangyifan
-- CreateTime	:	2009-05-12
-- Desc			:   ����npc
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
    [1] = {nValue = -3000, strTitle = "���"},
    [2] = {nValue = -1001, strTitle = "ӹ��"},
    [3] = {nValue = -101, strTitle = "��Ϊ"},
    [4] = {nValue = 100, strTitle = "�徻"},
    [5] = {nValue = 1000, strTitle = "��Ϊ"},
    [6] = {nValue = 3000, strTitle = "����"},
    [7] = {nValue = 3000, strTitle = "ʥ��"},
}


tbHonor_Sys_2009.tbCapital = 
{
    [0] = "�꾩",
    [1] = "�ٰ�",
}

function tbHonor_Sys_2009:page_gen(tb_pageinfo, str_parameter)
    local strContent;
    local tbOption = {"�뿪/#tbHonor_Sys_2009:tianzi_onCancel()",};
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
	        strGeneration = "����ʥ��";
	    else
	        strGeneration = format("��%d������", tb_pageinfo.total - i + 1);
	    end
	    
	    if(tbTianzi.szEmperor == nil or tbTianzi.szEmperor == "") then
            strEmperor = "��";
	        strTitle = "��";
	        strBeginTime = "<color=yellow>��<color>";
	        strEndTime = "<color=yellow>��<color>";
	        strTong = "��";
	        strScore = "��"
	        
	        strCapital = "��"
	    else
	        strEmperor = tbTianzi.szEmperor;
	        strTitle = tbTianzi.szTitle;
	        strBeginTime = format("<color=green>%d<color> �� <color=green>%02d<color> �� <color=green>%02d<color> ��", floor(tbTianzi.nBeginTime/10000), floor(mod(tbTianzi.nBeginTime,10000)/100), mod(tbTianzi.nBeginTime,100));

	        if (tbTianzi.nEndTime == 0) then
	            strEndTime = "<color=yellow>����<color>";
	        else
	            strEndTime = format("<color=green>%d<color> �� <color=green>%02d<color> ��<color=green>%02d<color> ��", floor(tbTianzi.nEndTime/10000), floor(mod(tbTianzi.nEndTime,10000)/100), mod(tbTianzi.nEndTime,100));
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
			format("����: <color=yellow>%s<color>", strTitle),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("����: %s", strBeginTime),
        }   
        tbContent[getn(tbContent) + 1] = 
        {
			format("���: <color=yellow>%s<color>", strTong),
        }      
        tbContent[getn(tbContent) + 1] = 
        {
            format("��λ: %s", strEndTime),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("�ʳ�: <color=yellow>%s<color>", strCapital),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("��������: <color=yellow>%s<color>", strScore),
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