--�ν��ʴ� ��ż����һ���޴���д��������
--by xiaoyang
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")

function branch_songjinproblem()

	Describe("�����㽫���뵽�����ν�ս�����ʴ��м�����������׼�����������һ���Ƚϼ��ѵĹؿ�����ô�������Ƿ�ʼ��<enter>",2,"��ʼ��/branch_problemstart","��������/no")
end

function branch_problemstart()
	Describe(DescLink_SongJinProblem.."1���õ�˧���Ϊ����ʿ��������֪��Ŀ�ĵ����겢�ɹ����˧�죿<enter>"
	.."A:�ᵽ˧��󣬹������л�������Ŀ�����꣬������ʱʹ������֪Ŀ�ĵ����꣬��겻�����ģ�����Ŀ�ĵغ��ٴ�ʹ������ɹ���ɶ��죬�������ĵ���ꡣ<enter>" --y
	.."B:�ᵽ˧��󣬹������л�������Ŀ�����꣬������ʱʹ������֪Ŀ�ĵ����꣬���������ģ�����Ŀ�ĵغ��ٴ�ʹ������ɹ���ɶ��죬ͬ�������ĵ���ꡣ<enter>"
	.."C:�ᵽ˧��󣬹������л�������Ŀ�����꣬������ʱʹ������֪Ŀ�ĵ����꣬����Ŀ�ĵغ��ٴ�ʹ������ɹ���ɶ��죬�����������ʹ�ö��������ġ�<enter>"
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem1a","B/branch_problem1b","C/branch_problem1c")
end

function branch_problem1a()
		Describe(DescLink_SongJinProblem.."2���°��ν��ս�Ŀ���ʱ���Ǽ�ʱ��<enter>"
	.."A:ÿ���12��00��24:00���ű���������ʱ��Ϊ30���ӡ�������������ʽ��ս��ս��ʱ��Ϊ60���ӡ�<enter>"
	.."B:û�й̶�ʱ�䣬��ϵͳ�㲥����֪ͨ��<enter>"
	.."C:ÿ���13��30��19��30��21��30���ű���������ʱ��Ϊ30���ӡ�������������ʽ��ս��ս��ʱ��Ϊ60���ӡ�<enter>" --y
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem2a","B/branch_problem2b","C/branch_problem2c")
	
end

function branch_problem1b()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem1c()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem2a()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem2b()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem2c()
		Describe(DescLink_SongJinProblem.."3������ս�ۺ������֪����ǰ��ս����<enter>"
	.."A:��ҿ�����ʱʹ�á�����tab���Ϸ��İ������򿪺͹رռ�ʱս�����棬�˽⵱ǰս����<enter>"--y
	.."B:���ֻ��ͨ�����·��Ĺ����е�֪��ǰ��ս����<enter>"
	.."C:��ҿ����ں�Ӫ�ľ���ٴ���ѯ�ʵ���ǰ��ս����<enter>" 
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem3a","B/branch_problem3b","C/branch_problem3c")
end

function branch_problem3a()
	Describe(DescLink_SongJinProblem.."4�������°��ν��ս��Ҫʲô������<enter>"
	.."A:û�еȼ�Ҫ��ֻҪ���ɱ�����3000�������ң��Ϳɲμӡ����ǣ�����������Ͳ��ܱ������롣<enter>"
	.."B:�����Ҫ�ﵽ�򳬹�40���������ɱ�����3000�������ң��Ϳɲμӡ�����ʱ������󣬵���������δ������400�ˣ��Կɱ������롣<enter>"--y
	.."C:�����Ҫ�ﵽ�򳬹�40���������ɱ�����3000�������ң��Ϳɲμӡ����ǣ�����������Ͳ��ܱ������롣<enter>" 
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem4a","B/branch_problem4b","C/branch_problem4c")
end

function branch_problem3b()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem3c()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem4a()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem4b()
	Describe(DescLink_SongJinProblem.."5����Ҷ��˧�죬��Ϊ����ʿ�����������ֵ��û�иı䣿<enter>"
	.."A:�С���ҵĸ����Կ��Ժ͹��������������ӡ�<enter>"
	.."B:û��ʲô�仯��<enter>"
	.."C:�С���ҵ����ٻ�����Ӧ�½������������ޱ仯��<enter>" --y
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem5a","B/branch_problem5b","C/branch_problem5c")
end

function branch_problem4c()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem5a()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem5b()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem5c()
	Describe(DescLink_SongJinProblem.."6���ҽ����ν��ս���������ô�죿<enter>"
	.."A:����֮����;���߻�ս��������֮�������߿�ֱ��ȥ������ͨ���Ի����룬�����ٴν��ɱ����ѡ�<enter>"--y
	.."B:����֮����;���߻�ս��������֮�������߿�ֱ��ȥ������ͨ���Ի����룬����Ҫ�ٴν��ɱ����ѡ�<enter>"
	.."C:����֮����;���߻�ս��������֮�������߶������ٴν��룬ֻ�ܵ���һ�ο���ʱ�䱨�����롣<enter>" 
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem6a","B/branch_problem6b","C/branch_problem6c")
end

function branch_problem6a()
	Describe(DescLink_SongJinProblem.."7���°��ν��ս��û�������ͷ���<enter>"
	.."A:��һ�������ͷ�������ʧһ���ľ���ֵ�������󱻴��͵�ս����Ӫ�����Լ�������ս����<enter>"
	.."B:û���κγͷ�������֮��ᱻ���͵�ս����Ӫ����ҿ��Լ�������ǰ����<enter>"--y
	.."C:�������ͷ������������ٽ���ս������������ʧ����ֵ�ͽ�Ǯ��<enter>" 
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem7a","B/branch_problem7b","C/branch_problem7c")
end

function branch_problem6b()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem6c()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem7a()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem7b()
	Describe(DescLink_SongJinProblem.."8���ν�սר�õ����ܲ��ܹ���<enter>"
	.."A:���ԡ����ֻ�����ν�սδ��սǰ�����°��ν��ս������ľ���ٴ�ʹ�û�õ��ν���ֹ���ר�õ��ߡ�<enter>"--y
	.."B:���ԡ���ҿ�����ʱ���°��ν��ս������ľ���ٴ������ν�ר�õ��ߣ���Ҫ����һ���Ľ����ҡ�<enter>"
	.."C:�����ԡ����ֻ�����°��ν�ս����ɱNPC�õ���<enter>" 
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem8a","B/branch_problem8b","C/branch_problem8c")
end

function branch_problem7c()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem8a()
	Describe(DescLink_SongJinProblem.."9������ս�����ܲ��ܰ�̯������Ʒ��<enter>"
	.."A:���ֻ�����°��ν��ս�ı����㴦��̯��<enter>"
	.."B:������°��ν��ս�ı������ս���ж����ܰ�̯��<enter>"
	.."C:������°��ν��ս�ı������ս����Ӫ�ж����԰�̯��<enter>" --y
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem9a","B/branch_problem9b","C/branch_problem9c")	
end

function branch_problem8b()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem8c()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem9a()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem9b()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem9c()
	Describe(DescLink_SongJinProblem.."10�����ν��ս�У��ܲ�������ѡ����Ӫ��<enter>"
	.."A:���С�һ�����һ�������μ�һ�����Ժ����е�ս�۶�����μ���һ������Ӫ��<enter>"
	.."B:���ԡ���ҿ�������һ���μ�һ���������ŵ���һ���Ͳμӵз���Ӫ��<enter>"
	.."C:���С�һ�������һ��ս��������ֻ��ѡ������ν�����һ�������ܸ�����Ӫ��<enter>" --y
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem10a","B/branch_problem10b","C/branch_problem10c")	
end

function branch_problem10a()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem10b()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem10c()
	Describe(DescLink_SongJinProblem.."11����α����ν�ս����<enter>"
	.."A:�������ǿ��Ե��η������㣬����������Ե��𷽱����㡣���⣬ʹ���ν�սگ�����ֱ�Ӵ��͵��ν����㡣<enter>"--y
	.."B:���ߴ���еĳ��򴦣�����һ���ķ��þͿ������������ͽ������㡣<enter>"
	.."C:��������еĳ������س�ʿ����������ǧԲ�Ϳ�ֱ�Ӵ��͵��ν�ս����<enter>" 
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem11a","B/branch_problem11b","C/branch_problem11c")	
end

function branch_problem11a()
	Describe(DescLink_SongJinProblem.."12����εõ��ν�սگ�飿<enter>"
	.."A:���Դ�ֵõ���<enter>"
	.."B:������7����е��ӻ����򵽣�ÿ��5000�������ҡ�<enter>"--y
	.."C:��Ҫ��������Ʒ��ȡ��<enter>" 
	.."��������������𰸣��ĸ�����ȷ���أ�<enter>",
	3,"A/branch_problem12a","B/branch_problem12b","C/branch_problem12c")	
end

function branch_problem11b()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem11c()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem12a()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problem12b()
	Describe("��ϲ����ȫ���ش���ȷ����������",1,"�����Ի�/branch_problemend")
end

function branch_problem12c()
	Talk(1,"","�Բ������ش���ˣ����벻Ҫ����������Ŭ���ɡ�")
	return
end

function branch_problemend()
	Uworld1053 = nt_getTask(1053)
	Uworld1057 = nt_getTask(1057)
	Uworld1061 = nt_getTask(1061)
	AddOwnExp(200000)
	if ( Uworld1053 == 30 ) then
		nt_setTask(1053,40)
	elseif ( Uworld1057 == 50 ) then
		nt_setTask(1057,60)
	elseif ( Uworld1061 == 50 ) then
		nt_setTask(1061,60)
	end
	Msg2Player("����˳�����أ����Խ�������������ˡ�")
end