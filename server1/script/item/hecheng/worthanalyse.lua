--========文件定义==================================--
--文件名：worthanalyse.lua
--作者：yfeng
--创建日期：2005-1-25
--最后修改日期：2005-1-25
--功能叙述：
--	节日活动的价值量分析相关内容。主要方法为：
--	我们为每个奖品标一个价值量Worth(i)，则令该价值量的
--倒数为其奖品出现的基本概率因子。Factor(i)，其中i表示
--第i个奖品,Factor(i)表示第i个奖品的概率因子。
--	若所有奖品的概率因子的总和为：
--	FactorCount = Factor(1)+Factor(2)+...+Factor(n)
--	那么，BaseP(i) = Factor(i)/FactorCount表示为第i个
--奖品出现的基本概率。
--	BasePCount = BaseP(1)+BaseP(2)+...+BaseP(n) = 1
--	现在玩家需要付出一定的价值量来谋求奖品，假设玩家所
--付出的价值量为：Worth，那么WP(Worth,i)表示为玩家用
--价值量Worth得到第i个奖品的概率。
--	我们让<=Worth的最接近价值量礼品集合中任选j的概率有
--所提升，其提升的幅度由原来的BaseP(j)变为WorthP(j)，
--则，WP(Worth,j) = WorthP(j)
--在此，我们必须保证WorthP(j) < 1
--为了保证概率守恒，则1-WorthP(j)的概率需要被其他奖
--品消耗掉。
--	所以，令除去与j奖品价值量相等的奖品集合之外的其他
--奖品的所有的概率之和为：
--	LeavePCount = 1 - BaseP(j)
--则有其他奖品有Worth产生的新概率为
--	WorthP(i) = (1-WorthP(j))*BaseP(i)/LeavePCount  
--我们假设WorthPjCount 总能超过x%的概率，那么，
--	提供算法模型：
--	当Min(Worth-Worth(j))>=0 存在，则
--	1:	WorthP(j) = BaseP(j)*(100-x)/100 + x/100
--	2:	WorthP(i) = (1-WorthP(j)*BaseP(i)/LeavePCount
--式1、2就是WP(Worth,n)的表现形式
--
--游戏脚本·剑侠情缘网络版
--金山软件股份有限公司，copyright 1992-2005
--==================================================--
--DEBUG = 1

if not WORTHANALYSE_HEAD then
WORTHANALYSE_HEAD =1

if not MEM_HEAD then
	Include ("\\script\\lib\\mem.lua")
end
if not LERROR_HEAD then
	Include ("\\script\\class\\lerror.lua")
end

--========类定义====================================--
--类名：WorthAnalyse
--作者：yfeng
--创建日期：2005-1-25
--最后修改日期：2005-1-25
--功能叙述：
--	该类用于处理按照价值量发奖的相关操作。
--成员变量：
--	__maxP：符合成功的概率，即x%
--	__worth：价值量列表
--	__factors：概率因子列表，其为一个数组，数组的索引
--对应相关价值量的物品索引，其值为概率因子。
--	__factorCount：概率因子总和
--	__baseP：物品根据概率因子的基本概率列表
--	__worthP：物品根据Worth变换后的概率列表
--	__concern：接近给出价值量Worth的项目
--	__leavePC：剩余物品的概率总和
--成员函数：
--	:addWorth(idx,worth)：加入第idx物品的价值量
--	:makeBaseP()：生成基本概率列表
--	:makeWorthP(worth)：根据worth生成新的概率列表
--	:getFromBase()：从基本概率表中选出一个物品
--	:getFromWorth()：从Worth表中选出一个物品
--用例：
--
--
--
--==================================================--
WorthAnalyse = inherit(LError,{
	__factorCount = 0,
	__maxP = 50,

--========函数定义==================================--
--函数原形：:__new(maxP)
--作者：yfeng
--创建日期：2005-2-1
--最后修改日期：2005-2-1
--功能叙述：
--	构造函数，并初始化maxP
--参数：
--	maxP：命中项目的价值量提升概率不小于此值，如果不写
--此值，则maxP = 50
--返回值：
--	无
--用例：
--	无
--==================================================--
	__new = function(self,arg)
		if(not arg) then return end
		if(not arg[1]) then return end
		if(arg[1]<=0) then return end
		if(arg[1]>100) then
			self.__maxP = 100
			return
		end
		self.__maxP = arg[1]
		return
	end,
	
--========函数定义==================================--
--函数原形：:addWorth
--作者：yfeng
--创建日期：2005-1-25
--最后修改日期：2005-1-25
--功能叙述：
--	给索引idx增加一个价值量，并计算其相应的概率因子，
--当连续使用该函数增加价值量的时候，索引号最好是从1开
--始的连续号，以保证效率和正确性，当价值量为nil或0时，
--其概率因子为0，概率因子为0的项目不会被getFromXXX函
--数获取到。
--参数：
--	idx：索引号，整数
--	worth：价值量大于0的整数，如果该参数为nil，则默认为0
--返回值：
--	出错为nil，否则为1
--用例：
--	local myworth = new(WorthAnalyse)
--	for i=1,100 do
--		wroth:addWorth(i,i)
--	end
--==================================================--
	addWorth = function(self,idx,worth,index)
		if(not worth) then worth = 0 end
		--此运算涉及取倒数，所以不能小数,0被特殊处理
		if(worth>0 and worth < 1) then
			self:__notify(1000,"价值量不能为小数。")
			return nil
		end
		if(not self.__worth) then
			self.__worth = {}
			self.__factors= {}
		end
		if(not self.__worth[idx]) then --此项尚无任何价值量
			self.__worth[idx] = {}
			self.__worth[idx][1] = worth
			self.__worth[idx][2] = index
			if(worth == 0) then
				self.__factors[idx] = 0
			else
				self.__factors[idx] = 1/worth --在此时计算概率因子
				self.__factorCount = self.__factorCount + 1/worth --在此时计算__factorCount
			end
		else --此项已有价值量，
			self.__factorCount = self.__factorCount - self.__factors[idx]
			self.__worth[idx][1] = worth
			if(worth == 0) then
				self.__factors[idx] = 0
			else
				self.__factors[idx] = 1/worth
				self.__factorCount = self.__factorCount + 1/worth
			end
		end
		self.__baseP = nil
		return 1
	end,
	
--========函数定义==================================--
--函数原形：:makeBaseP
--作者：yfeng
--创建日期：2005-1-25
--最后修改日期：2005-1-25
--功能叙述：
--	由概率因子计算取得基本概率，并保存到__baseP中。此
--操作一定要在所有:addFactor之后才能使用，以保证正确性，
--否则，getFromXXX系列函数将会不成功。
--参数：
--	无
--返回值：
--	失败为nil，成功为1
--用例：
--
--
--
--==================================================--
	makeBaseP = function(self)
		if(not self.__worth) then
			self:__notify(100,"no any worth.")
			return nil
		end
		if(not self.__baseP) then
			self.__baseP = {}
			for i = 1,getn(self.__factors) do
				if(self.__factors[i]) then
					self.__baseP[i] = self.__factors[i]/self.__factorCount
				else --nil
					self.__baseP[i] = 0
				end
			end
		end
		return 1
	end,

--========函数定义==================================--
--函数原形：:makeWorthP
--作者：yfeng
--创建日期：2005-1-25
--最后修改日期：2005-1-25
--功能叙述：
--	根据worth重新计算__baseP中的概率，并存放到__worthP
--中。经过整理后的__worthP会将与仅小于等于worth的项目
--概率调整超过50%。注意，执行此函数之前，一定要先执行
--:makeBaseP()，否则，执行该函数将会失败
--参数：
--	worth：价值量，此数不能为0或nil
--返回值：
--	失败为nil，成功为1
--用例：
--
--
--
--==================================================--
	makeWorthP = function(self,worth)
		if(not self.__baseP) then
			self:__notify(100,"no any baseP.")
			return nil
		end
		local concern = nil --初始值
		for i=1,getn(self.__worth) do
			if(worth >= self.__worth[i][1]) then --i可能是我们要找的最接近worth的项
				if(not concern) then --还没有最小项
					concern={i} --仅<=worth的集合中的最大项暂时是i
				else
					if(self.__worth[i][1] > self.__worth[concern[1]][1]) then  --该项更大，但<=worth
						concern = {i} --重置__concern
					elseif(self.__worth[i][1] == self.__worth[concern[1]][1]) then
						concern[getn(concern)+1] = i
					end
				end
			end
		end
		if(not concern) then --没有小于等于worth的项,__worthP = __baseP
			self.__worthP = self.__baseP
			return 1
		end
		self.__concern = concern[random(getn(concern))] --随机选取满足条件的任意项，提升其概率
		self.__leavePC = 1 - self.__baseP[self.__concern]
		--生成__worthP
		self.__worthP = {}
		--	1:	WorthP(j) = BaseP(j)*(100-x)/100 + x/100
		self.__worthP[self.__concern] = self.__maxP/100 + self.__baseP[self.__concern]*(100-self.__maxP)/100
		for i=1,getn(self.__baseP) do
			if(i~=self.__concern) then  --i是概率被提升项
				--	2:	WorthP(i) = (1-WorthP(j))*BaseP(i)/LeavePCount
				self.__worthP[i] =  (1-self.__worthP[self.__concern])*self.__baseP[i]/self.__leavePC
			end
		end --endfor i
		return 1
	end,

--========函数定义==================================--
--函数原形：:getFromBase
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	从基本概率表中随机抽取一个项目。
--参数：
--	无
--返回值：
--	如果成功，返回项目编号，否则返回nil
--用例：
--	无
--==================================================--
	getFromBase = function(self)
		if(not self.__baseP) then
			self:__notify(300,"基本概率表不存在。")
			return nil
		end
		local rnd = random()
		local p = 0
		for i=1,getn(self.__baseP) do
			p = p + self.__baseP[i]
			if(rnd <= p and self.__worth[i][1]~=0) then
				return i
			end
		end
		self:__notify(500,"无法选出合适项目。")
		return nil
	end,

--========函数定义==================================--
--函数原形：getFromWorth
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	从价值概率表中，随机选取一个项目，价值概率表是跟据
--给与的价值量worth算出来的，所以，执行此函数之前，至少
--需要执行一次:makeWorthP(worth)，则，在makeWorthP之后
--的getFromWorth都是从worth算出来的价值概率表中获取到的
--项目。
--参数：
--	worth：价值量，该参数将会把价值量表中小于等于且与他
--最接近的价值量的项目概率提升到50%以上
--返回值：
--	如果成功,则返回选择的项目编号,否则返回nil
--用例：
--	无
--==================================================--
	getFromWorth = function(self)
		if(not self.__worthP) then
			self:__notify(400,"have no baseP.")
			return nil
		end
		local rnd = random()
		local p = 0
		for i=1,getn(self.__baseP) do
			p = p + self.__worthP[i]
			if(rnd <= p and self.__worth[i][1]~=0) then
				return self.__worth[i][2]
			end
		end
		self:__notify(500,"无法选出合适项目。")
		return nil
	end,

})

--eg.
--Include("script/lib/string.lua")
--local myworth = new(WorthAnalyse)
--for i=1,200 do
--	myworth:addWorth(i,random(200000))
--end
--myworth:makeBaseP()
--h = openfile("settings/tmp.txt","w")
--for i=1,1000 do
--	local worth = random(200000)
--	myworth:makeWorthP(worth)
--	local idx = myworth:getFromWorth()
--	if(idx) then
--		local arr = {
--			worth,myworth.__worth[idx][1],myworth.__worthP[idx]
--		}
--		write(h,join(arr,"\t").."\n")
--		flush(h)
--	end
--end
--closefile(h)

end
