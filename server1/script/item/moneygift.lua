function main(nItemIndex)
	Say("������֣������Դ���ȥ��Ʒ��������м���ٻ�ȡ������Ҫ��50�����ϣ�õ���˺�ֻ����3���˲μ�.", 2,
	"��������Ʒ./#del_moneygift("..nItemIndex..")",
	"����/OnCancel");
	return 1;
end;

function OnCancel()
end;

function del_moneygift(nItemIndex)
	RemoveItemByIndex(nItemIndex);
end;