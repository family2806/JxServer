--种子、冰晶、圣诞树
--renbin



seed_name	={
		"幸运",
		"玫瑰",
		"水晶",
		"黄金"
		}

crystal_name	={
		"碎裂",
		"普通",
		"无暇",
		"完美"
		}

seed_sow	={0,0,0,0,0,0}



function main()

	Say("圣诞老人: 圣诞快乐！又来找我要礼物了吧？当然，我从来不会让你们失望的。不过，今年的礼物有点特别哦，只要你用心栽培，就有可能孕育出美丽的圣诞树，我的礼物就藏在这些树上。赶紧去收集<color=red>冰晶<color>和<color=red>圣诞种子<color>吧，行动要快哦！",4,"我要提炼冰晶/upg_crystal","我要浇灌圣诞种子/sow_seed","太好了，赶快告诉我怎么做呀/christ_help","呵呵，没事，我特意来问候您的/no")

end


function christ_help()

	Say("圣诞老人：你需要先到野外去收集一些<color=red>破碎冰晶<color>和<color=red>圣诞种子<color>。我可以帮你<color=red>提炼冰晶<color>和<color=red>浇灌种子<color>。",3,"关于冰晶的采集和提炼/bingjing","关于种子的采集和浇灌/zhongzi","我已经知道了，谢谢/no")

end

function bingjing()
	Say("圣诞老人：冰晶有<color=red>破碎冰晶<color>、<color=red>普通冰晶<color>、<color=red>无暇冰晶<color>和<color=red>完美冰晶<color>四种。你在野外只能采集到<color=red>破碎冰晶<color>，我能帮你提炼成其他三种。",2,"冰晶的采集/bjcj","冰晶的提炼/bjtl")

end


function bjcj()

	Talk(2,"","圣诞老人：<color=red>碎裂冰晶<color>采集地分别为：\n<color=red>红<color>－凤翔城外、永乐镇外、雁荡山\n<color=red>黄<color>－成都城外、江津村外、白水洞\n<color=red>紫<color>－襄阳城外、巴陵县外、武陵山","<color=red>白<color>－扬州城外、稻香村外、罗宵山\n<color=red>绿<color>－卞京城外、朱仙镇外、剑阁西南\n<color=red>蓝<color>－大理城外、石鼓镇外、伏流洞。")
	
end

function bjtl()

	Talk(3,"","圣诞老人：冰晶的提炼顺序为：<color=red>破碎冰晶<color>-><color=red>普通冰晶<color>-><color=red>无暇冰晶<color>-><color=red>完美冰晶<color>。","你需要准备<color=red>一套同等级的6色冰晶(红、黄、蓝、紫、绿、白)<color>，我就有可能帮你提炼出一颗更高等级的冰晶。","冰晶等级越高，浇灌出来的种子就更具有魔力，培育出来的圣诞树就拥有更丰厚的礼物。")
	
end

function zhongzi()

	Say("圣诞老人：种子有<color=red>圣诞种子<color>、<color=red>圣诞幸运种子<color>、<color=red>圣诞玫瑰种子<color>、<color=red>圣诞水晶种子<color>和<color=red>圣诞黄金种子<color>五种。你在野外只能采集到<color=red>圣诞种子<color>，我能帮你浇灌成其他四种。",2,"种子的采集/zzcj","种子的浇灌/zzjg")

end

function zzjg()

	Talk(3,"","圣诞老人：四类<color=red>冰晶<color>浇灌<color=red>圣诞种子<color>，就能得到可以培育成圣诞树的四类种子。","种子的浇灌方式为：\n\n<color=red>任意6个碎裂冰晶<color>＋<color=red>圣诞种子<color>＝<color=red>圣诞幸运种子<color>\n<color=red>任意6个普通冰晶<color>＋<color=red>圣诞种子<color>＝<color=red>圣诞玫瑰种子<color>","\n\n<color=red>任意6个无暇冰晶<color>＋<color=red>圣诞种子<color>＝<color=red>圣诞水晶种子<color>\n<color=red>任意6个完美冰晶<color>＋<color=red>圣诞种子<color>＝<color=red>圣诞黄金种子<color>。")

