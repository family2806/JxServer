-- 临安　路人　丁磊
-- by：Dan_Deng(2003-09-16)

-- 各个级别的同伴剧情任务实体处理文件
Include ("\\script\\task\\partner\\master\\partner_master_main_03.lua");

function main()

	-- 剧情篇
	if taskProcess_003_02:doTaskEntity()~=0 then return end;
	if taskProcess_003_04:doTaskEntity()~=0 then return end;

	-- 修炼篇
	if rewindProcess_003_02:doTaskEntity()~=0 then return end;
	if rewindProcess_003_04:doTaskEntity()~=0 then return end;


	Talk(1,"","丁员外：金人都是些有勇无谋的蛮夷之辈，哪里是我们大宋的对手？咱们何必杞人忧天，自己吓自己？有皇上在这里，我就不信那些金人能打到临安来！")

end;
