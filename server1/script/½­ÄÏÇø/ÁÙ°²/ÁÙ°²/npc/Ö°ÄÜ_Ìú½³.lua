-- 临安　职能　铁匠
-- by：Dan_Deng(2003-09-16)
--update:zhaowenyi(2005-02-20)增加紫色及黄金装备铸造

Include("\\script\\global\\global_tiejiang.lua")


TIEJIANG_DIALOG = "<dec><npc> c╪ n祔 th� r蘮 c鯽 h祅g l� t� ta t� ph� kia ng l鴄 l璾 l筰 ,  c� ch髏 ni謒 u , � n琲 n祔 trc khi an trong th祅h c騨g h琲 c� m醤g t猲 , xin h醝 mu鑞 mua ch髏 g� nha ? ";
function main()
	tiejiang_city(TIEJIANG_DIALOG);
end;


function yes()
	Sale(1);  				--弹出交易框
end;

