-- ����·�ˡ�����̫
-- by��Dan_Deng(2003-09-16)
Include("\\script\\event\\funv_jieri\\200803\\shenmixianhua.lua")--08��Ů�ڻ��08.4.1���ɾ��
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate >= 8030800 and ndate <= 8033124 then
		funv_jieri_shenmi:xianhua()	---08��Ů�ڻ��08.4.1���ɾ��
	else	
		Talk(1,"","�ҽ����Ѿ�80���ˣ��۾��������䱳������Ҳ�������ˣ��ԺȲ�������.")
	end
end;
