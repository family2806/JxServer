Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\config\\1005\\tongsupport.lua")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
tbPVLBActive = {}

function tbPVLBActive:AddDialog(tbOpt)
	if tbPVLB_Check:CheckTime() ~= 1 then
		return
	end
	tinsert(tbOpt, "Ta muèn nhËn Phong V©n LÖnh Bµi/#tbPVLBActive:main()")
	tinsert(tbOpt, "PhÇn th­ëng bang héi tiÕp nhËn t©n thñ/#tbTongSupport:main()")
end

function tbPVLBActive:main()
	if self:ActiveCondition() ~= 1 then
		return
	end
	if tbExtPointLib:SetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME, 1) ~= 1 then
		Talk(1, "", "D÷ liÖu kh«ng cËp nhËt, xin vui lßng liªn hÖ ban qu¶n trÞ ®Ó ®­îc gi¶i quyÕt.")
		return
	end
	if tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME) ~= 1 then
		Talk(1, "", "D÷ liÖu kh«ng cËp nhËt, xin vui lßng liªn hÖ ban qu¶n trÞ ®Ó ®­îc gi¶i quyÕt.")
		return
	end
	local tbItem = {szName="Phong V©n LÖnh Bµi",tbProp={6,1,30141,1,0,0},nCount=1,nExpiredTime=86400,nBindState=-2};	
	local tbTranslog = {strFolder = "201109_EventPhongVanLenhBai/", nPromID = 11, nResult = 1}
	tbAwardTemplet:Give(tbItem, 1, {"Phong V©n LÖnh Bµi", "ÁìÈ¡Phong V©n LÖnh BµiÀñÆ·", tbTranslog})
end

function tbPVLBActive:ActiveCondition()
	local nBitVal1 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_NEW_ACCOUNT) --½Écode ÐÂÕËºÅ
	local nBitVal2 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_OLD_ACCOUNT)--½É code ¾ÉÕËºÅ
	if nBitVal1 == 0 and nBitVal2 == 0 then
		Talk(1, "", "C¸c h¹ ch­a n¹p code kh«ng thÓ nhËn th­ëng, xin h·y kiÓm tra l¹i!")
		return nil
	end
	local nBitVal3 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME)--®·ÒÑÁì½±
	if nBitVal3 ~= 0 then
		Talk(1, "", "Xin thø lçi, c¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return nil
	end
	if GetRoleCreateDate() >= 20110928 then		
		return 1
	end
	local nTranLife = ST_GetTransLifeCount()
	if nTranLife == 0 then
		return 1
	end
	if nTranLife == 1 then
		return 1
	end
	if nTranLife == 2 and GetLevel() < 180 then
		return 1
	end
	Talk(1, "", "Xin thø lçi, c¸c h¹ kh«ng ®ñ ®iÒu kiÖn tham gia ch­¬ng tr×nh, h·y ghÐ th¨m trang chñ cña trß ch¬i ®Ó biÕt thªm th«ng tin.")
end