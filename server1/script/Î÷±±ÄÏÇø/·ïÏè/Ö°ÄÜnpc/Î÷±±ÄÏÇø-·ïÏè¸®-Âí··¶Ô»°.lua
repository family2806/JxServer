--西北南区 凤翔府 马贩对话

function main(sel)

Say("马贩：（哼着小曲）马里头挑马不一般高，人里头挑人就数哥哥你好……俺这儿的马都是大宛名驹，短途冲刺是极快的，甚么马也比不上。", 2, "交易/yes", "不交易/no");

end;


function yes()
Sale(49);  			--弹出交易框
end;


function no()
end;