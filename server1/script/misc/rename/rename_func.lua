-------------------------------------------------------------------------
-- FileName		:	rename_func.lua
-- Author		:	lailigao
-- CreateTime	:	2006-07-02 16:38:37
-- Desc			:	���߸�������
-- Include("\\script\\misc\\rename\\rename_func.lua")
---------------------------------------------------------------------------

Include("\\script\\global\\rename_head.lua")

-- ������Ҹ��Ľ�ɫ���Ի�
function func_online_rename_role(strInfo, strError)
	if (check_renamerole() == 1) then
		Say(strInfo,
			3,
			"<#> �˽⻹��ʹ�õ���������/query_rolename",
			"<#> �����Լ�����������/change_rolename",
			"<#> �´��Ҹ�/cancel");
	else
		deny(strError)
	end
end

-- ��ѯ��ɫ��
function query_rolename()
	AskClientForString("on_query_rolename", "", 1, 20, "<#> ��������Ҫ�˽��");
end

function on_query_rolename(new_name)
	QueryRoleName(new_name);
end

-- ������Ҹ��Ľ�ɫ��
function change_rolename()
	Say("<#> ���岽�裺�뿪��ᣬ��NPC�Ի���������Ҫ���ĵ��������֣��㽫�Զ����ߡ�3���Ӻ��ٵ�½��������������Ѹģ������Ǹ����ɹ������û���ģ�����ִ�����ϲ��衣�������һЩ�����������ϵGM���.",
		2,
		"<#> ��ʼ����/change_rolename2",
		"<#> ��������/cancel")
end

function change_rolename2()
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Player(" <color=green>�������а�ᣬ���ܽ��иò���!<color>")
		return
	end
	AskClientForString("on_change_rolename", "", 1, 20, "<#> �������µ�����");
end

function on_change_rolename(new_name)
	if (check_renamerole() == 1) then
		if (GetName() == new_name) then
			Talk(1, "", "<#> ���ʲô����?")
		else
			RenameRole(new_name);
		end
	end
end

-- ���������İ����
function online_rename_tong(strInfo, strError)
	if (check_renametong() == 1) then
		Say(strInfo,
			3,
			"<#> ��黹��ʹ�õİ����?/query_tongname",
			"<#> �ı��Լ��İ����/change_tongname",
			"<#> �´��Ҹ�/cancel")
	else
		deny(strError)
	end
end

-- ��ѯ�����
function query_tongname()
	AskClientForString("on_query_tongname", "", 1, 20, "<#> ���������˽�İ����");
end

function on_query_tongname(new_tong)
	if (check_renametong() == 1) then
		QueryTongName(new_tong)
	end
end

-- ���İ����
function change_tongname()
	Say("<#> ���岽�裺�뿪��ᣬ��NPC�Ի���������Ҫ���ĵ��������֣��㽫�Զ����ߡ�3���Ӻ��ٵ�½��������������Ѹģ������Ǹ����ɹ������û���ģ�����ִ�����ϲ��衣�������һЩ�����������ϵGM���.",
		2,
		"<#> ��ʼ����/change_tongname2",
		"<#> ��������/cancel");
end

function change_tongname2()
	AskClientForString("on_change_tongname", "", 1, 20, "<#> �������µİ����");
end

function on_change_tongname(new_tong)
	if (GetTongMaster() ~= GetName()) then
		Talk(1, "", "<#> ֻ�а������ܸİ����")
	elseif (check_renametong() == 1) then
		old_tong, res = GetTong()
		if (res == 1 and old_tong ~= "") then
			if (old_tong == new_tong) then
				Say("<#> ���ܸ���ͬ�İ����", 1, "<#> ֪����!/cancel")
			else
				RenameTong(old_tong, new_tong)
			end
		end
	end
end

function deny(strError)
	Say(strError,
		1,
		"<#> ֪����!/cancel")
end
