Include("\\script\\task\\150skilltask\\task.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\task\\150skilltask\\yuegedao\\yuegedao.lua")
--150���������� - Modified By NgaVN - 20121207
pTask = TaskClass:New()
pTask.m_szTaskName = "Nguy�t Ca ��o"
pTask.m_nTaskId = 11
pTask.m_nBase = 100
pTask.tbConfig = tbConfig
pTask.tbMissionDialog = tbMissionDialog
G_TASK:AddTask(pTask)
