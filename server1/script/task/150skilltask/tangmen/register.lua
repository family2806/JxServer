Include("\\script\\task\\150skilltask\\task.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\task\\150skilltask\\tangmen\\tangmen.lua")
--打开150级技能 - Modified By NgaVN - 20121207
pTask = TaskClass:New()
pTask.m_szTaskName = "唐门"
pTask.m_nTaskId = 2
pTask.m_nBase = 1
pTask.tbConfig = tbConfig
pTask.tbMissionDialog = tbMissionDialog
G_TASK:AddTask(pTask)
