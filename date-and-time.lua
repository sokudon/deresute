--orig https://obsproject.com/forum/resources/date-and-time.644/
-- 令和テキトー表示とUTCグローバル時間を出せるよう改造

obs           = obslua
source_name   = ""

last_text     = ""
format_string = ""
activated     = false
utc           = 0
ima           = 0
debugtxt1	  = ""
debugtxt2	  = ""
debugtxt3	  = ""

--あいますようそがないので無理やり追加（）
--https://script.googleusercontent.com/macros/echo?user_content_key=ETKjv48buN5rK2r4wpjCSZET2OQiIV-y3T_Yo1sO9RWDb2j2bNXU4Zw-vXPSLkT2PAEmtVq1qbpiIQBE2mWH2GtjwIj1WZRCm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnImdhCglA_bw00zKJV-3uMxFhM94xSIKcykYkHTwB1nSW4GadiCkn1G8mzDTCqnGIg&lib=Mp89x2A3ZSHn80Z0KafsZgXndBJ9ix56c
imashead ={"ゲーム名","稼働","機種","終わり"}
imas ={{"THE IDOLM@STER","2005-07-25T15:00:00.000Z","アーケード",""},{"THE IDOLM@STER","2007-01-24T15:00:00.000Z","Xbox 360",""},{"THE IDOLM@STER LIVE FOR YOU!","2008-02-27T15:00:00.000Z","Xbox 360",""},{"THE IDOLM@STER SP","2009-02-18T15:00:00.000Z","PSP",""},{"THE IDOLM@STER Dearly Stars","2009-09-16T15:00:00.000Z","DS",""},{"アイドルマスター モバイル","2010-12-20T15:00:00.000Z","フィーチャー・フォン","2016-03-30T15:00:00.000Z"},{"THE IDOLM@STER 2","2011-02-23T15:00:00.000Z","Xbox 360",""},{"THE IDOLM@STER 2","2011-10-26T15:00:00.000Z","PS3",""},{"アイドルマスター シンデレラガールズ","2011-11-27T15:00:00.000Z","Mobage",""},{"アイドルマスター モバイルi","2012-03-29T15:00:00.000Z","iOS","2016-01-17T15:00:00.000Z"},{"THE IDOLM@STER SHINY FESTA","2012-10-24T15:00:00.000Z","PSP",""},{"アイドルマスター ミリオンライブ!","2013-02-26T15:00:00.000Z","GREE","2018-03-19T03:00:00.000Z"},{"THE IDOLM@STER SHINY FESTA","2013-04-21T15:00:00.000Z","iOS",""},{"アイマスチャンネル","2013-10-01T15:00:00.000Z","PS3",""},{"アイドルマスター ワンフォーオール","2014-05-14T15:00:00.000Z","PS3",""},{"アイドルマスター SideM","2014-07-16T15:00:00.000Z","Mobage",""},{"韓国版アイドルマスターシンデレラガールズ","2014-12-01T15:00:00.000Z","Mobage","2016-03-14T06:00:00.000Z"},{"アイドルマスター シンデレラガールズ スターライトステージ","2015-09-02T15:00:00.000Z","iOS、Android",""},{"アイドルマスター マストソングス 赤盤/青盤","2015-12-09T15:00:00.000Z","PS Vita",""},{"アイドルマスター プラチナスターズ","2016-07-27T15:00:00.000Z","PS4",""},{"アイドルマスター シンデレラガールズ ビューイングレボリューション","2016-10-12T15:00:00.000Z","PS VR",""},{"アイドルマスター ミリオンライブ! シアターデイズ","2017-06-28T15:00:00.000Z","iOS、Android",""},{"アイドルマスター SideM LIVE ON ST@GE!","2017-08-29T15:00:00.000Z","iOS、Android",""},{"アイドルマスター ステラステージ","2017-12-20T15:00:00.000Z","PS4",""},{"アイドルマスター シャイニーカラーズ","2018-04-23T15:00:00.000Z","enza",""},{"ミリシタ海外版","2019-08-29T15:00:00.000Z","iOS、Android",""}}


-- Function to set the time text

