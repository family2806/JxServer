ROLENAMEQUERY_FREE		= 0		-- �ý�ɫ��δ��ʹ��
ROLENAMEQUERY_INVALID	= 1		-- �ý�ɫ���Ƿ�
ROLENAMEQUERY_USED		= 2		-- �ý�ɫ���ѱ�ʹ��
                                -- 
ROLENAMECHANGE_SUCCESS	= 0		-- �����ɹ�
ROLENAMECHANGE_FAILURE	= 1		-- ����ʧ��
ROLENAMECHANGE_INVALID	= 2		-- �ý�ɫ���Ƿ�
ROLENAMECHANGE_USED		= 3		-- �ý�ɫ���ѱ�ʹ��
ROLENAMECHANGE_ONLINE	= 4		-- �ý�ɫ����

function QueryNameResult(newname, result)
	local msg = "<color=red>" .. newname .. "<color>"
	if (result == ROLENAMEQUERY_FREE) then
		msg = msg .. " danh t� n�y c�n kh�ng c� b� s� d�ng "
	elseif (result == ROLENAMEQUERY_USED) then
		msg = msg .. " danh t� n�y �� b� s� d�ng "
	else
		msg = msg .. " danh t� n�y kh�ng c� hi�u qu� , kh�ng th� s� d�ng "
	end
	Talk(1, "", msg)
end

function ChangeNameResult(newname, result)
	local msg = "<color=red>" .. newname .. "<color>"
	if (result == ROLENAMECHANGE_FAILURE) then
		msg = msg .. " danh t� n�y kh�ng th� s� d�ng "
	elseif (result == ROLENAMECHANGE_USED or result == ROLENAMECHANGE_ONLINE) then
		msg = msg .. " danh t� n�y �� b� s� d�ng "
	else
		msg = msg .. " danh t� n�y kh�ng c� hi�u qu� , kh�ng th� s� d�ng "
	end
	Talk(1, "", msg)
end
