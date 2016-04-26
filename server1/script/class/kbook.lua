--Creator:yfeng
--Date:2004-08-31
--Comm:书籍的类模板,用inherit(KBook,VarName="...",Page={})来引用

KBook = {	--VarName 为变量名，Page为书的内容，是一个table
	TurnTo = function (self,pageno)
		local pageCount = getn(self.Page)
		if(pageCount < 1) then --没有有效页
			return nil
		end
		if(pageno > pageCount) then --当前页无效
			return nil
		end
		local str_NEXT = "下一页/#%s:TurnTo(%s)"
		local str_PREVIOUS = "上一页/#%s:TurnTo(%s)"
		local str_CLOSE = "关闭/#%s:Close()"
		
		if(pageCount == 1 ) then  --只有一页
			if(pageno == 1) then
				Say(self.Page[1],1,format(str_CLOSE,self.VarName))
				return 1
			end
			return nil
		end
		--pageCount > 1
		if(pageno == 1) then --第一页
			Say(self.Page[1],2,format(str_NEXT,self.VarName,pageno+1),
								format(str_CLOSE,self.VarName))
			return 1
		end
		if(pageno == pageCount) then
			Say(self.Page[pageCount],2,format(str_PREVIOUS,self.VarName,pageno-1),
										format(str_CLOSE,self.VarName))
			return 1
		end
		Say(self.Page[pageno],3,format(str_NEXT,self.VarName,pageno+1),
								format(str_PREVIOUS,self.VarName,pageno-1),
								format(str_CLOSE,self.VarName))
		return 1
	end,
	Close = function(self)
		return 1
	end,
}
