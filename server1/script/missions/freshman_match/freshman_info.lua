CP_MAXROUND = 40

CP_HELP_FRESHMAN = {
					"���� <color=yellow>������������<color> Ŀ����Ϊ�˽������ֵĽ�����Ϊͬ��������Ҵ����д����յĻ��ᣬ������ֵ��书���ܣ���ͬ���ֵܽ����Ļ��ᣬ��������ϰ�߽�������� ",
					"<color=yellow>�i��������<color>: �ȼ���50��90����ȥ����������������Ա����."..CP_MAXROUND.."��.",
					"<color=yellow>����ʱ��<color>: ��������������2005��6��1�յ�2005��6��10�ս���. <color=yellow>20:00<color> ��ʼ��<color=yellow>23:00<color> ����. ÿ <color=yellow>3<color> Сʱ�ܹ��� <color=yellow>9<color> ����ÿ�ֱ�������ʱ��Ϊ5���ӣ�����ʱ��Ϊ15����.",
					"���������������շ���ѡ��ǰ����. "..CP_MAXROUND.."��������ʤһ����3�֣���ƽΪ1�֣����˾�û�з֡�������ʱ������ϵͳ�Լ�ѡ��ǰ������뷷�������������ƺš�",
					"ÿ���μӱ���������ڲμӹ����У������һ��������ÿ�βμ�һ�ֽ����һ��������������һ��ܻ����Ʒ���磺�̻���������ʯ����Ե¶���ɲ�¶��ˮ����) "
				}

function help_freshmanmatch()
	Talk( 2, "help_freshmanmatch2", CP_HELP_FRESHMAN[ 1 ], CP_HELP_FRESHMAN[ 2 ])
end

function help_freshmanmatch2()
	Talk( 2, "help_freshmanmatch3", CP_HELP_FRESHMAN[ 3 ], CP_HELP_FRESHMAN[ 4 ])
end

function help_freshmanmatch3()
	Talk( 1, "", CP_HELP_FRESHMAN[ 5 ])
end
