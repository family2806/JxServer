Include("\\script\\task\\150skilltask\\task.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\task\\150skilltask\\gaibang\\gaibang.lua")
--开启150级技能任务 - Modified By NgaVN - 20121207
pTask = TaskClass:New()
pTask.m_szTaskName = "C竔 Bang"
pTask.m_nTaskId = 4
pTask.m_nBase = 1
pTask.tbConfig = tbConfig
pTask.tbMissionDialog = tbMissionDialog
G_TASK:AddTask(pTask)
