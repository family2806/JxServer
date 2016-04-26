
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ����ϵͳ�������ͻ��˽ű�
-- Edited by peres
-- 2005/07/04 PM 19:59

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================
-- ����ϵͳ
IncludeLib("TASKSYS");

-- �������ݶ���ͷ�ļ�
Include("\\script\\task\\system\\task_head.lua");

function GetItemDescription(name, magiclevel1, magiclevel2, magiclevel3, magiclevel4, magiclevel5, magiclevel6)

local strDesc = "";

	strDesc = strDesc.."<enter>����������<color=yellow>"..TaskId(magiclevel1, 1, TaskID_Table.TaskText_Row).."<color><enter><enter>";

	strDesc = strDesc..CreateAwardText(TaskName(magiclevel1));

	strDesc = strDesc.."<enter><color=yellow>˵���������Ҽ����ɻ�ô�����<color><enter>";
	
	return strDesc;

end;


-- ���ɽ��������ֶ�
function CreateAwardText(taskName)

local nRow, nCol = TaskAwardMatrix(taskName);

local i=0;

local aryAward = {{}};

local strArray = "";
local strArrayRate = "";
local strText = ""; -- ������˵��

local nIsArray = 0; -- �ж��Ƿ�������

local strAwardNormal = {} -- �̶�����Ľ���
local strAward = "������ɺ����ý�����<enter>"; -- ��󷵻صĽ����ֶ�

local strType = "";

	strType = TaskAward(taskName, 1, 1);

	-- ���������������ǽ��������Ĵ���
	if strType=="��������" then
		-- ֱ����������������
		taskName = TaskAward(taskName, 1, Award.AlliedAward_Row);
		nRow, nCol = TaskAwardMatrix(taskName);
	end;

	for i=1, nRow do
	
		strArray = TaskAward(taskName, i, Award.ArrayID_Row);
		strArrayRate = TaskAward(taskName, i, Award.ArrayRate_Row);
		strText     = TaskAward(taskName, i, Award.AwardText_Row);
		
		-- �������������������
		if strArray~="" then
		
			-- ������鲻�������ʼ������
			if aryAward[tonumber(strArray)]==nil then
				rawset(aryAward, tonumber(strArray), {}); 
			end;
			
			 rawset(aryAward[tonumber(strArray)],
			 		getn(aryAward[tonumber(strArray)])+1,
			 		"<color=green>"..strText.."<color>  "..strArrayRate.."% �ĸ���"
			 		);
			 		
			 nIsArray = 1;
			 
		else
			rawset(strAwardNormal,
					getn(strAwardNormal)+1,
					strText);
		end;
	
	end;
	
	-- ������������������飬��������鷢������
	if nIsArray==1 then
		for i=1, getn(aryAward) do
			strAward = strAward.."<enter>��"..i.."�������������<enter>";
			strAward = strAward..CreateTextForArray(aryAward[i]);
		end;
	end;
	
	strAward = strAward.."<enter>�̶�������<enter>";
	
	if getn(strAwardNormal)~=0 then
	
		for i=1, getn(strAwardNormal) do
			strAward = strAward.."<color=green>"..strAwardNormal[i].."<enter>";
		end;
		
	else
		strAward = strAward.."<color=green>�޹̶�����<color>";
	end;
	
	return strAward;
	
end;



function CreateTextForArray(aryAward)

local strAward = "";
local i=0;


	-- ����������Ķ�������ȥ
	for i=1, getn(aryAward) do
		strAward = strAward..aryAward[i].."<enter>";
	end;
	
	return strAward;
	
end;