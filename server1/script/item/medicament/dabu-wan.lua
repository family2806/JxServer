-- by yfeng

if not BAN_HEAD then
	Include("\\script\\global\\ban.lua")
end

function main(itemIdx)
	local mapid,_,_ = GetWorldPos()
	if(checkSJMaps(mapid)) then
		Msg2Player("�ν�ս���ڲ��ܷ��ô��衣")
		return 1
	end
	local _,_,detail = GetItemProp(itemIdx)
	if(detail == 218) then --������
		AddSkillState(511,15,1,18*180)
		return 0
	end
	if(detail == 219) then --������
		AddSkillState(512,15,1,18*180)
		return 0
	end
	if(detail == 220) then --�շ���
		AddSkillState(513,20,1,18*180)
		return 0
	end
	if(detail == 221) then --������
		AddSkillState(514,20,1,18*180)
		return 0
	end
	if(detail == 222) then --������
		AddSkillState(515,20,1,18*180)
		return 0
	end
	if(detail == 223) then --�����
		AddSkillState(516,20,1,18*180)
		return 0
	end
	if(detail == 224) then --�׷���
		AddSkillState(517,20,1,18*180)
		return 0
	end
	if(detail == 225) then --������
		AddSkillState(518,20,1,18*180)
		return 0
	end
	if(detail == 226) then --������
		AddSkillState(519,20,1,18*180)
		return 0
	end
	if(detail == 227) then --������
		AddSkillState(520,20,1,18*180)
		return 0
	end
	if(detail == 228) then --������
		AddSkillState(521,20,1,18*180)
		return 0
	end
	if(detail == 229) then --�չ���
		AddSkillState(522,10,1,18*180)
		return 0
	end
	if(detail == 230) then --������
		AddSkillState(523,10,1,18*180)
		return 0
	end
	if(detail == 231) then --������
		AddSkillState(524,10,1,18*180)
		return 0
	end
	if(detail == 232) then --����
		AddSkillState(525,10,1,18*180)
		return 0
	end
	if(detail == 233) then --�׹���
		AddSkillState(526,10,1,18*180)
		return 0
	end
	if(detail == 234) then --������
		AddSkillState(527,10,1,18*180)
		return 0
	end
	if(detail == 235) then --������
		AddSkillState(528,10,1,18*180)
		return 0
	end

end

function GetDesc(itemIdx)
	local _,_,detail = GetItemProp(itemIdx)
	if(detail == 218) then --������
		return "<color=blue>3�����ڣ�\n�⹦ϵ�书�����ٶȣ�����30%\n�ڹ�ϵ�书�����ٶȣ�����30%<color>"
	end
	if(detail == 219) then --������
		return "<color=blue>3�����ڣ�\n�ƶ��ٶȣ�����30%<color>"
	end
	if(detail == 220) then --�շ���
		return "<color=blue>3�����ڣ�\n�շ�������40%<color>"
	end
	if(detail == 221) then --������
		return "<color=blue>3�����ڣ�\n����������40%<color>"
	end
	if(detail == 222) then --������
		return "<color=blue>3�����ڣ�\n����������40%<color>"
	end
	if(detail == 223) then --�����
		return "<color=blue>3�����ڣ�\n���������40%<color>"
	end
	if(detail == 224) then --�׷���
		return "<color=blue>3�����ڣ�\n�׷�������40%<color>"
	end
	if(detail == 225) then --������
		return "<color=blue>3�����ڣ�\n���˶���ʱ�䣺����40%<color>"
	end
	if(detail == 226) then --������
		return "<color=blue>3�����ڣ�\nѣ��ʱ�䣺����40%<color>"
	end
	if(detail == 227) then --������
		return "<color=blue>3�����ڣ�\n�ж�ʱ�䣺����40%<color>"
	end
	if(detail == 228) then --������
		return "<color=blue>3�����ڣ�\n�ٻ�ʱ�䣺����40%<color>"
	end
	if(detail == 229) then --�չ���
		return "<color=blue>3�����ڣ�\n�⹦ϵ�չ��˺�������200%\n�ڹ�ϵ�չ��˺�������100��<color>"
	end
	if(detail == 230) then --������
		return "<color=blue>3�����ڣ�\n�⹦ϵ�����˺�������10��/��\n�ڹ�ϵ�����˺�������10��/��<color>"
	end
	if(detail == 231) then --������
		return "<color=blue>3�����ڣ�\n�⹦ϵ�����˺�������100��\n�ڹ�ϵ�����˺�������100��<color>"
	end
	if(detail == 232) then --����
		return "<color=blue>3�����ڣ�\n�⹦ϵ���˺�������100��\n�ڹ�ϵ���˺�������100��<color>"
	end
	if(detail == 233) then --�׹���
		return "<color=blue>3�����ڣ�\n�⹦ϵ�׹��˺�������100��\n�ڹ�ϵ�׹��˺�������100��<color>"
	end
	if(detail == 234) then --������
		return "<color=blue>3�����ڣ�\n�������ޣ�����1000��<color>"
	end
	if(detail == 235) then --������
		return "<color=blue>3�����ڣ�\n�������ޣ�����1000��<color>"
	end

end
