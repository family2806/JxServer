--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË13ºØÀ¼Ö¥¶Ô»°
Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_helanzhi()
	else
Say("Chång ta ë Thµnh §« lµm sai ®Çu, rÊt cùc khæ! Ta ph¶i mét vµi mãn ngon cho huynh Êy ®Ó båi bæ søc khoÎ.",0)
	end
end;