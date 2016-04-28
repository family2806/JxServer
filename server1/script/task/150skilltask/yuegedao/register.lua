Include("\\script\\task\\150skilltask\\task.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\task\\150skilltask\\yuegedao\\yuegedao.lua")
--150级技能任务 - Modified By NgaVN - 20121207
pTask = TaskClass:New()
pTask.m_szTaskName = "Nguy謙 Ca Фo"
pTask.m_nTaskId = 11
pTask.m_nBase = 100
pTask.tbConfig = tbConfig
pTask.tbMissionDialog = tbMissionDialog
G_TASK:AddTask(pTask)
