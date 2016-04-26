-------------------------------------------------------------------------
-- FileName		:	toll_yucixinshi.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-16 15:28:15
-- Desc			:  	信使任务御赐金牌右键触发脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(itemindex)
	local paramvalue = GetItemParam(itemindex, 1)
	if ( paramvalue >= 5 ) then
		Msg2Player("对不起，你的御赐信使金牌已经使用过5次了，它将被销毁。")
	elseif ( nt_getTask(1206) < 5 ) then
		Msg2Player("对不起，你还没有领取到御赐金牌信使的称号，无法使用御赐信使金牌。请先去找驿官升级称号，谢谢。")
		return 1
	else
		if ( SetSpecItemParam(itemindex, 1, paramvalue+1) == 1 ) then
			SyncItem(itemindex)
			local Realvalue = 5 - GetItemParam(itemindex, 1)
			Msg2Player("你的御赐信使金牌使用后可获得一小时的30点负抗。目前还可以使用"..Realvalue.."次。")
		end
		
		if ( GetSeries() == 0 ) then --金系人物被火克 ，631-635，金木水火土
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 634, 5, 1, 64800)
		elseif ( GetSeries() == 1 ) then --木系人物被金克
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 631, 5, 1, 64800)
		elseif ( GetSeries() == 2 ) then --水系人物被土克
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 635, 5, 1, 64800)
		elseif ( GetSeries() == 3 ) then --火系人物被水克
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 633, 5, 1, 64800)
		elseif ( GetSeries() == 4 ) then --土系人物被木克
			AddSkillState( 546, 1, 1, 64800)	
			AddSkillState( 632, 5, 1, 64800)				
		end
		
		return 1
	end
end

function GetDesc( nItem )
	local szDesc;
	local nIssueID, nIDCount;
	local  nPayMonth1
	local nPayMonth1 = GetItemParam( nItem, 1 )
	local Realvalue = 5 - nPayMonth1
	
	szDesc = ""
	szDesc = szDesc..format( "你的御赐信使金牌使用后可获得一小时的30点负抗。目前还可以使用"..Realvalue.."次。" );
	return szDesc;
end