--http://lua-users.org/wiki/TimeZone
function get_timezone()
  local now = os.time()
  return os.difftime(now, os.time(os.date("!*t", now))) --サマーなしタイムゾーン時差情報 現在時間
end

function get_tzoffset(timezone)
  local h, m = math.modf(timezone / 3600)
  return string.format("%+.4d", 100 * h + 60 * m)
end

function get_tzoffset_sepa(timezone)
  local h, m = math.modf(timezone / 3600)
  return string.format("%+03d:%02d",  h ,math.abs(60 * m))
end

function get_timezone_offset(ts)  --サマー有りタイムゾーン時差情報 当時の時間
	local utcdate   = os.date("!*t", ts)
	local localdate = os.date("*t", ts)
	localdate.isdst = false -- this is the trick
	return os.difftime(os.time(localdate), os.time(utcdate))
end

function get_timezone_the_day()
  local hh = tonumber(string.format("%d",(tonumber(os.date("%z"))/100)))
  local mm= ((tonumber(os.date("%z"))-100*hh)/60)*3600
  local hhmm = hh*3600 +mm
  return hhmm  --サマー有りタイムゾーン時差情報 現在時間
end

function lefttime(dt) 
	local t=parse_json_date_utc(dt) -os.time() 
	return  t
end

function elaspted(dt) 
	return  -(lefttime(dt))
end

function DateUTC(y,M,D,h,m,s,ms)  --DATEUTCもどきMM月だけjsとおなじ-1月なので（）
local dt = string.format("%04d",tonumber(y)).."-".. string.format("%02d",tonumber(M)+1).."-".. string.format("%02d",tonumber(D))
	  dt = dt.."T".. string.format("%02d",tonumber(h))..":".. string.format("%02d",tonumber(m))
	  dt=  dt..":".. string.format("%02d",tonumber(s))..".".. string.format("%03d",tonumber(ms)).."Z"
	  
	  --debugtxt1 =dt
	  --debugtxt2 =parse_json_date_utc(dt)
	  --debugtxt3 =os.date("!%x %X %a ",parse_json_date_utc(dt))
	  
	return parse_json_date_utc(dt)
end

function JST(dt)
return os.date('!%Y/%m/%dT%X(JST)%a',parse_json_date_utc(dt)+3600*9)
end

function parse_json_date_utc(json_date) --ISO8601datetimeparse パーサー完成版？
    local pattern = "(%d+)%-(%d+)%-(%d+)%a(%d+)%:(%d+)%:([%d%.]+)([Z%+%-])(%d?%d?)%:?(%d?%d?)"
    local year, month, day, hour, minute, 
        seconds, offsetsign, offsethour, offsetmin = json_date:match(pattern)
    local timestamp = os.time{year = year, month = month, 
        day = day, hour = 4, min = minute, sec = seconds}
    local offset = 0
    if offsetsign ~= 'Z' then
      offset = tonumber(offsethour) * 3600 + tonumber(offsetmin)*60
      if offsetsign == "-" then offset = offset * -1 end
    end
    
    
    --local temp = os.date("*t",timestamp)
    --if(temp.isdst) then  --パースした時刻がサマーがしらべる
    --offset = offset -3600  --0.5サマータイムもあるので（）、オーストラリアだと使えないかも
    --end
    --return timestamp + get_timezone() -offset
    
    --return timestamp + get_timezone_the_day() -offset
    
    return timestamp + get_timezone_offset(timestamp) -offset  + (hour-4)*3600
    --hourは越境時タイムマシンが発生するので最後に足す、幻の2時(2020-03-08T02:00:00) -05:00
    --https://ja.wikipedia.org/wiki/%E5%A4%8F%E6%99%82%E9%96%93　ブラジルが0時豪州3時なので4時までずらす
end


function isDST(J)
	local localdate = os.date("*t")
	local st=""
	if(localdate.isdst) then
		st="DST"
		if(J=="J")then
		st="夏時間"
		end
	end
	return st
end

function isempty(s)
  return s == nil or s == ''
end