end

function zzcj()

	Talk(1,"","圣诞老人：<color=red>圣诞种子<color>的采集地方有：临安城外、南岳镇外、龙泉村外、十大门派附近、华山、桃花源。")
	
end


-----------------------提炼冰晶-----------------------

function upg_crystal()

	Say("圣诞老人：想提炼什么冰晶呢？不过，请注意，不是每次都会成功的哦，如果提炼失败的话，我只能还给你<color=red>一个原材料<color>。",2,"提炼普通冰晶(2000两)/crystal_medi","我再想想/no")

end

function crystal_medi()

	local on_pay = 2000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,468,1,1)>=1) and CalcEquiproomItemCount(4,469,1,1)>=1 and CalcEquiproomItemCount(4,470,1,1)>=1 and CalcEquiproomItemCount(4,471,1,1)>=1 and CalcEquiproomItemCount(4,472,1,1)>=1 and CalcEquiproomItemCount(4,473,1,1)>=1) then
			ConsumeEquiproomItem(1,4,468,1,1)
			ConsumeEquiproomItem(1,4,469,1,1)
			ConsumeEquiproomItem(1,4,470,1,1)
			ConsumeEquiproomItem(1,4,471,1,1)
			ConsumeEquiproomItem(1,4,472,1,1)
			ConsumeEquiproomItem(1,4,473,1,1)
			i_medi = random(1,12000)
			if ( i_medi < 1000 ) then
				AddEventItem(474)
				Msg2Player("你得到了一个红色普通冰晶")
				Pay(on_pay)
			elseif ( i_medi < 2000 ) then
				AddEventItem(475)
				Msg2Player("你得到了一个黄色普通冰晶")
				Pay(on_pay)
			elseif ( i_medi < 3000 ) then
				AddEventItem(476)
				Msg2Player("你得到了一个蓝色普通冰晶")
				Pay(on_pay)
			elseif ( i_medi < 4000 ) then
				AddEventItem(477)
				Msg2Player("你得到了一个紫色普通冰晶")
				Pay(on_pay)
			elseif ( i_medi < 5000 ) then
				AddEventItem(478)
				Msg2Player("你得到了一个绿色普通冰晶")
				Pay(on_pay)
			elseif ( i_medi < 6000 ) then
				AddEventItem(479)
				Msg2Player("你得到了一个白色普通冰晶")
				Pay(on_pay)
			else
				Msg2Player("对不起，提炼失败了，希望下次能成功。千万不要放弃哦！")
				Pay ( on_pay )
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(468)
				elseif (i_back < 3000) then
					AddEventItem(469)
				elseif (i_back < 4000) then
					AddEventItem(470)
				elseif (i_back < 5000) then
					AddEventItem(471)
				elseif (i_back < 6000) then
					AddEventItem(472)
				else
					AddEventItem(473)
				end
			end
			check_again(468)	--Is there enough crystals
		
		else
			Talk(1,"","对不起，再仔细检查看看，需要一套6种颜色的碎裂冰晶哦。")
		end
	else
		Talk(1,"","对不起，银两不够了呀，快回去取吧。")
	end

end


