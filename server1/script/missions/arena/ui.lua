if MODEL_GAMECLIENT ~= 1 then
	return
end
--Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\script_protocol\\protocol_def_c.lua")




function open_credits_shop()
	
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_OPEN_CREDITS_SHOP", 0)
end

function signup_arean()
	
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_SIGNUP_AREAN", 0)
end