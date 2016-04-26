Include("\\script\\task\\partner\\train\\partner_addtrainnpc.lua")

function Goto_jindichangge()
	Describe(DescLink_ChangGeMen.."：在长歌门禁地中，玩家和同伴练级能够获得较多的经验，同时还会掉落同伴秘籍。每个小时整点，禁地的祭坛五行灵力会苏醒，带着同伴来祭拜，会有意想不到的事发生。你现在要前往吗？", 2,
	"恩，我要去/sure_gotojindi",
	"等会儿再说吧/OnCancel")
end

function OnCancel()
end

function sure_gotojindi()
	local filehigh = pt_GetTabFileHeight( jindienter_pos_file ) - 1
	local row = random(filehigh)
	local posx = pt_GetTabFileData(jindienter_pos_file, row + 1, 1)
	local posy = pt_GetTabFileData(jindienter_pos_file, row + 1, 2)
	
	if (posx > 0 and posy > 0) then
		NewWorld(539, posx, posy)
		SetFightState(1)
	else
		print("jindienter_pos_file error row = "..row)
	end
end