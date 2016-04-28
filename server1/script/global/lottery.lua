TASKTMPID_MEDAL_RANK = 153;			--ÁÙÊ±ÈÎÎñ±äÁ¿ID of µ±Ç°»á»°Ëù½øÐÐµ½µÄ½±ÅÆµÈ¼¶ £¨1£¬2£¬3£©
TASKTMPID_MEDAL_RANGE = 154;		--ÁÙÊ±ÈÎÎñ±äÁ¿ID of µ±Ç°»á»°Ëù½øÐÐµ½µÄ½±ÅÆÊý·¶Î§ £¨0£¬1£¬...£¬9£©
TASKTMPID_MEDAL_ANSWER = 155;		--ÁÙÊ±ÈÎÎñ±äÁ¿ID of µ±Ç°»á»°Íæ¼ÒËùÑ¡½±ÅÆÊýÄ¿½á¹û £¨DWORD£©
--TASKID_MEDAL_ANSWER = 2004;			--ÈÎÎñ±äÁ¿ID of ¡£¡£¡£ (test)
METALCHOOSE_ID = 1000;

aryszMedalRank = { " kim bµi ", "Ng©n bµi ", "§ång bµi " };

function onMedalmain()	
	SetTaskTemp( TASKTMPID_MEDAL_ANSWER, 0 );
	SetTaskTemp( TASKTMPID_MEDAL_RANK, 1 );
	showMedalRange();	
end

function showMedalRange()
	local aryszRange = {};
	local nRangeCount = 8;
	local szMedalRank = aryszMedalRank[ GetTaskTemp( TASKTMPID_MEDAL_RANK ) ];
		
	for i = 1, nRangeCount do
		aryszRange[ i ] = ( i - 1 ) * 10 .. "-".. ( i - 1 ) * 10 + 9 .. "mai/onRangeSelect";
	end
	aryszRange[ nRangeCount + 1 ] = "Hñy/onCancel";	
	
	Say( szMedalRank.."§Õn:", nRangeCount + 1, aryszRange );
end

function onRangeSelect( nSel )
	local aryszNumber = {};
	local nMedalRank = GetTaskTemp( TASKTMPID_MEDAL_RANK );
	
	for i = 1, 10 do
		aryszNumber[i] = ( nSel * 10 + i - 1 ).."mai/onNumberSelect";
	end
	aryszNumber[ 11 ] = " trë vÒ /showMedalRange";
	
	SetTaskTemp( TASKTMPID_MEDAL_RANGE, nSel );
	Say( aryszMedalRank[ nMedalRank ].." ®Õm :", 11, aryszNumber );
end

function onNumberSelect( nSel )
	local nMedalRank = GetTaskTemp( TASKTMPID_MEDAL_RANK );
	local nMedalRange = GetTaskTemp( TASKTMPID_MEDAL_RANGE );
	local nMedalAnswer = GetTaskTemp( TASKTMPID_MEDAL_ANSWER );	
	local nMedalNumber = nMedalRange * 10 + nSel;
	nMedalAnswer = SetByte( nMedalAnswer, nMedalRank, nMedalNumber );
	SetTaskTemp( TASKTMPID_MEDAL_ANSWER, nMedalAnswer );
	if( nMedalRank < getn( aryszMedalRank ) ) then
		SetTaskTemp( TASKTMPID_MEDAL_RANK, nMedalRank + 1 );
		showMedalRange();
	else
		confirm();
	end
end

function confirm()
	local nRankCount = getn( aryszMedalRank );
	local szConfirmInfo = " ng­¬i lùa chän ";
	local nMedalAnswer = GetTaskTemp( TASKTMPID_MEDAL_ANSWER );
	
	for i = 1, nRankCount do
		szConfirmInfo = szConfirmInfo..GetByte( nMedalAnswer, i ).." mai "..aryszMedalRank[i];
	end
	szConfirmInfo = szConfirmInfo..", mua vÐ sè ? ";
	
	Say( szConfirmInfo, 2, "X¸c ®Þnh /onSubmit", "Hñy bá /onCancel" );
end

function onSubmit()
	local nMedalAnswer = GetTaskTemp( TASKTMPID_MEDAL_ANSWER );	
	if (Pay(5000) > 0) then
		if (AddTicket(METALCHOOSE_ID , nMedalAnswer) == 1) then
			nItem = AddItem(6,1,75,1,0,0)
			SetSpecItemParam(nItem, 1, METALCHOOSE_ID )
			SetSpecItemParam(nItem, 2, nMedalAnswer);
			SetSpecItemParam(nItem, 3, GetByte(nMedalAnswer, 3))	
			SyncItem(nItem)
		else
			Earn(5000);
			Say("ThËt xin lçi , nªn lo¹i vÐ sè tr­íc m¾t ®· mÊt ph¸p n÷a mua . ", 0)
		end;
	else
		Say("ThËt xin lçi , ng­¬i nhÊt ®Þnh ph¶i tr¶ 5000 hai mua vÐ sè ", 0)
	end
end

function onCancel()
end
