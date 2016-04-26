if (not _H_DIALOG_FESTIVAL2006_H_) then
	_H_DIALOG_FESTIVAL2006_H_ = 1;
Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\springfestival\award.lua]]);
Include([[\script\missions\springfestival\signin.lua]]);

--	�Ի����������
function sf06_mainentrance()
	local tab_Content = {
	"��������!/signin_temp",
	"���Ѱѡ�30���ˡ�������!/sf07_getaward",
	"��ϵ�����ߡ�30���ˡ��/sf07_detail",
	"�����̫æ�ˣ������˰�!/no"
	}
	Describe("ֻҪ����<color=yellow>30����<color> �����Ⱥ�����Ϊ��������������������������������˸�λ������ʿ������������ <color=yellow>30����<color>, ����������һ��ƽ�������ꡣΪ�˱��������������е���Ϊ���ٸ�����������30���˵������� <color=yellow> <color>. �ڸ������У���ҽ�Ҫʹ�ý��ձ��ڵ���������30���ˡ�30�����Ҳ����ʹ�õ��߽�����ҡ���λ��ʿ���Ե����ﱨ��<color=yellow>�u����30����<color>.����μ���?", getn(tab_Content), tab_Content);
end;

function signin_temp()
	Say("�u����30���˾���������һ���߹����Ϊ�������˰�������ľ���.", 2, "����������ҵ���'30����'�ĵط�ȥ./signin", "��һ�£���Ҫ׼����/no");
end;

--	���ܺ���
function sf07_detail()
	Describe("ÿ�� '����30����'�����<color=yellow> 15�����ھ��� <color>, ���У���<color=yellow>5 ����<color> ��׼�����������㽫�ᱻ�͵�׼�����򣬵����ʼʱ���㽫�ᱻ���������<color=yellow>15��<color> ���ʼ���ڲμӵ��˵��У�����1��2���˻ữ��Ϊ' 30���� '. ��ұ��'30����' ��Ҫ��׽<color=yellow>Ұ��<color> �����������ڵġ�ʣ�����ҽ�Ҫ��<color=yellow>����<color> �� '����' 30����, �赲'30����' ��׽Ұ��. �������, <color=yellow> ���Ų���<color> ������ʹ��<color=yellow>����<color> ����������'30����'�콱��.", 1, "��֪����./sf06_mainentrance");
end;

--	���轱��������
function sf07_getaward()
	local nCount = GetTask(TK_CO_COUNT_ONETIME);
	local nRank = GetTask(TK_CO_RANK);
	
	if (nCount == 0 or nRank == 0) then
		Say("�����㻹δȥ'����30����'.���콱����ȥ������."..CO_ANIMALNAME.."��ȥ.", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 2) then
		Say("�����ط��ţ�������װ��.", 0);
		return
	end;
	SetTask(TK_CO_COUNT_ONETIME, 0);
	SetTask(TK_CO_RANK, 0);
	nRank1 = festival_award_rank(nRank);
    festival_expaward(nRank1);
	festival_goodsaward(nRank1);
	if (GetTask(TK_CO_GROUPID) > CO_SMALLMAPCOUNT) then
		Say("�������ܺá�! �ո����ҵ���<color=yellow>"..nCount.."��<color>"..CO_MOUSENAME..", ������ <color=yellow>"..nRank.."<color>,������Ľ�������ȥ��!", 0)
	else
		Say("���������ĺá�������ܹ�<color=yellow>"..nCount.." ��<color>"..CO_ANIMALNAME..", ������<color=yellow>"..nRank.."<color>,������Ľ�������ȥ��!", 0)
	end;
end;

end;	--	end of _H_DIALOG_FESTIVAL2006_H_