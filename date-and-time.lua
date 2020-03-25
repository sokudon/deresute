--orig https://obsproject.com/forum/resources/date-and-time.644/
-- 令和テキトー表示とUTCグローバル時間を出せるよう改造

obs           = obslua
source_name   = ""

last_text     = ""
format_string = ""
activated     = false
utc           = 0

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
  return hhmm  --サマー有りタイムゾーン時差情報
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

function JPday(date)
  local jp_day={"日","月","火","水","木","金","土"} --2020/03/21から％Jがクラッシュなので％V
  local dt = os.date("*t")
  
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
  
  date= string.gsub(date, "%%s",os.time())  ----フリーズ文字代替
  date= string.gsub(date, "%%DST",isDST("J"))
  date= string.gsub(date, "%%Vw",jp_day[dt.wday])
  date= string.gsub(date, "%%VW",jp_day[dt.wday].."曜日") 
  date= string.gsub(date, "%%ZZ", get_tzoffset_sepa(get_timezone())) --timezone タイムゾーン時差情報標準時、サマータイムなし 
  date= string.gsub(date, "%%Z",  get_tzoffset(get_timezone())) --timezone タイムゾーン時差情報標準時、サマータイムなし 
  date= string.gsub(date, "%%zz", get_tzoffset_sepa(get_timezone_the_day())) --timezone タイムゾーン時差情報標準時、サマータイムなし %Y/%m/%d(%Jw)%X(UTC%z)

  date= string.gsub(date, "%%V%w","和暦はJST限")  ----令和しょりなし
  
 return date
end

function parse_jp_era(date)
  local datestring=""
  
  date= string.gsub(date, "%%[EJKLNOPQfikloqv]","")	--フリーズ文字 %%[EJKLNOPQfikloqsv]
  
  if (string.find(date,"%%UTC")) then
  local t = os.time()  - get_timezone_the_day() + (tonumber(utc)*3600)
  local u =string.format("%+02d",tonumber(utc))
    local dateu='20%x(%Vw)%X(UTC'..u..':00)'
  	dateu=JPday(dateu)
  	datestring = os.date(dateu, t)
  	date =string.gsub(date, "%%UTC",datestring)
  end
  if (string.find(date,"%%ISOZ")) then
  local t = os.time()
  local dateu='!%Y/%m/%dT%XZ'
  	dateu=JPday(dateu)
  	datestring = os.date(dateu, t)
  	date =string.gsub(date, "%%ISO%w",datestring)
  end
  if (string.find(date,"%%ISO")) then
  local t = os.time()
    local dateu='%Y/%m/%dT%X%zz'
  	dateu=JPday(dateu)
  	datestring = os.date(dateu, t)
  	date =string.gsub(date, "%%ISO",datestring)
  end
  
  date=JPday(date)

  return os.date(date)
end
--出力例
--サマータイム有り＋時差情報 先頭に!をつけるとUTC時間になる
--%Y/%m/%d(%Vw)%X(UTC%z%DST)

--和暦表示　令和から
-- %VR%m月%d日(%Vw)%H時%M分%S秒

--全部出し
--%UTC%n%c%DST%n%x%X%z%n%s%n%ISO%n%ISOZ%n%VR%m月%d日(%Vw)%H時%M分%S秒

--独自拡張
--%UTC    worldtime set UTCsetting,	UTC標準時からUI設定の時間を表示,サマータイムは非対応
--%ISO    ISO8601表示ローカル時間
--%ISOZ   ISO8601表示UTC時間
--%Z	サマーなしタイムゾーン時差情報,元はタイムゾーンストリングだが文字化けで使えないので（）
--%ZZ    timezone,HH:mm  timezoneサマーなしタイムゾーン時差情報  
--%zz    サマータイム有り＋時差情報 HH:mm
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
--%E
--%J
--%K
--%L
--%N
--%O
--%P
--%Q
--%f
--%i
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

	
	obs.obs_properties_add_int(props, "UTC", "WorldTime UTC-14～+14(use %U)", -14, 14, 1)

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
	utc           = obs.obs_data_get_int(settings, "UTC")
	
	reset(true)
end

-- A function named script_defaults will be called to set the default settings
function script_defaults(settings)
	obs.obs_data_set_default_string(settings, "format_string", "%Y/%m/%d(%Jw)%X(UTC%z)") --"%Y-%m-%d %X")
	obs.obs_data_set_default_int(settings, "UTC", 9)
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