function JPday(date,t)
  
  local dt = os.date("*t",t)
  if (get_timezone_the_day() == 9*3600) then --動作は日本時間のときだけ
  	date= string.gsub(date, "%%VR","令和"..(dt.year-2018).."年")
  	date= string.gsub(date, "%%Vr","R"..(dt.year-2018))  --%Vr/%Y/%m/%d(%Vw)%X
  	date= string.gsub(date, "%%VH","平成"..(dt.year-1988).."年")
  	date= string.gsub(date, "%%Vh","H"..(dt.year-1988))
  	date= string.gsub(date, "%%VS","昭和"..(dt.year-1925).."年")
  	date= string.gsub(date, "%%Vs","S"..(dt.year-1925))
  	date= string.gsub(date, "%%VT","大正"..(dt.year-1911).."年")
  	date= string.gsub(date, "%%Vt","T"..(dt.year-1911))
  end
  
  local jp_day={"日","月","火","水","木","金","土","日"} --%w用
  date= string.gsub(date, "%%E",debugtxt1)  ----フリーズ文字代替
  date= string.gsub(date, "%%J",debugtxt2)  ----フリーズ文字代替
  date= string.gsub(date, "%%K",debugtxt3)  ----フリーズ文字代替
  date= string.gsub(date, "%%s",os.time())  ----フリーズ文字代替
  date= string.gsub(date, "%%DST",isDST("J"))
  date= string.gsub(date, "%%Vw",jp_day[tonumber(os.date("%w",t))+1])
  date= string.gsub(date, "%%VW",jp_day[tonumber(os.date("%w",t))+1].."曜日") 
  date= string.gsub(date, "%%ZZ", get_tzoffset_sepa(get_timezone())) --timezone タイムゾーン時差情報標準時、サマータイムなし 
  date= string.gsub(date, "%%Z",  get_tzoffset(get_timezone())) --timezone タイムゾーン時差情報標準時、サマータイムなし 
  date= string.gsub(date, "%%zz", get_tzoffset_sepa(get_timezone_the_day())) --timezone タイムゾーン時差情報夏時間こみ

  date= string.gsub(date, "%%V%w","和暦はJST限")  ----令和しょりなし
  
 return date
end

function get_ep(tu)

   local total = tu*10

	--local tenths   = math.floor(total % 10)
	local seconds  = math.floor((total / 10) % 60)
	local minutes  = math.floor((total / 600) % 60)
	local hours    = math.floor((total / 36000) % 24)
	local idays     = math.floor(total / 864000)
	local days     = math.floor(idays%365)
	local years    = math.floor(total/(864000*365))

	--local hours_infinite  = math.floor(total / 36000)
	--local seconds_infinite  = math.floor(total / 10)
	--local minutes_infinite  = math.floor(total / 600)
   local ep = years.."年"..days.."日".. hours.."時".. minutes.."分"..seconds .."秒"
   
   return ep
end

function parse_jp_era(date)
  local datestring=""
  
  date= string.gsub(date, "%%[LNOPQfkloqv]","")	--フリーズ文字 %%[EJKLNOPQfikloqsv]
  
  local t = os.time()
  
  if (string.find(date,"%%i")) then
  
   local inum = (ima)%27    --imas[1] AC,dre 18 ,miri 22
   if(inum==0)then
   inum =1
   end
   local tu = elaspted(imas[inum][2])
   local imasname =imas[inum][1] .."("..imas[inum][3]..")"
   local gm = "開始から" 
  
   
   --inum の番号