function crystal_high()

	local on_pay = 10000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,474,1,1)>=1) and CalcEquiproomItemCount(4,475,1,1)>=1 and CalcEquiproomItemCount(4,476,1,1)>=1 and CalcEquiproomItemCount(4,477,1,1)>=1 and CalcEquiproomItemCount(4,478,1,1)>=1 and CalcEquiproomItemCount(4,479,1,1)>=1) then
			ConsumeEquiproomItem(1,4,474,1,1)
			ConsumeEquiproomItem(1,4,475,1,1)
			ConsumeEquiproomItem(1,4,476,1,1)
			ConsumeEquiproomItem(1,4,477,1,1)
			ConsumeEquiproomItem(1,4,478,1,1)
			ConsumeEquiproomItem(1,4,479,1,1)
			i_high = random(1,18000)
			if ( i_high < 1000 ) then
				AddEventItem(480)
				Msg2Player("你得到了一个红色无暇冰晶")
				Pay(on_pay)
			elseif ( i_high < 2000 ) then
				AddEventItem(481)
				Msg2Player("你得到了一个黄色无暇冰晶")
				Pay(on_pay)
			elseif ( i_high < 3000 ) then
				AddEventItem(482)
				Msg2Player("你得到了一个蓝色无暇冰晶")
				Pay(on_pay)
			elseif ( i_high < 4000 ) then
				AddEventItem(483)
				Msg2Player("你得到了一个紫色无暇冰晶")
				Pay(on_pay)
			elseif ( i_high < 5000 ) then
				AddEventItem(484)
				Msg2Player("你得到了一个绿色无暇冰晶")
				Pay(on_pay)
			elseif ( i_high < 6000 ) then
				AddEventItem(485)
				Msg2Player("你得到了一个白色无暇冰晶")
				Pay(on_pay)
			else
				Msg2Player("对不起，提炼失败了，希望下次能成功。千万不要放弃哦！")
				Pay ( on_pay )
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(474)
				elseif (i_back < 3000) then
					AddEventItem(475)
				elseif (i_back < 4000) then
					AddEventItem(476)
				elseif (i_back < 5000) then
					AddEventItem(477)
				elseif (i_back < 6000) then
					AddEventItem(478)
				else
					AddEventItem(479)
				end
			end
			check_again(474)	--Is there enough crystals
		
		else
			Talk(1,"","对不起，再仔细检查看看，需要一套6种颜色的普通冰晶哦。")
		end
	else
		Talk(1,"","对不起，银两不够了呀，快回去取吧。")
	end

end
	


function crystal_perfect()

	local on_pay = 100000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,480,1,1)>=1) and CalcEquiproomItemCount(4,481,1,1)>=1 and CalcEquiproomItemCount(4,482,1,1)>=1 and CalcEquiproomItemCount(4,483,1,1)>=1 and CalcEquiproomItemCount(4,484,1,1)>=1 and CalcEquiproomItemCount(4,485,1,1)>=1) then
			Pay ( on_pay )
			ConsumeEquiproomItem(1,4,480,1,1)
			ConsumeEquiproomItem(1,4,481,1,1)
			ConsumeEquiproomItem(1,4,482,1,1)
			ConsumeEquiproomItem(1,4,483,1,1)
			ConsumeEquiproomItem(1,4,484,1,1)
			ConsumeEquiproomItem(1,4,485,1,1)
			i_perfect = random(1,30000)
			if ( i_perfect < 6000 ) then
				AddEventItem(486)
				WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName().."，得到一个完美冰晶。")
				Msg2Player("恭喜你得到了一个完美冰晶，赶快把它浇灌成黄金种子吧！")
			else
				Msg2Player("对不起，提炼失败，希望下次能成功。千万不要放弃哦！")
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(480)
				elseif (i_back < 3000) then
					AddEventItem(481)
				elseif (i_back < 4000) then
					AddEventItem(482)
				elseif (i_back < 5000) then
					AddEventItem(483)
				elseif (i_back < 6000) then
					AddEventItem(484)
				else
					AddEventItem(485)
				end
			end
			check_again(480)	--Is there enough crystals
			
		else
			Talk(1,"","对不起，再仔细检查看看，需要一套6种颜色的无暇冰晶哦！")
		end
	else
		Talk(1,"","对不起，银两不够了呀，快回去取吧。")
	end

end

function check_again(i_item)

	local on_pay = 2000
	if ( i_item == 474 )	then
		on_pay = 10000
	elseif ( i_item == 480 )	then
		on_pay = 100000
	end
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,i_item,1,1)>=1) and CalcEquiproomItemCount(4,i_item + 1,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 2,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 3,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 4,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 5,1,1)>=1)	then
			if ( i_item == 468 )	then
				Say("圣诞老人：你还想继续提炼普通冰晶吗？",2,"好的/crystal_medi","等会再说吧/no")
			elseif ( i_item == 474 )	then
				Say("圣诞老人：你还想继续提炼无暇冰晶吗？",2,"好的/crystal_high","等会再说吧/no")
			else
				Say("圣诞老人：你还想继续提炼完美冰晶吗？",2,"好的/crystal_perfect","等会再说吧/no")
			end
		end
	end
