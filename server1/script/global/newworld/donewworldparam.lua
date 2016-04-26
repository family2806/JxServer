--donewworldparam.lua

Include("\\script\\lib\\string.lua")
Include("\\script\\maps\\newworldscript_h.lua")

aryChangeWorldExec = {}
function PraseParam(szParam)
	if (szParam == nil) then
		return nil
	end
	if (aryChangeWorldExec[SubWorld] == nil) then	--还没有函数链，分析参数
		aryChangeWorldExec[SubWorld] = {}
		local aryFuns = split(szParam, '|')
		for i = 1,getn(aryFuns) do
			local ExecFun = aryFuncStore[aryFuns[i]]
			if (ExecFun == nil)then
				print("Error: (Ne万万orld:%d) 没有定义函数%s", SubWorld, aryFuns[i])
			else
				aryChangeWorldExec[SubWorld][i] =  ExecFun;			
			end	
		end
	end
	return 1;
end

function DoNewWorldParam(szParam, bIn)
	if (PraseParam(szParam) == 1) then
		for i = 1,getn(aryChangeWorldExec[SubWorld]) do	--执行函数链
			aryChangeWorldExec[SubWorld][i](bIn)
		end
	end
end