--1={{"THE IDOLM@STER","2005-07-25T15:00:00.000Z","アーケード",""
--,{"THE IDOLM@STER","2007-01-24T15:00:00.000Z","Xbox 360",""
--,{"THE IDOLM@STER LIVE FOR YOU!","2008-02-27T15:00:00.000Z","Xbox 360",""
--,{"THE IDOLM@STER SP","2009-02-18T15:00:00.000Z","PSP",""
--5,{"THE IDOLM@STER Dearly Stars","2009-09-16T15:00:00.000Z","DS",""
--,{"アイドルマスター モバイル","2010-12-20T15:00:00.000Z","フィーチャー・フォン","2016-03-30T15:00:00.000Z"
--,{"THE IDOLM@STER 2","2011-02-23T15:00:00.000Z","Xbox 360",""
--,{"THE IDOLM@STER 2","2011-10-26T15:00:00.000Z","PS3",""
--,{"アイドルマスター シンデレラガールズ","2011-11-27T15:00:00.000Z","Mobage",""
--10,{"アイドルマスター モバイルi","2012-03-29T15:00:00.000Z","iOS","2016-01-17T15:00:00.000Z"
--,{"THE IDOLM@STER SHINY FESTA","2012-10-24T15:00:00.000Z","PSP",""
--,{"アイドルマスター ミリオンライブ!","2013-02-26T15:00:00.000Z","GREE","2018-03-19T03:00:00.000Z"
--,{"THE IDOLM@STER SHINY FESTA","2013-04-21T15:00:00.000Z","iOS",""
--,{"アイマスチャンネル","2013-10-01T15:00:00.000Z","PS3",""
--15,{"アイドルマスター ワンフォーオール","2014-05-14T15:00:00.000Z","PS3",""
--,{"アイドルマスター SideM","2014-07-16T15:00:00.000Z","Mobage",""
--,{"韓国版アイドルマスターシンデレラガールズ","2014-12-01T15:00:00.000Z","Mobage","2016-03-14T06:00:00.000Z"
--,{"アイドルマスター シンデレラガールズ スターライトステージ","2015-09-02T15:00:00.000Z","iOS、Android",""
--,{"アイドルマスター マストソングス 赤盤/青盤","2015-12-09T15:00:00.000Z","PS Vita",""
--20,{"アイドルマスター プラチナスターズ","2016-07-27T15:00:00.000Z","PS4",""
--,{"アイドルマスター シンデレラガールズ ビューイングレボリューション","2016-10-12T15:00:00.000Z","PS VR",""
--,{"アイドルマスター ミリオンライブ! シアターデイズ","2017-06-28T15:00:00.000Z","iOS、Android",""
--,{"アイドルマスター SideM LIVE ON ST@GE!","2017-08-29T15:00:00.000Z","iOS、Android",""
--,{"アイドルマスター ステラステージ","2017-12-20T15:00:00.000Z","PS4",""
--25,{"アイドルマスター シャイニーカラーズ","2018-04-23T15:00:00.000Z","enza",""
--,{"ミリシタ海外版","2019-08-29T15:00:00.000Z","iOS、Android",""
   
	local dateu='!%m%d'       --(%a)%X(UTC+09:00)'
	local nst =os.date(dateu,os.time()+9*3600)
	local tt = parse_json_date_utc(imas[inum][2])+9*3600
	local ist =os.date(dateu,tt)
	local nenme =""
	if(nst==ist)then
	nenme = ","..years.."周年"
	end
   local ep=get_ep(tu)
  	date =string.gsub(date, "%%is",gm..ep ..nenme)
  
  local dt = string.format("%04d",tonumber(os.date("!%Y",os.time()+9*3600))) .. "-".. string.format("%02d",tonumber(os.date('!%m',tt))).."-".. string.format("%02d",tonumber(os.date('!%d',tt))).."T00:00:00+09:00"
  
  
  local gm = "周年" 
  local aniv=lefttime(dt)
  if(aniv<0) then
  aniv =-aniv
  gm = gm.."から"
  else
  gm = gm.."まで"
  end
  local ep= string.gsub(get_ep(aniv),"0年","")
  	date =string.gsub(date, "%%it",gm..ep)
  	
  	local imm=imas[inum][4]
    debugtxt3=dt
  	debugtxt2=JST(imas[inum][2])  --開始日
  	debugtxt1=""
  	
  	if(isempty(imm)==false) then
  	debugtxt1= JST(imm) --差終わり日
    tu= elaspted(imas[inum][4])
  	
   local ep=get_ep(tu)
  	date =string.gsub(date, "%%ie","サ終から"..ep )
  	end
  	
  	date =string.gsub(date, "%%ie","")
  	date =string.gsub(date, "%%i",imasname)
  end
  
  
  if (string.find(date,"%%UTC")) then
  local tu = os.time()  + (tonumber(utc)*3600)
  
  local u= get_tzoffset_sepa(utc*3600)
    local dateu='!%Y/%m/%d(%a)%X(UTC'..u..')' --%z系はOS依存のため使用不可
   
   
    --local jp_day={"日","月","火","水","木","金","土",} --dt.wday用
    --local dt = os.date("!*t",tu) --%Vwを使いたいとき utcの時間で曜日を取得する必要がある
	--dateu= string.gsub(dateu, "%%Vw",jp_day[dt.wday])
	
	--%w用
    --local getd = os.date("!%w",tu) --%Vwを使いたいとき utcの時間で曜日を取得する必要がある
	--dateu= string.gsub(dateu, "%%Vw",jp_day[tonumber(getd)+1])
	
  	dateu=JPday(dateu,tu)
  	datestring = os.date(dateu,tu)
  	date =string.gsub(date, "%%UTC",datestring)
  end
  if (string.find(date,"%%ISOZ")) then
  local dateu='!%Y/%m/%dT%XZ %a'    --%z系はOS依存のため使用不可

  	datestring = os.date(dateu, t)
  	date =string.gsub(date, "%%ISO%w",datestring)
  end
  if (string.find(date,"%%ISO")) then
    local dateu='%Y/%m/%dT%X%zz %a' 
    
  	--dateu=JPday(dateu,t)
  	
  	datestring = os.date(dateu, t)
  	date =string.gsub(date, "%%ISO",datestring)
  end
  
  date=JPday(date,t)

  return os.date(date)
end
--出力例
--サマータイム有り＋時差情報 先頭に!をつけるとUTC時間になる
--%Y/%m/%d(%Vw)%X(UTC%z%DST)

--和暦表示　令和から
-- %VR%m月%d日(%Vw)%H時%M分%S秒

--全部出し
--%UTC%n%c%DST%n%x%X%z%n%s%n%ISO%n%ISOZ%n%VR%m月%d日(%Vw)%H時%M分%S秒

--あいますの情報を出す
--日本時間%UTC%nUTC協定時間%ISOZ%n8601 %ISO%n%i%n%J%is%n%K%it%n%E%ie%n

--独自拡張2020/04/09現在 
--%E	デバッグ文字1 サービス終了日
--%J	デバッグ文字2 サービス開始日
--%K	デバッグ文字3 今年の周年日
--$i	あいますゲームの名前,フリーズ防止
--%is	あいますの記念日の時間からの経過時間
--%it	あいますの記念日までの時間
--%ie	あいますのサービス終了した時間からの経過時間(データがないものは表示なし)
--%UTC  worldtime set UTCsetting,	UTC標準時からUI設定の時間を表示,サマータイムは非対応
--%ISO  ISO8601表示ローカル時間
--%ISOZ ISO8601表示UTC時間
--%Z	サマーなしタイムゾーン時差情報,元はタイムゾーンストリングだが文字化けで使えないので（）
--%ZZ   timezone,HH:mm  timezoneサマーなしタイムゾーン時差情報  
--%zz   サマータイム有り＋時差情報 HH:mm
--%DST  夏時間かどうか出力する 引数"J"で夏時間
--%s    unixtime,フリーズ防止
--%VR--%Vr--%VH--%Vh--%VS--%Vs--%VT--%Vt 日本の和暦、開始年しかちぇくしてないのでてきとー


--OBSlua標準出力
--画像でまとめてみた　https://imgur.com/a/MYtwxg1

--http://noriko3.blog42.fc2.com/blog-entry-128.html?sp
--%% the character `%´ %の文字だけをだしたいとき 
--%a ロケールの省略形の曜日名 (Sun..Sat) 
--%A ロケールの完全表記の曜日名、可変長 (Sunday..Saturday) 
--%b ロケールの省略形の月名 (Jan..Dec) 
--%B ロケールの完全表記の月名、可変長 (January..December) 
--%c ロケールの日付と時刻 (Sat Nov 4 12:02:33 EST
--%d 月内通算日数 (01..31) 
--%D 日付 (mm/dd/yy) 
--%H hour, using a 24-hour clock (23) [00-23] 時間 
--%h %b と同じ 
--%I hour, using a 12-hour clock (11) [01-12] 時間ampm %pとセット 
--%j 年内通算日数 (001..366) 
--%k 時 (0..23) 
--%l 時 (1..12) 
--%M minute (48) [00-59] 分 
--%m month (09) [01-12] 月 
--%n 改行 
--%p AM あるいは PM のロケール 
--%r 時刻、12 時間 (hh:mm:ss [AP]M) 
--%S second (10) [00-61] 秒 
--%s 1970-01-01 0:00:00 UTC からの秒数 (標準外の拡張) 
--%T 時刻、24 時間 (hh:mm:ss) 
--%t 水平タブ 
--%U 日曜日を週の最初の日とした年内通算週 (00..53) 
--%V 週番号 
--%w weekday (3) [0-6 = Sunday-Saturday] 曜日の番号 
--%w 週のうちの曜日 (0..6) (0 が日曜日) 
--%W 月曜日を週の最初の日とした年内通算週 (00..53) 
--%x date (e.g., 09/16/98) 年月日 
--%X time (e.g., 23:48:10) 時分秒 
--%X ロケールによる時刻の表現 (%H:%M:%S) 
--%x ロケールの日付表現 (mm/dd/yy) 
--%Y full year (1998) 年 
--%y two-digit year (98) [00-99] ２桁の年 
--%y 年の最後の 2 つの数字 (00..99) 
--%Y 年 (1970...) 
--%Z タイムゾーン (例 EDT)、あるいはタイムゾーンが決定できないならば無し 
--%z timezone,osdateのサマータイム有り 

--クラッシュ使用不可か別の文字処理に使う
--%E　デバッグ文字1
--%J　デバッグ文字2
--%K　デバッグ文字3
--%L
--%N
--%O
--%P
--%Q
--%f
--%i あいますの時間
--%k 
--%l
--%o
--%q
--%s　　unixtimeに使用
--%v

--%%A:%A%n%%B:%B%n%%C:%C%n%%D:%D%n%%E:%E%n%%F:%F%n%%G:%G%n
--%%H:%H%n%%I:%I%n%%J:%J%n%%K:%K%n%%L:%L%n%%M:%M%n%%N:%N%n
--%%O:%O%n%%P:%P%n%%Q:%Q%n%%R:%R%n%%S:%S%n%%T:%T%n%%U:%U%n
--%%V:%V%n%%W:%W%n%%X:%X%n%%Y:%Y%n%%Z:%Z%n%%n:%n
--
--%%a:%a%n%%b:%b%n%%c:%c%n%%d:%d%n%%e:%e%n%%f:%f%n%%g:%g%n
--%%h:%h%n%%i:%i%n%%j:%j%n%%k:%k%n%%l:%l%n%%m:%m 
--%%o:%o%n%%p:%p%n%%q:%q%n%%r:%r%n%%s:%s%n%%t:%t%n%%u:%u
--%%v:%v%n%%w:%w%n%%x:%x%n%%y:%y%n%%z:%z

--hour	15 os.date("*t").hash　os.dateがもつ構造体
--min	21 
--wday	1
--day	28
--month	6
--year	2009
--sec	48
--yday	179

function set_time_text()
	local text = parse_jp_era(format_string)  --os.date(format_string)
		  --text = tostring(get_timezone()/3600) 
		  --text = tostring(get_timezone()%60)
		  --text = os.time()  					--2020-02-18 21:27:05 utc0  ostime+13,off+9でJST
		  --text = os.time()+ get_timezone()  	--2020-02-19 10:48:47 utc0
		  --text = os.time(os.date("!*t", now)) --2020-02-18 08:27:59 utc0 
		  --text = os.time{year = 2020, month = 2, day = 25, hour = 21}        --2020-02-25 08:00:00 utc0
		  --text = os.time{year = 2020, month = 2, day = 25, hour = 21} -3600*9  --2020-02-24 22:00:00 utc0
		  --text = os.time{year = 2020, month = 2, day = 25, hour = 21}+ get_timezone() --2020-02-25 21:00:00 utc0
		  --text = os.time{year = 2020, month = 2, day = 25, hour = 21}+ get_timezone()-3600*9  --2020-02-25 12:00:00 utc0
		 
		
	if text ~= last_text then
		local source = obs.obs_get_source_by_name(source_name)
		if source ~= nil then
			local settings = obs.obs_data_create()
			obs.obs_data_set_string(settings, "text", text)
			obs.obs_source_update(source, settings)
			obs.obs_data_release(settings)
			obs.obs_source_release(source)
		end
	end
	
	last_text = text
end

function timer_callback()
	set_time_text()
end

function activate(activating)
	if activated == activating then
		return
	end

	activated = activating

	if activating then
		set_time_text()
		obs.timer_add(timer_callback, 1000)
	else
		obs.timer_remove(timer_callback)
	end
end

-- Called when a source is activated/deactivated
function activate_signal(cd, activating)
	local source = obs.calldata_source(cd, "source")
	if source ~= nil then
		local name = obs.obs_source_get_name(source)
		if (name == source_name) then
			activate(activating)
		end
	end
end

function source_activated(cd)
	activate_signal(cd, true)
end

function source_deactivated(cd)
	activate_signal(cd, false)
end

function reset(pressed)
	if not pressed then
		return
	end

	activate(false)
	local source = obs.obs_get_source_by_name(source_name)
	if source ~= nil then
		local active = obs.obs_source_active(source)
		obs.obs_source_release(source)
		activate(active)
	end
end

----------------------------------------------------------

-- A function named script_properties defines the properties that the user
-- can change for the entire script module itself
function script_properties()
	local props = obs.obs_properties_create()

	local p = obs.obs_properties_add_list(props, "source", "Text Source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	local sources = obs.obs_enum_sources()
	if sources ~= nil then
		for _, source in ipairs(sources) do
			source_id = obs.obs_source_get_id(source)
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name(source)
				obs.obs_property_list_add_string(p, name, name)
			end
		end
	end
	obs.source_list_release(sources)

	obs.obs_properties_add_text(props, "format_string", "Format String", obs.OBS_TEXT_DEFAULT)
	--obs.obs_properties_add_text(props, "UTC", "UTC", obs.OBS_TEXT_DEFAULT)
	obs.obs_properties_add_float(props, "UTC", "WorldTime UTC-14～+14(%UTC)", -14, 14, 1)
	obs.obs_properties_add_int(props, "IMAS", "IMAS", 1, 27, 1)
	obs.obs_properties_add_text(props, "im", "IM@S開始日", obs.OBS_TEXT_DEFAULT)

	return props
end

-- A function named script_description returns the description shown to
-- the user
function script_description()
	return "Sets a text source to act as a date/time text when the source is active.\n\nMade by Ragowit"
end

-- A function named script_update will be called when settings are changed
function script_update(settings)
	activate(false)

	source_name = obs.obs_data_get_string(settings, "source")
	format_string = obs.obs_data_get_string(settings, "format_string")
	utc           = obs.obs_data_get_double(settings, "UTC")
	ima           = obs.obs_data_get_int(settings, "IMAS")
	obs.obs_data_set_string(settings, "im",imas[ima][1]..imas[ima][3])
	
	reset(true)
end

-- A function named script_defaults will be called to set the default settings
function script_defaults(settings)
	obs.obs_data_set_default_string(settings, "format_string", "%Y/%m/%d(%Jw)%X(UTC%z)") --"%Y-%m-%d %X")
	obs.obs_data_set_default_double(settings, "UTC", 9)
	obs.obs_data_set_default_int(settings, "IMAS", 18)
	obs.obs_data_set_default_string(settings, "im",imas[1][1]..imas[1][3])
end

-- a function named script_load will be called on startup
function script_load(settings)
	-- Connect activation/deactivation signal callbacks
	--
	-- NOTE: These particular script callbacks do not necessarily have to
	-- be disconnected, as callbacks will automatically destroy themselves
	-- if the script is unloaded.  So there's no real need to manually
	-- disconnect callbacks that are intended to last until the script is
	-- unloaded.
	local sh = obs.obs_get_signal_handler()
	obs.signal_handler_connect(sh, "source_activate", source_activated)
	obs.signal_handler_connect(sh, "source_deactivate", source_deactivated)
end
