Include("\\script\\event\\storm\\head.lua")
Include("\\script\\lib\\basic.lua")
Include("\\script\\lib\\say.lua")
Include("\\script\\task\\task_addplayerexp.lua"), nh�n ���c ph�n th��ng, nh�n ���c ph�n th��ng--������ۼӾ���Ĺ�������

IncludeLib("FILESYS")
IncludeLib("TITLE")
IncludeLib("ITEM")

--danh, nh�n ���c ph�n th��ng�ε���������
TB_STORM_LADDERNAME, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{"Qu�n, nh�n ���c ph�n th��ngqu�n",, nh�n ���c ph�n th��ng"�, nh�n ���c ph�n th��ngqu�n",, nh�n ���c ph�n th��ng"H�ng, nh�n ���c ph�n th��ng3",, nh�n ���c ph�n th��ng", nh�n ���c ph�n th��ngH�ng, nh�n ���c ph�n th��ng4",, nh�n ���c ph�n th��ng", nh�n ���c ph�n th��ngH�ng, nh�n ���c ph�n th��ng5",
	"H�ng, nh�n ���c ph�n th��ng6",, nh�n ���c ph�n th��ng", nh�n ���c ph�n th��ngH�ng, nh�n ���c ph�n th��ng7",, nh�n ���c ph�n th��ng", nh�n ���c ph�n th��ngH�ng, nh�n ���c ph�n th��ng8",, nh�n ���c ph�n th��ng", nh�n ���c ph�n th��ngH�ng, nh�n ���c ph�n th��ng9",, nh�n ���c ph�n th��ng", nh�n ���c ph�n th��ngH�ng, nh�n ���c ph�n th��ng10",, nh�n ���c ph�n th��ng"kh�ng, nh�n ���c ph�n th��ngc�, nh�n ���c ph�n th��ngtrong, nh�n ���c ph�n th��ngb�ng, nh�n ���c ph�n th��ngx�p, nh�n ���c ph�n th��ngh�ng",, nh�n ���c ph�n th��ng"Kh�ng, nh�n ���c ph�n th��ngc�, nh�n ���c ph�n th��ngx�p, nh�n ���c ph�n th��ngh�ng"}

--�����˴���	
STORM_WLMCR, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>V�, nh�n ���c ph�n th��ngl�m, nh�n ���c ph�n th��ngtruy�n, nh�n ���c ph�n th��ngnh�n<link>"

