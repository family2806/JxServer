function main()
--增加一块碎石

AddEventItem(351);
Msg2Player("恭喜您！您得到了一块山河社稷图碎片！");
Name = GetName();
str = format("恭喜！%s 得到了一块山河社稷图碎片！", Name);
AddGlobalNews(str);
WriteLog(date("%m%d%H%M")..str);
DelObject();
end;