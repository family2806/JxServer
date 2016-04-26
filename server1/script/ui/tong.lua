IncludeLib("FILESYS")
Include("\\script\\lib\\basic.lua")

--CONTROL_NAME
TASK_ID = 1
TASK_BIT =2
HELP_DEC = 3
HELPLINK = "<pic=44> <color=green>"

TB_CONTROLHELP_DEC = {};
function InitControlHelpDec()
	local b1 = TabFile_Load("\\settings\\tong\\task\\controlhelp_task_def.txt", "ControlHelp");
	if (b1~= 1) then
		print("Load ControlHelp Error!!!");
		return
	end;
	
	local nRowCount = TabFile_GetRowCount("ControlHelp");
	for i = 2, nRowCount do
		local szControlName = TabFile_GetCell("ControlHelp", i, "CONTROL_NAME");
		TB_CONTROLHELP_DEC[szControlName] = {};
		local nTaskID = tonumber(TabFile_GetCell("ControlHelp", i, "TASK_ID"));
		local nTaskBit = tonumber(TabFile_GetCell("ControlHelp", i, "TASK_BIT"));
		local szControlTitle = TabFile_GetCell("ControlHelp", i, "CONTROL_TITLE");
		TB_CONTROLHELP_DEC[szControlName][TASK_ID] = nTaskID;
		TB_CONTROLHELP_DEC[szControlName][TASK_BIT] = nTaskBit;
		TB_CONTROLHELP_DEC[szControlName][HELP_DEC] = {};
		local count = 0;
		for j = 1, 5 do
			count = count + 1;
			local szHelpDec = TabFile_GetCell("ControlHelp", i, "HELP_"..j);
			if (szHelpDec ~= nil and szHelpDec ~= "") then
				TB_CONTROLHELP_DEC[szControlName][HELP_DEC][count] = HELPLINK..szControlTitle.."<enter><color=yellow>"..szHelpDec;
			else
				count = count - 1;
				break
			end;
		end;
		if (count ~= 0) then
			TB_CONTROLHELP_DEC[szControlName][HELP_DEC][count + 1] = "<color=yellow>如果您想再次浏览帮助，请点击帮会界面右上角的<pic=139>，选择该选项即可。";
		end;
	end;
--	print("Load ControlHelp Over!!");
end;

-- IB版本关闭此功能
-- InitControlHelpDec();

function ON_CLICK(szWndName)
	-- IB版本关闭此功能
	do return 1 end
	
	local tbHelpInfo = TB_CONTROLHELP_DEC[szWndName];
	if (IsUiHelpStatus() == 1) then						--询问帮助
		if (tbHelpInfo) then
			ClientTalk(unpack(tbHelpInfo[HELP_DEC]));
		end;
		return 0;
	elseif (client_CheckIsFirstHelp(tbHelpInfo) == 1) then	--第一次使用该项目
		if (tbHelpInfo) then
			ClientTalk(unpack(tbHelpInfo[HELP_DEC]));
			return 0;
		end;
	end;
	return 1;
end

function client_CheckIsFirstHelp(tbinfo)

	local nTaskHelp = GetTask(tbinfo[TASK_ID]);
	if (GetBit(nTaskHelp, tbinfo[TASK_BIT]) == 0) then
		SetTask(tbinfo[TASK_ID], SetBit(nTaskHelp, tbinfo[TASK_BIT], 1));
		return 1;
	else
		return 0;
	end;
end;