end




-----------------------提炼冰晶结束-----------------------


------------------------浇灌种子-------------------------

function sow_seed()

	Say("你要浇灌哪种种子?只要你带够了足够的原材料和费用，就一定能浇灌成功。",3,"浇灌圣诞幸运种子(3000两)/do_sow_seed","浇灌圣诞玫瑰种子(1万两)/do_sow_seed","我考虑考虑吧/no")

end

function do_sow_gold()

	local on_pay = 1000000
	if ( GetCash() >= on_pay ) then
		if ( CalcEquiproomItemCount(4,486,1,1)>=6 and CalcEquiproomItemCount(4,487,1,1)>=1 ) then
			ConsumeEquiproomItem(6,4,486,1,1)
			ConsumeEquiproomItem(1,4,487,1,1)
			Pay( on_pay )
			i_goldseed = random(1,18000)
			if ( i_goldseed < 20000 ) then		--100%rate
				AddItem(6,1,145,1,0,0,0)
				Talk(1,"","恭喜你! 提炼成功! 快去和朋友一起培育这个珍奇的种子吧！培养成功了就能收到我送的礼物啦！！")
				Msg2Player("你得到了一个"..seed_name[4].."种子")
				WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName().."，得到一个圣诞黄金种子")
				AddGlobalNews(GetName().."从圣诞老人处获得了*黄金种子*，我们预祝他早日培育出黄金圣诞树，得到黄金装备。")
			else
				Talk(1,""," 哦，提炼失败，继续努力啊!")
			end
		else
			Talk(1,"","对不起，再仔细检查看看，需要6颗完美冰晶和一个圣诞种子才能浇灌。")
		end
	else
		Talk(1,"","对不起，银两没有带够呀，快回去取吧。")
	end
			

end


function do_sow_seed(nsel)

	nsel1 = nsel
	nsel = nsel * 6
	local on_pay = 2000
	if ( nsel1 == 0 ) then
		on_pay = 3000
	elseif ( nsel1 == 1 ) then
		on_pay = 10000
	else
		on_pay = 100000
	end
	seed_sow[1] = CalcEquiproomItemCount(4,nsel + 468,1,1)
	seed_sow[2] = CalcEquiproomItemCount(4,nsel + 469,1,1)
	seed_sow[3] = CalcEquiproomItemCount(4,nsel + 470,1,1)
	seed_sow[4] = CalcEquiproomItemCount(4,nsel + 471,1,1)
	seed_sow[5] = CalcEquiproomItemCount(4,nsel + 472,1,1)
	seed_sow[6] = CalcEquiproomItemCount(4,nsel + 473,1,1)
	nTotal = seed_sow[1] + seed_sow[2] + seed_sow[3] + seed_sow[4] + seed_sow[5] + seed_sow[6]
	if ( GetCash() >= on_pay ) then
		if ( nTotal >= 6 and CalcEquiproomItemCount(4,487,1,1)>=1 ) then
			Pay ( on_pay )
			nTimes = 6
			for s = 1, 6 do
				if ( seed_sow[s] >= nTimes ) then
						ConsumeEquiproomItem(nTimes,4,nsel + 467 + s,1,1)
					break
				else
					nTimes = nTimes - seed_sow[s]
						ConsumeEquiproomItem(seed_sow[s],4,nsel + 467 + s,1,1)
				end
			end
			ConsumeEquiproomItem(1,4,487,1,1)
			AddItem(6,1,nsel1 + 142,1,0,0,0)
			Talk(1,"","恭喜你! 浇灌成功! 快去和朋友一起培育这个珍奇的种子吧！培养成功了就能收到我送的礼物啦!!")
			Msg2Player("你得到了一个"..seed_name[nsel1 + 1].."种子")
		else
			Talk(1,"","对不起，再仔细检查看看，需要6个"..crystal_name[nsel1 + 1].."冰晶和一个圣诞种子才能浇灌。")
		end
	else
		Talk(1,"","对不起，银两不够呀，快回去取吧。")
	end

end





------------------------浇灌种子结束-------------------------


function no()

	Talk(1,"","谢谢你还记得我，祝你节日快乐！")

end