--���ָ����awardtype
--awardid, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ngnil	���أ���ph�t+/-����	����l�nhȡ�����н���
--awardid, nh�n ���c ph�n th��ng>, nh�n ���c ph�n th��ng0		���أ�nil������l�nhȡ	���򷵻ػ�ph�t+/-����
function, nh�n ���c ph�n th��ngstorm_checkaward(awardtype,, nh�n ���c ph�n th��ngawardid)
	storm_anotherday()
	
	if, nh�n ���c ph�n th��ng(awardtype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ngnil, nh�n ���c ph�n th��ngor, nh�n ���c ph�n th��ngTB_STORM_AWARD[awardtype], nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ngnil), nh�n ���c ph�n th��ngthen
		return, nh�n ���c ph�n th��ngnil
	end
	
	if, nh�n ���c ph�n th��ng(GetTask(TB_STORM_AWARD[awardtype][3]), nh�n ���c ph�n th��ng>, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngthen
		Say("Xin, nh�n ���c ph�n th��ngl�i!, nh�n ���c ph�n th��ng"..TB_STORM_AWARD[awardtype][1].."ph�n, nh�n ���c ph�n th��ngth��ng, nh�n ���c ph�n th��ngc�a, nh�n ���c ph�n th��ngng��i, nh�n ���c ph�n th��ng��, nh�n ���c ph�n th��ngnh�n, nh�n ���c ph�n th��ngqua, nh�n ���c ph�n th��ngr�i!",, nh�n ���c ph�n th��ng0)
		return, nh�n ���c ph�n th��ngnil
	end
	
	local, nh�n ���c ph�n th��ngawardvalue, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng0
	if, nh�n ���c ph�n th��ng(TB_STORM_AWARD[awardtype][2], nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng1), nh�n ���c ph�n th��ngthen
		awardvalue, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng-storm_getrank(awardtype)	--�ø������Ƚϸ�����
	else
		awardvalue, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngGetTask(TB_STORM_AWARD[awardtype][4])
	end
	
	if, nh�n ���c ph�n th��ng(awardid, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ngnil), nh�n ���c ph�n th��ngthen
		local, nh�n ���c ph�n th��ngtb_award, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{}
		local, nh�n ���c ph�n th��ngawardlevel, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngawardvalue
		for, nh�n ���c ph�n th��ngi, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng1,, nh�n ���c ph�n th��nggetn(TB_STORM_AWARD[awardtype][5]), nh�n ���c ph�n th��ngdo
			if, nh�n ���c ph�n th��ng(awardvalue, nh�n ���c ph�n th��ng>=, nh�n ���c ph�n th��ngTB_STORM_AWARD[awardtype][5][i][1]), nh�n ���c ph�n th��ngthen
				if, nh�n ���c ph�n th��ng(awardlevel, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ngTB_STORM_AWARD[awardtype][5][i][1], nh�n ���c ph�n th��ngor, nh�n ���c ph�n th��nggetn(tb_award), nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngthen	--����l�nh�ͼ�����
					awardlevel, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngTB_STORM_AWARD[awardtype][5][i][1]
					tb_award[getn(tb_award)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngi
				end
			end
		end
		return, nh�n ���c ph�n th��ngawardvalue,, nh�n ���c ph�n th��ngtb_award
	else
		if, nh�n ���c ph�n th��ng(awardvalue, nh�n ���c ph�n th��ng<, nh�n ���c ph�n th��ngTB_STORM_AWARD[awardtype][5][awardid][1]), nh�n ���c ph�n th��ngthen
			Say("V�, nh�n ���c ph�n th��ngl�m, nh�n ���c ph�n th��ngtruy�n, nh�n ���c ph�n th��ngnh�n:, nh�n ���c ph�n th��ngH�nh, nh�n ���c ph�n th��ngnh�, nh�n ���c ph�n th��ngng��i, nh�n ���c ph�n th��ngkh�ng, nh�n ���c ph�n th��ngth�, nh�n ���c ph�n th��ngnh�n, nh�n ���c ph�n th��ngph�n, nh�n ���c ph�n th��ngth��ng, nh�n ���c ph�n th��ngn�y!",, nh�n ���c ph�n th��ng0)
			return, nh�n ���c ph�n th��ngnil
		else
			return, nh�n ���c ph�n th��ngawardvalue
		end
	end
end

--���Ի�
function, nh�n ���c ph�n th��ngstorm_main()
	if, nh�n ���c ph�n th��ng(GetTask(STORM_TASKID_LETTER), nh�n ���c ph�n th��ng~=, nh�n ���c ph�n th��ng2), nh�n ���c ph�n th��ngthen
		Describe(STORM_WLMCR.."<#>, nh�n ���c ph�n th��ngKi�p, nh�n ���c ph�n th��nggiang, nh�n ���c ph�n th��ngh�, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngs�ng, nh�n ���c ph�n th��ngn�i, nh�n ���c ph�n th��ngl�, nh�n ���c ph�n th��ngnh�!, nh�n ���c ph�n th��ngNg�ng, nh�n ���c ph�n th��ngm�t, nh�n ���c ph�n th��ngnh�n, nh�n ���c ph�n th��ngtr�ng,, nh�n ���c ph�n th��ngcu�i, nh�n ���c ph�n th��ng��u, nh�n ���c ph�n th��ngmh�n, nh�n ���c ph�n th��ngn��c!, nh�n ���c ph�n th��ngCh�t, nh�n ���c ph�n th��ngngh�, nh�n ���c ph�n th��ng��n, nh�n ���c ph�n th��ngc�u, nh�n ���c ph�n th��ngth�:, nh�n ���c ph�n th��ngV�, nh�n ���c ph�n th��ngth�, nh�n ���c ph�n th��ng���ng, nh�n ���c ph�n th��ng��i, nh�n ���c ph�n th��ngb�ng, nh�n ���c ph�n th��ngph�ng, nh�n ���c ph�n th��ngm�i,, nh�n ���c ph�n th��nganh, nh�n ���c ph�n th��ngh�ng, nh�n ���c ph�n th��ngh�o, nh�n ���c ph�n th��ngki�t, nh�n ���c ph�n th��ngc�, nh�n ���c ph�n th��ngh�n, nh�n ���c ph�n th��ngai!",, nh�n ���c ph�n th��ng1,, nh�n ���c ph�n th��ng"B�t, nh�n ���c ph�n th��ng��u, nh�n ���c ph�n th��ngho�t, nh�n ���c ph�n th��ng��ng, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngba, nh�n ���c ph�n th��ngth�ng, nh�n ���c ph�n th��ng9/storm_main")
		Msg2Player("B�n, nh�n ���c ph�n th��ngnh�n, nh�n ���c ph�n th��ng���c, nh�n ���c ph�n th��ngb�n, nh�n ���c ph�n th��ngth�o, nh�n ���c ph�n th��ngth�n, nh�n ���c ph�n th��ngb�, nh�n ���c ph�n th��ngc�a, nh�n ���c ph�n th��ngTh�m, nh�n ���c ph�n th��ngThi�u, nh�n ���c ph�n th��ngVi�n")
		AddItem(6,, nh�n ���c ph�n th��ng1,, nh�n ���c ph�n th��ng898,, nh�n ���c ph�n th��ng1,, nh�n ���c ph�n th��ng0, nh�n ���c ph�n th��ng,0)
		SetTask(STORM_TASKID_LETTER,, nh�n ���c ph�n th��ng2)
	else
		local, nh�n ���c ph�n th��ngtb_option, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{}
		tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Ta, nh�n ���c ph�n th��ngmu�n, nh�n ���c ph�n th��ngl�nh, nh�n ���c ph�n th��ngph�n, nh�n ���c ph�n th��ngth��ng, nh�n ���c ph�n th��ngh�m, nh�n ���c ph�n th��ngnay/#storm_award(1)"
		if, nh�n ���c ph�n th��ng(GetTask(STORM_TASKID_DAY_LASTAWARD), nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngthen
			tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Ta, nh�n ���c ph�n th��ngmu�n, nh�n ���c ph�n th��ngl�nh, nh�n ���c ph�n th��ngph�n, nh�n ���c ph�n th��ngth��ng, nh�n ���c ph�n th��ngh�m, nh�n ���c ph�n th��ngqua/#storm_award(4)"
		end
		tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Ta, nh�n ���c ph�n th��ngmu�n, nh�n ���c ph�n th��ngl�nh, nh�n ���c ph�n th��ngph�n, nh�n ���c ph�n th��ngth��ng, nh�n ���c ph�n th��ngtu�n, nh�n ���c ph�n th��ngtr��c/#storm_award(2)"
		tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Ta, nh�n ���c ph�n th��ngmu�n, nh�n ���c ph�n th��ngl�nh, nh�n ���c ph�n th��ngph�n, nh�n ���c ph�n th��ngth��ng, nh�n ���c ph�n th��ngth�ng, nh�n ���c ph�n th��ngtr��c/#storm_award(3)"
		tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"T�m, nh�n ���c ph�n th��nghi�u, nh�n ���c ph�n th��ng�i�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngc�a, nh�n ���c ph�n th��ngta/#storm_query(0)"
		tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"T�m, nh�n ���c ph�n th��nghi�u, nh�n ���c ph�n th��ngho�t, nh�n ���c ph�n th��ng��ng, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa/storm_help"
		tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Kh�ng, nh�n ���c ph�n th��ngc�n!/OnCancel"
		Describe(STORM_WLMCR.."<#>, nh�n ���c ph�n th��ngXin, nh�n ���c ph�n th��ngxem, nh�n ���c ph�n th��ngth�ng, nh�n ���c ph�n th��ngtin, nh�n ���c ph�n th��ngchi, nh�n ���c ph�n th��ngti�t, nh�n ���c ph�n th��ngho�t, nh�n ���c ph�n th��ng��ng, nh�n ���c ph�n th��ngtr�n, nh�n ���c ph�n th��ngtrang, nh�n ���c ph�n th��ngch�, nh�n ���c ph�n th��ng",, nh�n ���c ph�n th��nggetn(tb_option),, nh�n ���c ph�n th��ngtb_option)
	end
	storm_anotherday()
end

--l�nhȡ�������鿴������
function, nh�n ���c ph�n th��ngstorm_award(awardtype)
	local, nh�n ���c ph�n th��ngawardvalue,, nh�n ���c ph�n th��ngtb_award, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstorm_checkaward(awardtype)
	if, nh�n ���c ph�n th��ng(awardvalue, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ngnil), nh�n ���c ph�n th��ngthen
		return
	end
	
	local, nh�n ���c ph�n th��ngstr, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng""
	if, nh�n ���c ph�n th��ng(awardvalue, nh�n ���c ph�n th��ng>=, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngthen
		str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"B�n, nh�n ���c ph�n th��ng"..TB_STORM_AWARD[awardtype][1].."t�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa, nh�n ���c ph�n th��ngl�:"..storm_point2str(awardvalue)
	elseif, nh�n ���c ph�n th��ng(awardvalue, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng-12), nh�n ���c ph�n th��ngthen
		str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngTB_STORM_AWARD[awardtype][1].."kh�ng, nh�n ���c ph�n th��ngc�, nh�n ���c ph�n th��ngtrong, nh�n ���c ph�n th��ngb�ng, nh�n ���c ph�n th��ngx�p, nh�n ���c ph�n th��ngh�ng"
	elseif, nh�n ���c ph�n th��ng(awardvalue, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng-11), nh�n ���c ph�n th��ngthen
		str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"B�n, nh�n ���c ph�n th��ng"..TB_STORM_AWARD[awardtype][1].."kh�ng, nh�n ���c ph�n th��ngc�, nh�n ���c ph�n th��ngtrong, nh�n ���c ph�n th��ngb�ng, nh�n ���c ph�n th��ngx�p, nh�n ���c ph�n th��ngh�ng"
	elseif, nh�n ���c ph�n th��ng(awardvalue, nh�n ���c ph�n th��ng>=, nh�n ���c ph�n th��ng-3), nh�n ���c ph�n th��ngthen
		str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"B�n, nh�n ���c ph�n th��ng"..TB_STORM_AWARD[awardtype][1].."trong, nh�n ���c ph�n th��ngho�t, nh�n ���c ph�n th��ng��ng, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngba, nh�n ���c ph�n th��ngth�ng, nh�n ���c ph�n th��ng9"..storm_point2str(TB_STORM_LADDERNAME[-awardvalue])
	else
		str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"B�n, nh�n ���c ph�n th��ng"..TB_STORM_AWARD[awardtype][1].."trong, nh�n ���c ph�n th��ngho�t, nh�n ���c ph�n th��ng��ng, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngba, nh�n ���c ph�n th��ngth�ng, nh�n ���c ph�n th��ng9��danh, nh�n ���c ph�n th��ng"..storm_point2str(-awardvalue).."danh, nh�n ���c ph�n th��ng"
	end
	
	local, nh�n ���c ph�n th��ngawardcount, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��nggetn(tb_award)
	if, nh�n ���c ph�n th��ng(awardcount, nh�n ���c ph�n th��ng>, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngthen
		local, nh�n ���c ph�n th��ngtb_option, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{}
		if, nh�n ���c ph�n th��ng(awardcount, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng1), nh�n ���c ph�n th��ngthen
			str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr..",, nh�n ���c ph�n th��ngB�n, nh�n ���c ph�n th��ng����l�nhȡ��Ʒ:, nh�n ���c ph�n th��ng<enter>"
			str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr.."<color=green>"..TB_STORM_AWARD[awardtype][5][tb_award[1]][2].."<color><enter>"
			str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr.."<enter>,, nh�n ���c ph�n th��ngnh�n, nh�n ���c ph�n th��ngb�y, nh�n ���c ph�n th��nggi�, nh�n ���c ph�n th��ngch�?"
			Say("V�, nh�n ���c ph�n th��ngl�m, nh�n ���c ph�n th��ngtruy�n, nh�n ���c ph�n th��ngnh�n:"..str,, nh�n ���c ph�n th��ng2,, nh�n ���c ph�n th��ng"Ta, nh�n ���c ph�n th��ngmu�n, nh�n ���c ph�n th��ngnh�n, nh�n ���c ph�n th��ngph�n, nh�n ���c ph�n th��ngth��ng/#storm_getaward("..awardtype..","..tb_award[1]..",0)",, nh�n ���c ph�n th��ng"��, nh�n ���c ph�n th��ngta, nh�n ���c ph�n th��ngsuy, nh�n ���c ph�n th��ngngh�, nh�n ���c ph�n th��ngl�i/OnCancel")
		else
			str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr..",, nh�n ���c ph�n th��ngB�n, nh�n ���c ph�n th��ng����T�i���½��ph�t���ѡһ��:, nh�n ���c ph�n th��ng<enter>"
			for, nh�n ���c ph�n th��ngi, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng1,, nh�n ���c ph�n th��nggetn(tb_award), nh�n ���c ph�n th��ngdo
				if, nh�n ���c ph�n th��ng(i, nh�n ���c ph�n th��ng>=, nh�n ���c ph�n th��ng2), nh�n ���c ph�n th��ngthen
					str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr.."ho�c, nh�n ���c ph�n th��ng, nh�n ���c ph�n th��ng, nh�n ���c ph�n th��ng"
				end
				local, nh�n ���c ph�n th��ngawardname, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngTB_STORM_AWARD[awardtype][5][tb_award[tb_award[i]]][2]
				str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr.."<color=green>"..awardname.."<color><enter>"
				tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"l�nh"..awardname.."/#storm_getaward("..awardtype..","..tb_award[i]..",0)"
			end
			str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr.."<enter>, nh�n ���c ph�n th��ngQuy�t, nh�n ���c ph�n th��ng��nh, nh�n ���c ph�n th��ngxong, nh�n ���c ph�n th��ngch�a?"
			tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Kh�ng, nh�n ���c ph�n th��ngc�n!/OnCancel"
			Say("V�, nh�n ���c ph�n th��ngl�m, nh�n ���c ph�n th��ngtruy�n, nh�n ���c ph�n th��ngnh�n:"..str,, nh�n ���c ph�n th��nggetn(tb_option),, nh�n ���c ph�n th��ngtb_option)
		end
	else
		Say("V�, nh�n ���c ph�n th��ngl�m, nh�n ���c ph�n th��ngtruy�n, nh�n ���c ph�n th��ngnh�n:"..str..",, nh�n ���c ph�n th��ngB�n, nh�n ���c ph�n th��ng�޷�l�nh��",, nh�n ���c ph�n th��ng0)
		return
	end
end

--l�nhȡָ����Ʒ
function, nh�n ���c ph�n th��ngstorm_getaward(awardtype,, nh�n ���c ph�n th��ngawardid,, nh�n ���c ph�n th��ngsure)
	local, nh�n ���c ph�n th��ngawardvalue, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstorm_checkaward(awardtype,, nh�n ���c ph�n th��ngawardid)
	if, nh�n ���c ph�n th��ng(not, nh�n ���c ph�n th��ngstorm_checkaward(awardtype,, nh�n ���c ph�n th��ngawardid)), nh�n ���c ph�n th��ngthen
		return
	end

	if, nh�n ���c ph�n th��ng(sure, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng1), nh�n ���c ph�n th��ngthen
		Say("l�nh��ǰ������!",, nh�n ���c ph�n th��ng2,, nh�n ���c ph�n th��ng"Ta, nh�n ���c ph�n th��ng��, nh�n ���c ph�n th��ngs�n, nh�n ���c ph�n th��ngs�ng!/#storm_getaward("..awardtype..","..awardid..",2)",, nh�n ���c ph�n th��ng"Ta, nh�n ���c ph�n th��ngc�n, nh�n ���c ph�n th��ngph�i, nh�n ���c ph�n th��ngs�p, nh�n ���c ph�n th��ngx�p, nh�n ���c ph�n th��ngl�i, nh�n ���c ph�n th��ngh�nh, nh�n ���c ph�n th��ngtrang/OnCancel")
	elseif, nh�n ���c ph�n th��ng(sure, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng2), nh�n ���c ph�n th��ngthen
		if, nh�n ���c ph�n th��ng(CalcFreeItemCellCount(), nh�n ���c ph�n th��ng<, nh�n ���c ph�n th��ngstorm_countallaward(TB_STORM_AWARD[awardtype][5][awardid][3])), nh�n ���c ph�n th��ngthen
			Say("B�n, nh�n ���c ph�n th��ng�ı���û�пռ䣬����һ��!",, nh�n ���c ph�n th��ng0)
		else
			if, nh�n ���c ph�n th��ng(awardtype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng1, nh�n ���c ph�n th��ngor, nh�n ���c ph�n th��ngawardtype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng4), nh�n ���c ph�n th��ngthen
				local, nh�n ���c ph�n th��ngmapid, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngtostring(SubWorldIdx2ID(SubWorld))
				local, nh�n ���c ph�n th��ngplcount, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngGetGlbValue(46), nh�n ���c ph�n th��ng+, nh�n ���c ph�n th��ng1
				SetGlbValue(46,, nh�n ���c ph�n th��ngplcount)
				Ladder_NewLadder(10195,, nh�n ���c ph�n th��ngmapid,, nh�n ���c ph�n th��ngplcount,, nh�n ���c ph�n th��ng1)
			end
			local, nh�n ���c ph�n th��ngstr, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Nh�n, nh�n ���c ph�n th��ng���c"..TB_STORM_AWARD[awardtype][1].."Ph�n, nh�n ���c ph�n th��ngth��ng, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa, nh�n ���c ph�n th��ng"..TB_STORM_AWARD[awardtype][5][awardid][2]
			WriteLog("[STORM_AWARD]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\t"..awardvalue.."\t"..str)
			Msg2Player(str)
			SetTask(TB_STORM_AWARD[awardtype][3],, nh�n ���c ph�n th��ng1)
			storm_giveallaward(TB_STORM_AWARD[awardtype][5][awardid][3])
			if, nh�n ���c ph�n th��ng(awardvalue, nh�n ���c ph�n th��ng>=, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngthen
				str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngawardvalue.."�i�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa"
			else
				str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"X�p, nh�n ���c ph�n th��ngh�ng, nh�n ���c ph�n th��ngth�, nh�n ���c ph�n th��ng"..(-awardvalue).."danh, nh�n ���c ph�n th��ng"
			end
			if, nh�n ���c ph�n th��ng(awardtype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng2, nh�n ���c ph�n th��ngor, nh�n ���c ph�n th��ngawardtype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng3, nh�n ���c ph�n th��ngor, nh�n ���c ph�n th��ngawardid, nh�n ���c ph�n th��ng<=, nh�n ���c ph�n th��ng2), nh�n ���c ph�n th��ngthen	--�󽱷�������
				AddGlobalNews(GetName().."T�i"..TB_STORM_AWARD[awardtype][1].."�籩���Nh�n, nh�n ���c ph�n th��ng���c"..TB_STORM_AWARD[awardtype][5][awardid][2]..", nh�n ���c ph�n th��ng")
			end
		end
	else
		Say("B�n, nh�n ���c ph�n th��ngȷ��l�nhȡ<color=red>"..TB_STORM_AWARD[awardtype][5][awardid][2].."<color>, nh�n ���c ph�n th��ng����?, nh�n ���c ph�n th��ngl�nh��֮����l�nh��"..TB_STORM_AWARD[awardtype][1].."ph�n th��ng kh�c n�a!",, nh�n ���c ph�n th��ng2,, nh�n ���c ph�n th��ng"֪����!, nh�n ���c ph�n th��ng��ֻl�nh������ˣ�/#storm_getaward("..awardtype..","..awardid..",1)",, nh�n ���c ph�n th��ng"Kh�ng, nh�n ���c ph�n th��ngc�n!/OnCancel")
	end
end

--��ѯ���ˮi�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa���
function, nh�n ���c ph�n th��ngstorm_query(querytype)
	storm_anotherday()
	
	local, nh�n ���c ph�n th��ngstr, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng""
	local, nh�n ���c ph�n th��ngtb_sheet, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{}
	local, nh�n ���c ph�n th��ngvar_width,, nh�n ���c ph�n th��ngvar_align
	if, nh�n ���c ph�n th��ng(querytype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng1), nh�n ���c ph�n th��ngthen
		if, nh�n ���c ph�n th��ng(GetTask(STORM_TASKID_DAY), nh�n ���c ph�n th��ng<=, nh�n ���c ph�n th��ngSTORM_END_DAY), nh�n ���c ph�n th��ngthen
			str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"B�n, nh�n ���c ph�n th��ng��nh�t �Įi�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa����:, nh�n ���c ph�n th��ng<enter>%��nh�t �ܻ�ph�t��:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT))
			var_width, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{12,8,8,10}
			var_align, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng2
			tb_sheet[getn(tb_sheet)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{"�danh, nh�n ���c ph�n th��ng",, nh�n ���c ph�n th��ng"S� l�n",, nh�n ���c ph�n th��ng"Tr�ng th�i ",, nh�n ���c ph�n th��ng"�i�m t�ch l�y cao nh�t"}
			for, nh�n ���c ph�n th��ngi, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng1,, nh�n ���c ph�n th��ngSTORM_GAMEID_MAX, nh�n ���c ph�n th��ngdo
				if, nh�n ���c ph�n th��ng(TB_STORM_TASKID[i], nh�n ���c ph�n th��ng~=, nh�n ���c ph�n th��ngnil), nh�n ���c ph�n th��ngthen
					local, nh�n ���c ph�n th��ngtrycount, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngGetTask(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
					local, nh�n ���c ph�n th��ngstate, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng""
					if, nh�n ���c ph�n th��ngstorm_valid_game(i), nh�n ���c ph�n th��ngthen
						state, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"<color=red>��T�i����<color>"
					elseif, nh�n ���c ph�n th��ng(trycount, nh�n ���c ph�n th��ng<=, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngthen
						state, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"<color=blue>Ch�a ti�n h�nh<color>"
					elseif, nh�n ���c ph�n th��ng(trycount, nh�n ���c ph�n th��ng<, nh�n ���c ph�n th��ngTB_STORM_TRYTIMES[i]), nh�n ���c ph�n th��ngthen
						state, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"<color=green>�� ti�n h�nh<color>"
					else
						state, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"<color=8947848>�� k�t th�c<color>"
					end
					tb_sheet[getn(tb_sheet)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{
						storm_gamename(i),
						storm_point2str(trycount).."/"..TB_STORM_TRYTIMES[i],
						state,
						storm_point2str(GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX]))
					}
				end
			end
		else
			str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"ho�t ��ng <color=red>Phong ba th�ng 9<color> �� k�t th�c!"
		end
	elseif, nh�n ���c ph�n th��ng(querytype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng2), nh�n ���c ph�n th��ngthen
		str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng", nh�n ���c ph�n th��ng, nh�n ���c ph�n th��ngB�n, nh�n ���c ph�n th��ng�����t�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa, nh�n ���c ph�n th��ngl�:<enter>%s"
		var_width, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{8,10,6,8,10}
		var_align, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng2
		tb_sheet[getn(tb_sheet)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{
			"�i�m t�ch l�y h�m nay",, nh�n ���c ph�n th��ngstorm_point2str(GetTask(STORM_TASKID_DAY_POINT)),, nh�n ���c ph�n th��ng"",
			"�i�m t�ch l�y h�m qua",, nh�n ���c ph�n th��ngstorm_point2str(GetTask(STORM_TASKID_DAY_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{
			"�i�m t�ch l�y tu�n n�y",, nh�n ���c ph�n th��ngstorm_point2str(GetTask(STORM_TASKID_WEEK_POINT)),, nh�n ���c ph�n th��ng"",
			"�i�m t�ch l�y tu�n tr��c",, nh�n ���c ph�n th��ngstorm_point2str(GetTask(STORM_TASKID_WEEK_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{
			"�i�m t�ch l�y th�ng n�y",, nh�n ���c ph�n th��ngstorm_point2str(GetTask(STORM_TASKID_MONTH_POINT)),, nh�n ���c ph�n th��ng"",
			"�i�m t�ch l�y th�ng tr��c",, nh�n ���c ph�n th��ngstorm_point2str(GetTask(STORM_TASKID_MONTH_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{
			"��Tu�n��danh, nh�n ���c ph�n th��ng",, nh�n ���c ph�n th��ng"<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(2)].."<color>",, nh�n ���c ph�n th��ng"",
			"��nguy�t ��danh, nh�n ���c ph�n th��ng",, nh�n ���c ph�n th��ng"<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(3)].."<color>"
		}
	else
		Say("B�n, nh�n ���c ph�n th��ng���˽�ʲô����?",, nh�n ���c ph�n th��ng3,, nh�n ���c ph�n th��ng"�ҽ���Įi�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa/#storm_query(1)",, nh�n ���c ph�n th��ng"������Įi�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa/#storm_query(2)",, nh�n ���c ph�n th��ng"Kh�ng c� chuy�n g� ��u!/OnCancel")
		return
	end
	str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngformat(str,, nh�n ���c ph�n th��ngmaketable(tb_sheet,, nh�n ���c ph�n th��ngvar_width,, nh�n ���c ph�n th��ngvar_align))
	Say(str,, nh�n ���c ph�n th��ng2,, nh�n ���c ph�n th��ng"Ti�p t�c t�m hi�u/#storm_query(0)",, nh�n ���c ph�n th��ng"Kh�ng c� g�, c�m �n!/OnCancel")
end

--�˵��������
function, nh�n ���c ph�n th��ngstorm_help()
	local, nh�n ���c ph�n th��ngtb_option, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{}
	for, nh�n ���c ph�n th��ngi, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng1,, nh�n ���c ph�n th��ngSTORM_GAMEID_MAX, nh�n ���c ph�n th��ngdo
		if, nh�n ���c ph�n th��ng(TB_STORM_TASKID[i], nh�n ���c ph�n th��ng~=, nh�n ���c ph�n th��ngnil), nh�n ���c ph�n th��ngthen
			tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Li�n quan ho�t ��ng Phong Ba-"..TB_STORM_DESCRIBE[i].."gi�p ��/#storm_help_game("..i..")"
		end
	end
	tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Li�n quan ph�n th��ng ho�t ��ng Phong Ba/#storm_help_award(0)"
	tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Ta bi�t r�i!/OnCancel"
	Say(", nh�n ���c ph�n th��ng, nh�n ���c ph�n th��ng�籩���8/9/��n2/10,, nh�n ���c ph�n th��ng�����ν�ս��,, nh�n ���c ph�n th��ngҰ��������,, nh�n ���c ph�n th��ngɱ����������., nh�n ���c ph�n th��ngÿ�콫�����ϵͳ�еĳɼ�����<color=yellow>�i�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa<color>, nh�n ���c ph�n th��ng(�μ�����:, nh�n ���c ph�n th��ng50���������), nh�n ���c ph�n th��ng.ÿnh�t m�yph�t��T�i<color=red>24:00֮������<color>,, nh�n ���c ph�n th��ng��T�i24:00ǰl�nh��.<enter>., nh�n ���c ph�n th��ngÿ��, nh�n ���c ph�n th��ng<color=red>23:30<color>, nh�n ���c ph�n th��ng�ν�ս����ʼ,, nh�n ���c ph�n th��ng�ɼ�����¼���i�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa.",, nh�n ���c ph�n th��nggetn(tb_option),, nh�n ���c ph�n th��ngtb_option)
end

--�˵��������ս
function, nh�n ���c ph�n th��ngstorm_help_game(gameid)
	local, nh�n ���c ph�n th��ngstr, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngTB_STORM_HELP[gameid]
	if, nh�n ���c ph�n th��ng(gameid, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng1), nh�n ���c ph�n th��ngthen	--�ν���Ҫ����˵��ph�t������
		str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngformat(str,, nh�n ���c ph�n th��ng"�߼��ν�ս��,, nh�n ���c ph�n th��ngÿ��ÿ�����ֻ��l�nhȡ�Įi�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa��<color=yellow>100<color>, nh�n ���c ph�n th��ng��., nh�n ���c ph�n th��ng���м��ν�ս�����ph�t��Nh�n, nh�n ���c ph�n th��ng���c<color=yellow>80<color>,, nh�n ���c ph�n th��ng<color=yellow>90<color>, nh�n ���c ph�n th��ng��.")
	end
	Say(str,, nh�n ���c ph�n th��ng2,, nh�n ���c ph�n th��ng"Mu�n t�m hi�u nh�ng th� kh�c/storm_help",, nh�n ���c ph�n th��ng"Ta bi�t r�i!/OnCancel")
end

--�˵����������
function, nh�n ���c ph�n th��ngstorm_help_award(awardtype,start)
	if, nh�n ���c ph�n th��ng(awardtype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngthen
		Say(", nh�n ���c ph�n th��ng, nh�n ���c ph�n th��ngÿ����ҿ��Ԯ�n���ִ��˴�,, nh�n ���c ph�n th��ng����<color=red>�i�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa<color>, nh�n ���c ph�n th��ng����l�nhȡ��Ӧ�Ľ���,, nh�n ���c ph�n th��ngͬʱ��ÿTu�n��ÿnguy�t ������Ӧ�Įi�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa����<color=red>��danh, nh�n ���c ph�n th��ngǰʮ<color>����T�i��nguy�t �ĵڶ������ڮ�n���ִ��˴�l�nh��",, nh�n ���c ph�n th��ng4,
			"Xem ph�n th��ng ng�y/#storm_help_award(1)",
			"Xem ph�n th��ng tu�n/#storm_help_award(2)",
			"Xem ph�n th��ng th�ng/#storm_help_award(3)",
			"Ta bi�t r�i!/OnCancel")
		return
	end
	
	local, nh�n ���c ph�n th��ngtb_awardstr, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{"nh�t ",, nh�n ���c ph�n th��ng"Tu�n",, nh�n ���c ph�n th��ng"nguy�t "}
	local, nh�n ���c ph�n th��ngstr, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"�i�m, nh�n ���c ph�n th��ngt�ch, nh�n ���c ph�n th��ngl�y, nh�n ���c ph�n th��ngPhong, nh�n ���c ph�n th��ngBa"..tb_awardstr[awardtype].."Ph�n th��ng nh� sau:"
	if, nh�n ���c ph�n th��ng(not, nh�n ���c ph�n th��ngstart), nh�n ���c ph�n th��ngthen
		start, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng1
	end
	local, nh�n ���c ph�n th��nglastvalue, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngnil
	local, nh�n ���c ph�n th��ngcount, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng0
	local, nh�n ���c ph�n th��ngPERPAGE, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng4
	for, nh�n ���c ph�n th��ngi, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstart,, nh�n ���c ph�n th��nggetn(TB_STORM_AWARD[awardtype][5]), nh�n ���c ph�n th��ngdo
		if, nh�n ���c ph�n th��ng(count, nh�n ���c ph�n th��ng>, nh�n ���c ph�n th��ngPERPAGE), nh�n ���c ph�n th��ngthen	--PERPAGE��һҳ
			break
		end
		count, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngcount, nh�n ���c ph�n th��ng+, nh�n ���c ph�n th��ng1
		
		local, nh�n ���c ph�n th��ngawardvalue, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngTB_STORM_AWARD[awardtype][5][i][1]
		if, nh�n ���c ph�n th��ng(lastvalue, nh�n ���c ph�n th��ng~=, nh�n ���c ph�n th��ngawardvalue), nh�n ���c ph�n th��ngthen
			if, nh�n ���c ph�n th��ng(awardvalue, nh�n ���c ph�n th��ng>=, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngthen
				str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr.."<enter>".."T�ch l�y"..storm_point2str(awardvalue,3).."ph�t"
			else
				if, nh�n ���c ph�n th��ng(lastvalue), nh�n ���c ph�n th��ngthen
					str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr.."<enter>"..tb_awardstr[awardtype].."��T�i��"..storm_point2str(1-lastvalue).."��n"..storm_point2str(-awardvalue).."m�y"
				else
					str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr.."<enter>"..tb_awardstr[awardtype].."��T�i��"..storm_point2str(-awardvalue).."m�y"
				end
			end
			lastvalue, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngawardvalue
		else
			str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr.."ho�c, nh�n ���c ph�n th��ng, nh�n ���c ph�n th��ng, nh�n ���c ph�n th��ng"
		end
		str, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngstr.."<color=yellow>"..TB_STORM_AWARD[awardtype][5][i][2].."<color>"
	end
	local, nh�n ���c ph�n th��ngtb_option, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng{}
	if, nh�n ���c ph�n th��ng(start, nh�n ���c ph�n th��ng>, nh�n ���c ph�n th��ng1), nh�n ���c ph�n th��ngthen
		tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Trang tr��c/#storm_help_award("..awardtype..","..(start-PERPAGE)..")"
	end
	if, nh�n ���c ph�n th��ng(start, nh�n ���c ph�n th��ng+, nh�n ���c ph�n th��ngcount, nh�n ���c ph�n th��ng<, nh�n ���c ph�n th��nggetn(TB_STORM_AWARD[awardtype][5])), nh�n ���c ph�n th��ngthen
		tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"Trang k� /#storm_help_award("..awardtype..","..(start+PERPAGE)..")"
	end
	tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"��Mu�n t�m hi�u nh�ng th� kh�c/storm_help"
	tb_option[getn(tb_option)+1], nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng"��Ta bi�t r�i!/OnCancel"
	Say(str,, nh�n ���c ph�n th��nggetn(tb_option),, nh�n ���c ph�n th��ngtb_option)
end

--Nh�n, nh�n ���c ph�n th��ng���c�����T�iָ�������е�danh, nh�n ���c ph�n th��ng��
function, nh�n ���c ph�n th��ngstorm_getrank(laddertype)
	local, nh�n ���c ph�n th��ngladderid, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngnil
	if, nh�n ���c ph�n th��ng(laddertype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng1), nh�n ���c ph�n th��ngthen	--nh�t ���У�����
		return, nh�n ���c ph�n th��ng12
	elseif, nh�n ���c ph�n th��ng(laddertype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng2), nh�n ���c ph�n th��ngthen	--Tu�n����
		local, nh�n ���c ph�n th��ngweekid, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngGetTask(STORM_TASKID_WEEK), nh�n ���c ph�n th��ng-, nh�n ���c ph�n th��ngSTORM_LADDER_WEEK
		if(weekid, nh�n ���c ph�n th��ng>=, nh�n ���c ph�n th��ng1, nh�n ���c ph�n th��ngand, nh�n ���c ph�n th��ngweekid, nh�n ���c ph�n th��ng<=, nh�n ���c ph�n th��ng4), nh�n ���c ph�n th��ngthen, nh�n ���c ph�n th��ng	--ֻ��2��3��4��5Tu�n����Tu�n
			ladderid, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngSTORM_LADDERID_WEEK1, nh�n ���c ph�n th��ng+, nh�n ���c ph�n th��ngweekid, nh�n ���c ph�n th��ng-, nh�n ���c ph�n th��ng1
		end
	elseif, nh�n ���c ph�n th��ng(laddertype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng3), nh�n ���c ph�n th��ngthen	--nguy�t ����
		if, nh�n ���c ph�n th��ng(GetTask(STORM_TASKID_MONTH), nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng10), nh�n ���c ph�n th��ngthen	--ֻ��10nguy�t ����Tu�n
			ladderid, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngSTORM_LADDERID_MONTH
		end
	else
		return, nh�n ���c ph�n th��ng12
	end
	
	if, nh�n ���c ph�n th��ng(ladderid, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ngnil), nh�n ���c ph�n th��ngthen
		return, nh�n ���c ph�n th��ng12
	end
	
	local, nh�n ���c ph�n th��ngplayername, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngGetName()
	for, nh�n ���c ph�n th��ngi, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng1,, nh�n ���c ph�n th��ng10, nh�n ���c ph�n th��ngdo
		if, nh�n ���c ph�n th��ng(playername, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ngLadder_GetLadderInfo(ladderid,, nh�n ���c ph�n th��ngi)), nh�n ���c ph�n th��ngthen
			return, nh�n ���c ph�n th��ngi
		end
	end
	return, nh�n ���c ph�n th��ng11
end

--�������ļӾ���
function, nh�n ���c ph�n th��ngstorm_addownexp(, nh�n ���c ph�n th��ngawardexp, nh�n ���c ph�n th��ng)
	tl_addPlayerExp(awardexp)
end

--����ȫ������
function, nh�n ���c ph�n th��ngstorm_giveallaward(tb_awards)
	for, nh�n ���c ph�n th��ngi, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng1,, nh�n ���c ph�n th��nggetn(tb_awards), nh�n ���c ph�n th��ngdo
		storm_giveoneaward(tb_awards[i])
	end
end

--����һ������
function, nh�n ���c ph�n th��ngstorm_giveoneaward(tb_award)
	local, nh�n ���c ph�n th��ngawardtype, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngtb_award[1]
	local, nh�n ���c ph�n th��ngawardcount, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngtb_award[3]
	if, nh�n ���c ph�n th��ng(awardtype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng1), nh�n ���c ph�n th��ngthen	--��ͨ��Ʒ
		while, nh�n ���c ph�n th��ng(awardcount, nh�n ���c ph�n th��ng>, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngdo
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddItem("..join(tb_award[2])..")")
			AddItem(storm_splittb(tb_award[2]))
			awardcount, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngawardcount, nh�n ���c ph�n th��ng-, nh�n ���c ph�n th��ng1
		end
	elseif, nh�n ���c ph�n th��ng(awardtype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng2), nh�n ���c ph�n th��ngthen	--�ƽ���Ʒ
		while, nh�n ���c ph�n th��ng(awardcount, nh�n ���c ph�n th��ng>, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngdo
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddGoldItem("..join(tb_award[2])..")")
			AddGoldItem(storm_splittb(tb_award[2]))
			awardcount, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngawardcount, nh�n ���c ph�n th��ng-, nh�n ���c ph�n th��ng1
		end
	elseif, nh�n ���c ph�n th��ng(awardtype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng3), nh�n ���c ph�n th��ngthen	--����Ʒ
		if, nh�n ���c ph�n th��ng(tb_award[2], nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng1), nh�n ���c ph�n th��ngthen	--����
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddOwnExp("..awardcount..")")
			storm_addownexp(awardcount)
		else	--������չ
			WriteLog("storm_giveoneaward, nh�n ���c ph�n th��ng:, nh�n ���c ph�n th��ngerror, nh�n ���c ph�n th��ngtb_award[2]")
		end
	elseif, nh�n ���c ph�n th��ng(awardtype, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng4), nh�n ���c ph�n th��ngthen	--�����Ʒ
		while, nh�n ���c ph�n th��ng(awardcount, nh�n ���c ph�n th��ng>, nh�n ���c ph�n th��ng0), nh�n ���c ph�n th��ngdo
			local, nh�n ���c ph�n th��nggiveindex, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngrandom(getn(tb_award[2]))
			storm_giveoneaward(tb_award[2][giveindex])
			awardcount, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngawardcount, nh�n ���c ph�n th��ng-, nh�n ���c ph�n th��ng1
		end
	else
		WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tstorm_giveoneaward, nh�n ���c ph�n th��ng:, nh�n ���c ph�n th��ngerror, nh�n ���c ph�n th��ngawardtype")
	end
end

--����ȫ��������Ʒ����
function, nh�n ���c ph�n th��ngstorm_countallaward(tb_awards)
	local, nh�n ���c ph�n th��ngcount, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng0
	for, nh�n ���c ph�n th��ngi, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng1,, nh�n ���c ph�n th��nggetn(tb_awards), nh�n ���c ph�n th��ngdo
		if, nh�n ���c ph�n th��ng(tb_awards[i][1], nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng1), nh�n ���c ph�n th��ngthen	--��ͨ��Ʒ
			count, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngcount, nh�n ���c ph�n th��ng+, nh�n ���c ph�n th��ngtb_awards[i][3]
		elseif, nh�n ���c ph�n th��ng(tb_awards[i][1], nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng2), nh�n ���c ph�n th��ngthen	--�ƽ���Ʒ
			count, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngcount, nh�n ���c ph�n th��ng+, nh�n ���c ph�n th��ngtb_awards[i][3]*2
		elseif, nh�n ���c ph�n th��ng(tb_awards[i][1], nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ng4), nh�n ���c ph�n th��ngthen	--�����Ʒ
			count, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ngcount, nh�n ���c ph�n th��ng+, nh�n ���c ph�n th��ngtb_awards[i][3]*2
		end
	end
	return, nh�n ���c ph�n th��ngcount
end

--�������
function, nh�n ���c ph�n th��ngstorm_splittb(tb,, nh�n ���c ph�n th��ngn)
	if, nh�n ���c ph�n th��ng(n, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��ngnil), nh�n ���c ph�n th��ngthen
		n, nh�n ���c ph�n th��ng=, nh�n ���c ph�n th��ng1
	end
	if, nh�n ���c ph�n th��ng(n, nh�n ���c ph�n th��ng==, nh�n ���c ph�n th��nggetn(tb)), nh�n ���c ph�n th��ngthen
		return, nh�n ���c ph�n th��ngtb[n]
	end
	return, nh�n ���c ph�n th��ngtb[n],, nh�n ���c ph�n th��ngstorm_splittb(tb,n+1)
end
