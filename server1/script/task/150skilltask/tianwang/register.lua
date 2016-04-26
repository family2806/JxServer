Include("\\script\\task\\150skilltask\\task.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\task\\150skilltask\\tianwang\\tianwang.lua")
--打开150级技能 - Modified By NgaVN - 20121207
pTask = TaskClass:New()
pTask.m_szTaskName = "天王"
pTask.m_nTaskId = 9
pTask.m_nBase = 1
pTask.tbConfig = tbConfig
pTask.tbMissionDialog = tbMissionDialog
G_TASK:AddTask(pTask)
