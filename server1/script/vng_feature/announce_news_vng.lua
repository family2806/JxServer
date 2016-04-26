
Include("\\script\\lib\\common.lua")
Include("\\script\\global\\login_head.lua")

AnnounceNews = {
	nStartDate = 201205030000,
	nEndDate = 201205312400,	
	strMsg = "<color=green>目前正在进行五月事件活动，详情请进入主页volam.zing.vn看<color>", 
}

function AnnounceNews:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	if nCurDate < self.nStartDate or nCurDate > self.nEndDate then
		return nil
	end
	return 1
end

function AnnounceNews:AnnounceUpdate()
	if %AnnounceNews:IsActive() then
		Msg2Player(%AnnounceNews.strMsg)
	end
end

if login_add and  AnnounceNews:IsActive() then login_add(AnnounceNews.AnnounceUpdate, 2)  end
