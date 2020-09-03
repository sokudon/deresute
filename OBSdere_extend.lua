-- parse json https://gist.github.com/zwh8800/9b0442efadc97408ffff248bc8573064
--original timer https://obsproject.com/forum/resources/advanced-timer.637/
--タイトル%T%n経過時間%K%n残り時間%L%nイベント時間%I%n
--現地時間%N%n日本時間%JST%n達成率%P%nS %S%nE %E%nSJ %SJ%nEJ %EJ"
--拡張前　旧版残り時間だけのやつ　https://raw.githubusercontent.com/sokudon/deresute/2c8516d114a6500b0ad4e91d31a776f5b5d48891/OBSdere.lua

--みりした、でれすてのイベント時間　現行イベントのみ(event duration) ISO8601 recommanded☆ >>> unix >> localtime(OS)
--http://sokudon.s17.xrea.com/sekai.html
--http://sokudon.s17.xrea.com/sekai-dere.html


--UI ENGLISH MODE view textline, 670
--parameter https://github.com/sokudon/deresute/wiki/OBS-EVENT-DURATION-TIMER(luascript)

--[[
//全部出しさんぷる
OS時間:%N%n経過時間%K           %t日本時間:%JST  %n残り時間:%L          %t%t開始時間:%SJ%nイベント時間:%I     %t%t終了時間%EJ       %T%P％%n%Q

%T	イベント名・タイトル
%N	現在の時間OS依存、時刻書式可能
%UTC	現在の時間UTC設定、時刻書式可能
%JST	日本時間、時刻書式可能
%I	イベント期間、経過残書式対応
%T	タイトル名
%K	経過時間、経過残書式対応
%L	残り時間、経過残書式対応
%P	進捗%
%Q	進捗バー
%SJ	イベント開始日本時間
%SU	イベント開始utcsetteing
%S	　イベント開始時間
%EJ	　イベント終了日本時間
%SU	イベント開始utcsetteing
%E	　イベント終了時間

//時刻書式一覧
%Y-%m-%dT%H:%M:%S%z (%a)　＝＞2020-06-02T01:52:00+0900 (Tue曜日)
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

//経過残書式一覧
%d %hh:%mm:%ss(%hs時,%ds日)＝＞日 時:分:秒(時シリアル,日シリある)

%HH	無限時間、少数切り捨て
%MM	無限分、少数切り捨て
%SS	無限秒、少数切り捨て
%hh	24時間以内の時間、少数切り捨て
%mm	60分以内の分、少数切り捨て
%ss	60秒以内の秒、少数切り捨て
%ds	無限時間、少数3桁
%hs	無限分、少数3桁
%ms	無限秒、少数3桁
%H	tostring(hours_infinite))　無限1桁版
%M	 tostring(minutes_infinite))
%S	 tostring(seconds_infinite))
%d	 tostring(days))　日数、少数切り捨て1桁版
%h	 tostring(hours))　24時間～あとは1桁版
%m	 tostring(minutes))
%s	 tostring(seconds))
%t	 tostring(tenths))　miri秒
]]



obs           = obslua
source_name   = ""
finaltime =""
starttime =""
title =""
para_text=""
time_text=""
end_text     = ""

total_seconds = 0
total         = 0
stop_text     = ""
mode          = ""
a_mode        = ""
format        = ""
activated     = false
global        = false
timer_active  = false
minute        = 0
hour          = 0
utc			  = 0
debugtxt      =""

hotkey_id_reset     = obs.OBS_INVALID_HOTKEY_ID
hotkey_id_pause     = obs.OBS_INVALID_HOTKEY_ID

function delta_time()
	local now = os.time()
	local year = os.date("%Y", now)
	local month = os.date("%m", now)
	local day = os.date("%d", now)
	local future = os.time{year=year, month=month, day=day, hour=hour, min=minute}
	local seconds = os.difftime(future, now)

	if (seconds < 0) then
		seconds = seconds + 84600
	end

	local total_time = seconds * 10

	return total_time
end

function get_timestring(t,text)
	if(t=="Invalid date")then
	return "Invalid date"
	end

	total = t*10
	if(total<0)then
	total=-total
	
	if(end_text~="") then
		return end_text
	end
	end

	local tenths   = math.floor(total % 10)
	local seconds  = math.floor((total / 10) % 60)
	local minutes  = math.floor((total / 600) % 60)
	local hours    = math.floor((total / 36000) % 24)
	local days     = math.floor(total / 864000)

	local hours_infinite  = math.floor(total / 36000)
	local seconds_infinite  = math.floor(total / 10)
	local minutes_infinite  = math.floor(total / 600)
	
	
	local days_sn     = string.format("%03.3f",(total / 864000))
	local hours_sn  =  string.format("%03.3f", (total / 36000))
	local minutes_sn  = string.format("%03.3f", (total / 600))
	--local seconds_sn  = string.format("%03.2f", (total / 10))

	if string.match(text, "%%HH") then
		text = string.gsub(text, "%%HH", "%%H")
		minutes_infinite = string.format("%02d", hours_infinite)
	end

	if string.match(text, "%%MM") then
		text = string.gsub(text, "%%MM", "%%M")
		minutes_infinite = string.format("%02d", minutes_infinite)
	end

	if string.match(text, "%%SS") then
		text = string.gsub(text, "%%SS", "%%S")
		seconds_infinite = string.format("%02d", seconds_infinite)
	end

	if string.match(text, "%%hh") then
		text = string.gsub(text, "%%hh", "%%h")
		hours = string.format("%02d", hours)
	end

	if string.match(text, "%%mm") then
		text = string.gsub(text, "%%mm", "%%m")
		minutes = string.format("%02d", minutes)
	end

	if string.match(text, "%%ss") then
		text = string.gsub(text, "%%ss", "%%s")
		seconds = string.format("%02d", seconds)
	end

	text = string.gsub(text, "%%ds", tostring(days_sn))
	text = string.gsub(text, "%%hs", tostring(hours_sn))
	text = string.gsub(text, "%%ms", tostring(minutes_sn))
	
	text = string.gsub(text, "%%d", tostring(days))
	text = string.gsub(text, "%%H", tostring(hours_infinite))
	text = string.gsub(text, "%%h", tostring(hours))
	text = string.gsub(text, "%%M", tostring(minutes_infinite))
	text = string.gsub(text, "%%m", tostring(minutes))
	text = string.gsub(text, "%%S", tostring(seconds_infinite))
	text = string.gsub(text, "%%s", tostring(seconds))
	text = string.gsub(text, "%%t", tostring(tenths))

	return text
end

function checkdate(a,b)
if(a=="Invalid date" or b=="Invalid date")then
return "Either date is Invalid date"
end
return true
end

function makebar(p)
local base ="="
p=math.floor(p)
local s=""
for i=0,p-1 do
s= s .. base
end
s=s..">"
for i=p+1,100 do
s= s .."_"
end
local bar = "["..s.."]"
return bar
end



function get_tzoffset(timezone)
  local h, m = math.modf(timezone/3600)
  return string.format("%+.4d", 100 * h + 60 * m)
end

function set_time_text()
	local text = para_text	
	local elaspted=get_timestring(lefttime(starttime)*-1,format)
	local left=get_timestring(lefttime(finaltime),format)
	local ibetime=checkdate(lefttime(starttime),lefttime(finaltime))
	local prog=""
	local bar=""
	if(ibetime==true)then
	ibetime=get_timestring(parse_json_date_utc(finaltime)-parse_json_date_utc(starttime),format)
	prog=string.format("%2.2f",math.abs(lefttime(starttime)/(parse_json_date_utc(finaltime)-parse_json_date_utc(starttime))*100))
	
	--現在＜ibe開始時間
	if(parse_json_date_utc(starttime)>=os.time())then
	prog=0
	--残りイベント時間　経過0時間にする
	elaspted=get_timestring(0,format)
	left=get_timestring(parse_json_date_utc(finaltime)-parse_json_date_utc(starttime),format)
	
	--または残り開始までの時間にする
	--left=get_timestring(math.abs(lefttime(starttime)),format)
	end
	if(tonumber(prog)>100)then
	prog=100
	elaspted=get_timestring(parse_json_date_utc(finaltime)-parse_json_date_utc(starttime),format) 
	left=get_timestring(0,format)
	end
	bar=makebar(prog)
	end
	
	local time_textq=string.gsub(time_text, "%%[EJKLNOPQfikloqsv]","")	 --フリーズ文字 %%[EJKLNOPQfikloqsv]
	text = string.gsub(text, "%%N", os.date(time_textq,os.time() ))
	local time_textj="!".. string.gsub(time_textq, "%%z", "+0900")
	local time_textu="!".. string.gsub(time_textq, "%%z", get_tzoffset(utc*3600))
	text = string.gsub(text, "%%JST",os.date(time_textj,os.time()+9*3600 ))
	text = string.gsub(text, "%%UTC",os.date(time_textu,os.time()+utc*3600 ))
	text = string.gsub(text, "%%I", ibetime)
	text = string.gsub(text, "%%T", title)
	text = string.gsub(text, "%%K", elaspted)
	text = string.gsub(text, "%%L", left)
	text = string.gsub(text, "%%P", prog)
	text = string.gsub(text, "%%Q", bar)
	if(parse_json_date_utc(starttime)=="Invalid date")then
	text=  string.gsub(text, "%%SJ?","Invalid date")
	else
	text = string.gsub(text, "%%SU",os.date(time_textu,parse_json_date_utc(starttime)+utc*3600 ))
	text = string.gsub(text, "%%SJ",os.date(time_textj,parse_json_date_utc(starttime)+9*3600 ))
	text = string.gsub(text, "%%S",os.date(time_textq,parse_json_date_utc(starttime)))
	end
	if(parse_json_date_utc(finaltime)=="Invalid date")then
	text=  string.gsub(text, "%%EJ?","Invalid date")
	else
	text = string.gsub(text, "%%EU",os.date(time_textu,parse_json_date_utc(finaltime)+utc*3600 ))
	text = string.gsub(text, "%%EJ",os.date(time_textj,parse_json_date_utc(finaltime)+9*3600 ))
	text = string.gsub(text, "%%E",os.date(time_textq,parse_json_date_utc(finaltime)))
	end
	text=  string.gsub(text, "%%[EJKLNOPQfikloqsv]","")	 --フリーズ文字 %%[EJKLNOPQfikloqsv]
	
	text =os.date(text)
	
	local source = obs.obs_get_source_by_name(source_name)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function timer_callback()
	if mode == "Countup" or mode == "Streaming timer" or mode == "Recording timer" then
		total = total + 1
	else
		total = total - 1
	end

	if total < 1 then
		stop_timer()
		total = 0
	end

	set_time_text()
end

function start_timer()
	timer_active = true
	obs.timer_add(timer_callback, 100)
end

function stop_timer()
	timer_active = false
	obs.timer_remove(timer_callback)
end

function on_event(event)
	if event == obs.OBS_FRONTEND_EVENT_STREAMING_STARTED then
		if mode == "Streaming timer" then
			total = 0
			stop_timer()
			start_timer()
		end
	elseif event == obs.OBS_FRONTEND_EVENT_STREAMING_STOPPED then
		if mode == "Streaming timer" then
			stop_timer()
		end
	elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_STARTED then
		if mode == "Recording timer" then
			total = 0
			stop_timer()
			start_timer()
		end
	elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_STOPPED then
		if mode == "Recording timer" then
			stop_timer()
		end
	end
end

function activate(activating)
	if activated == activating then
		return
	end

	if (mode == "Streaming timer" or mode == "Recording timer") then
		return
	end

	activated = activating

	if activating then
		if global then
			return
		end

		if mode == "Specific time" then
			total_seconds = delta_time()
		end

		total = total_seconds

		stop_timer()
		start_timer()
	end
end

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

	if mode == "Streaming timer" or mode == "Recording timer" then
		return
	end

	if mode == "Specific time" then
		total_seconds = delta_time()
	end
	
	if mode == "Countdown" then
	--local t= lefttime(finaltime)
	total_seconds = total_seconds+1
	end

	total = total_seconds
	stop_timer()
	set_time_text()
end

function on_pause(pressed)
	if not pressed then
		return
	end

	if total == 0 then
		reset(true)
	end

	if mode == "Streaming timer" or mode == "Recording timer" then
		return
	end

	if timer_active then
		stop_timer()
	else
		stop_timer()
		start_timer()
	end
end

function pause_button_clicked(props, p)
	on_pause(true)
	return false
end

function reset_button_clicked(props, p)
	reset(true)
	return false
end


function lefttime(dt)  
	local t=parse_json_date_utc(dt)
	if(t=="Invalid date")then
	return t
	end
	t=t-os.time()
	return  t
end

function timezoneparse(tz)
local timezone={{"WITA","+0800"},{"WIT","+0900"},{"WIB","+0700"},{"WET","+0000"},{"WEST","+0100"},{"WAT","+0100"},{"UYT","-0300"},{"UTC","+0000"},{"SST","-1100"},{"PWT","+0900"},{"PST","-0800"},{"PKT","+0500"},{"PHT","+0800"},{"PET","-0500"},{"PDT","-0700"},{"NZST","+1200"},{"NZDT","+1300"},{"NPT","+0545"},{"MYT","+0800"},{"MST","-0700"},{"MMT","+0630"},{"MDT","-0600"},{"KST","+0900"},{"JST","+0900"},{"IST","+0530"},{"IST","+0200"},{"IRST","+0330"},{"IRDT","+0430"},{"IDT","+0300"},{"ICT","+0700"},{"HST","-1000"},{"HKT","+0800"},{"GST","+0400"},{"GMT","+0000"},{"FJT","+1200"},{"FJST","+1300"},{"EST","-0500"},{"EET","+0200"},{"EEST","+0300"},{"EDT","-0400"},{"ECT","-0500"},{"EAT","+0300"},{"ChST","+1000"},{"CST","-0600"},{"CST","-0500"},{"CST","+0800"},{"COT","-0500"},{"CLT","-0400"},{"CLST","-0300"},{"CET","+0100"},{"CEST","+0200"},{"CDT","-0500"},{"CDT","-0400"},{"CCT","+0630"},{"CAT","+0200"},{"BTT","+0600"},{"BST","+0100"},{"BRT","-0300"},{"BOT","-0400"},{"BNT","+0800"},{"BDT","+0600"},{"AWST","+0800"},{"AWDT","+0900"},{"ART","-0300"},{"AKST","-0900"},{"AKDT","-0800"},{"AFT","+0430"},{"AEST","+1000"},{"AEDT","+1100"},{"ACST","+0930"},{"ACDT","+1030"}}

if(tz=="U")then
return get_tzoffset(utc*3600)
end

stlen=tonumber(#timezone)
for i=1,stlen do
if(tz==timezone[i][1])then
return timezone[i][2]
end
end

return 0 --utc
end

function parse_json_date_utc(json_date)
    local pattern = "(%d+)%-(%d+)%-(%d+)%a(%d+)%:(%d+)%:([%d%.]+)([Z%+%-])(%d?%d?)%:?(%d?%d?)"
    
    if(json_date:match("[A-W]+$")) then --try parse UTC FIX
    local normal = "(%d+)[%-%/](%d+)[%-%/](%d+) +(%d+)%:(%d+)%s?[A-W]+$"--ローカル時間MD+HM
        if(json_date:match(normal))then
        local year, month, day, hour, minute,
        seconds = json_date:match(normal)
        json_date = year.."-"..month.."-"..day.."T"..hour..":"..minute..":00".. timezoneparse(json_date:match("[A-W]+$"))
     end
    end
 
    if(json_date:match(pattern)==nil)then
   
    local unix = "^(%d+)$"
    local normalp = "(%d+)[%-%/](%d+)[%-%/](%d+)$"--ローカル時間MD
    local normalq = "(%d+)[%-%/](%d+)[%-%/](%d+) +(%d+)$"--ローカル時間MD+h
    local normal = "(%d+)[%-%/](%d+)[%-%/](%d+) +(%d+)%:(%d+)$"--ローカル時間MD+HM
    local normalr = "(%d+)[%-%/](%d+)[%-%/](%d+) +(%d+)%:(%d+)%:([%d%.]+)"--ローカル時間MDhms

        if(json_date:match(normal))then
        local year, month, day, hour, minute,
        seconds = json_date:match(normal)
    	 return  os.time{year = year, month = month, day = day, hour =  hour, min = minute, sec = 0}
    	end
    	if(json_date:match(normalp))then
        local year, month, day, hour, minute,
        seconds = json_date:match(normalp)
    	 return  os.time{year = year, month = month, day = day, hour =  0, min =0, sec = 0}
    	end
    	 if(json_date:match(normalq))then
        local year, month, day, hour, minute,
        seconds = json_date:match(normalq)
    	 return  os.time{year = year, month = month, day = day, hour =  hour, min = 0, sec = 0}
    	end
    	 if(json_date:match(normalr))then
        local year, month, day, hour, minute,
        seconds = json_date:match(normalr)
    	 return  os.time{year = year, month = month, day = day, hour =  hour, min = minute, sec = seconds}
    	end
    	if(json_date:match(unix)) then
	     return json_date
    	end
    
     return "Invalid date"
    end
    
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
    --offset = offset -3600
    --end
    --return timestamp + get_timezone() -offset
    
    --return timestamp + get_timezone_the_day() -offset
    
    return timestamp + get_timezone_offset(timestamp) -offset  + (hour-4)*3600
    --hourは越境時タイムマシンが発生するので最後に足す、幻の2時(2020-03-08T02:00:00) -05:00
    --https://ja.wikipedia.org/wiki/%E5%A4%8F%E6%99%82%E9%96%93　ブラジルが0時なので4時までずらす
end

function get_timezone_the_day()
  local hh = tonumber(string.format("%d",(tonumber(os.date("%z"))/100)))
  local mm= ((tonumber(os.date("%z"))-100*hh)/60)*3600
  local hhmm = hh*3600 +mm
  return hhmm  --サマー有りタイムゾーン時差情報
end

--http://lua-users.org/wiki/TimeZone
function get_timezone()
  local now = os.time()
  return os.difftime(now, os.time(os.date("!*t", now))) --サマーなしタイムゾーン時差情報 現在時間
end

function get_tzoffset(timezone)
  local h, m = math.modf(timezone / 3600)
  return string.format("%+.4d", 100 * h + 60 * m)
end

function get_timezone_offset(ts)  --サマー有りタイムゾーン時差情報 当時の時間
	local utcdate   = os.date("!*t", ts)
	local localdate = os.date("*t", ts)
	localdate.isdst = false -- this is the trick
	return os.difftime(os.time(localdate), os.time(utcdate))
end

function settings_modified(props, prop, settings)
	local mode_setting = obs.obs_data_get_string(settings, "mode")
	local p_duration = obs.obs_properties_get(props, "duration")
	local p_hour = obs.obs_properties_get(props, "hour")
	local p_minutes = obs.obs_properties_get(props, "minutes")
	local p_stop_text = obs.obs_properties_get(props, "stop_text")
	local p_a_mode = obs.obs_properties_get(props, "a_mode")
	local button_pause = obs.obs_properties_get(props, "pause_button")
	local button_reset = obs.obs_properties_get(props, "reset_button")
	

	if (mode_setting == "Countdown") then
		obs.obs_property_set_visible(p_duration, true)
		obs.obs_property_set_visible(p_hour, false)
		obs.obs_property_set_visible(p_minutes, false)
		obs.obs_property_set_visible(p_stop_text, true)
		obs.obs_property_set_visible(button_pause, true)
		obs.obs_property_set_visible(button_reset, true)
		obs.obs_property_set_visible(p_a_mode, true)
	elseif (mode_setting == "Countup") then
		obs.obs_property_set_visible(p_duration, false)
		obs.obs_property_set_visible(p_hour, false)
		obs.obs_property_set_visible(p_minutes, false)
		obs.obs_property_set_visible(p_stop_text, false)
		obs.obs_property_set_visible(button_pause, true)
		obs.obs_property_set_visible(button_reset, true)
			obs.obs_property_set_visible(p_a_mode, true)
	elseif (mode_setting == "Specific time") then
		obs.obs_property_set_visible(p_duration, false)
		obs.obs_property_set_visible(p_hour, true)
		obs.obs_property_set_visible(p_minutes, true)
		obs.obs_property_set_visible(p_stop_text, true)
		obs.obs_property_set_visible(button_pause, true)
		obs.obs_property_set_visible(button_reset, true)
		obs.obs_property_set_visible(p_a_mode, true)
	elseif (mode_setting == "Streaming timer") then
		obs.obs_property_set_visible(p_duration, false)
		obs.obs_property_set_visible(p_hour, false)
		obs.obs_property_set_visible(p_minutes, false)
		obs.obs_property_set_visible(p_stop_text, false)
		obs.obs_property_set_visible(button_pause, false)
		obs.obs_property_set_visible(button_reset, false)
		obs.obs_property_set_visible(p_a_mode, false)
	elseif (mode_setting == "Recording timer") then
		obs.obs_property_set_visible(p_duration, false)
		obs.obs_property_set_visible(p_hour, false)
		obs.obs_property_set_visible(p_minutes, false)
		obs.obs_property_set_visible(p_stop_text, false)
		obs.obs_property_set_visible(button_pause, false)
		obs.obs_property_set_visible(button_reset, false)
		obs.obs_property_set_visible(p_a_mode, false)
	end

	return true
end

function script_properties()

	local props = obs.obs_properties_create()

	local p_mode = obs.obs_properties_add_list(props, "mode", "Mode", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	obs.obs_property_list_add_string(p_mode, "Countdown", "countdown")  --右だけ日本語化
	obs.obs_properties_add_float(props, "UTC", "WorldTime UTC-14～+14(%UTC)", -14, 14, 1)
	obs.obs_property_set_modified_callback(p_mode, settings_modified)
	obs.obs_property_set_long_description(f_prop, "%d - days\n%hh - hours with leading zero (00..23)\n%h - hours (0..23)\n%HH - hours with leading zero (00..infinity)\n%H - hours (0..infinity)\n%mm - minutes with leading zero (00..59)\n%m - minutes (0..59)\n%MM - minutes with leading zero (00..infinity)\n%M - minutes (0..infinity)\n%ss - seconds with leading zero (00..59)\n%s - seconds (0..59)\n%SS - seconds with leading zero (00..infinity)\n%S - seconds (0..infinity)\n%t - tenths")
	local p = obs.obs_properties_add_list(props, "source", "TEXT(GDI+)", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	
	
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


	local p_title_text
	local p_start_text
	local p_stop_text 
	local f_prop 
	local p_para_text 
	local p_time_text 
	
	
	if(false)then
--	if(true)then  --ENGLISH MODE delete if(false), use if(true)
	 p_title_text = obs.obs_properties_add_text(props, "title_text", "EVENT NAME:", obs.OBS_TEXT_DEFAULT)
	 p_start_text = obs.obs_properties_add_text(props, "start_text", "START:ex　2020-02-26T15:00:00+09:00", obs.OBS_TEXT_DEFAULT)
	 p_stop_text = obs.obs_properties_add_text(props, "stop_text", "END:ex　2020-02-26T21:00:00+09:00", obs.OBS_TEXT_DEFAULT)
	 f_prop = obs.obs_properties_add_text(props, "format", "ELASPED/LEFT format", obs.OBS_TEXT_DEFAULT)
	 p_para_text = obs.obs_properties_add_text(props, "para_text", "TIME parameter:", obs.OBS_TEXT_DEFAULT)
	 p_time_text = obs.obs_properties_add_text(props, "time_text", "TIME format:", obs.OBS_TEXT_DEFAULT)
	 p_end_text = obs.obs_properties_add_text(props, "end_text", "STOP text:(empty not use)", obs.OBS_TEXT_DEFAULT)
	else
	 p_title_text = obs.obs_properties_add_text(props, "title_text", "イベント名:", obs.OBS_TEXT_DEFAULT)
	 p_start_text = obs.obs_properties_add_text(props, "start_text", "開始時間:例　2020-02-26T15:00:00+09:00", obs.OBS_TEXT_DEFAULT)
	 p_stop_text = obs.obs_properties_add_text(props, "stop_text", "終了時間:例　2020-02-26T21:00:00+09:00", obs.OBS_TEXT_DEFAULT)
	 f_prop = obs.obs_properties_add_text(props, "format", "経過/残表示形式", obs.OBS_TEXT_DEFAULT)
	 p_para_text = obs.obs_properties_add_text(props, "para_text", "表示する時間:", obs.OBS_TEXT_DEFAULT)
	 p_time_text = obs.obs_properties_add_text(props, "time_text", "時刻表記:", obs.OBS_TEXT_DEFAULT)
	 p_end_text = obs.obs_properties_add_text(props, "end_text", "タイマー停止の文字:(空欄だと未使用)", obs.OBS_TEXT_DEFAULT)
	end
	
	local p_a_mode = obs.obs_properties_add_list(props, "a_mode", "Activation mode", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	obs.obs_property_list_add_string(p_a_mode, "Global (timer always active)", "global")
	obs.obs_property_list_add_string(p_a_mode, "Start timer on activation", "start_reset")

	local button_pause = obs.obs_properties_add_button(props, "pause_button", "Start/Stop", pause_button_clicked)
	local reset_button = obs.obs_properties_add_button(props, "reset_button", "Reset", reset_button_clicked)

	obs.obs_property_set_visible(p_time_text, true)
	obs.obs_property_set_visible(p_stop_text, true)
	obs.obs_property_set_visible(p_start_text, true)
	obs.obs_property_set_visible(p_para_text, true)
	obs.obs_property_set_visible(p_title_text, true)
	obs.obs_property_set_visible(p_end_text, true)
	obs.obs_property_set_visible(button_pause, true)
	obs.obs_property_set_visible(button_reset, true)
	obs.obs_property_set_visible(p_a_mode, true)

	return props
end

function script_description()
	return "Sets a text source to act as a timer with advanced options. Hotkeys can be set for starting/stopping and to the reset timer."
end

function cut_string(s,max)
if(#s>=max)then
s = s:sub(1,max)
end

return s
end

function script_update(settings)
	stop_timer()

	mode = obs.obs_data_get_string(settings, "mode")
	a_mode = obs.obs_data_get_string(settings, "a_mode")
	utc           = obs.obs_data_get_double(settings, "UTC")

	if mode == "Countdown" then
	local dt = cut_string(obs.obs_data_get_string(settings, "stop_text"),30)    --"2020-02-26T21:00:00+09:00"	
	finaltime =dt
	local t= lefttime(dt)
	if(t=="Invalid date")then
	else
	if t<0 then
	 t=0
	end
	end
		
	total_seconds = total_seconds+1
	local dt = cut_string(obs.obs_data_get_string(settings, "start_text"),30)    --"2020-02-26T21:00:00+09:00"	
	starttime =dt


	else
		total_seconds = 0
	end
	
	

	if a_mode == "Global (timer always active)" then
		global = true
	else
		global = false
	end

	hour = obs.obs_data_get_int(settings, "hour")
	minute = obs.obs_data_get_int(settings, "minutes")
	source_name = cut_string(obs.obs_data_get_string(settings, "source"),100)
	stop_text = cut_string(obs.obs_data_get_string(settings, "stop_text"),30)
	end_text = cut_string(obs.obs_data_get_string(settings, "end_text"),30)
	format = cut_string(obs.obs_data_get_string(settings, "format"),100)
	title=cut_string(obs.obs_data_get_string(settings, "title_text"),100)
	para_text=cut_string(obs.obs_data_get_string(settings, "para_text"),255)
	time_text=cut_string(obs.obs_data_get_string(settings, "time_text"),100)

	set_time_text()

	reset(true)
end

function script_defaults(settings)
	obs.obs_data_set_default_double(settings, "UTC", 9)
	obs.obs_data_set_default_string(settings, "start_text", "2020-04-30T12:00:00+09:00")
	obs.obs_data_set_default_string(settings, "stop_text", "2020-05-07T21:00:00+09:00")
	obs.obs_data_set_default_string(settings, "mode", "Countdown")
	obs.obs_data_set_default_string(settings, "a_mode", "Global (timer always active)")
	obs.obs_data_set_default_string(settings, "format", "%H:%m:%s")
	obs.obs_data_set_default_string(settings, "title", "でれすて")
	obs.obs_data_set_default_string(settings, "time_text", "%Y/%m/%d %H:%M:%S")
	obs.obs_data_set_default_string(settings, "para_text", "タイトル%T%n経過時間%K%n残り時間%L%nイベント時間%I%n現地時間%N%n日本時間%JST%n達成率%P%nS %S%nE %E%nSJ %SJ%nEJ %EJ")
	obs.obs_data_set_default_string(settings, "end_text", "タイマー停止中(開始前/終了)")

end

function script_save(settings)
	local hotkey_save_array_reset = obs.obs_hotkey_save(hotkey_id_reset)
	local hotkey_save_array_pause = obs.obs_hotkey_save(hotkey_id_pause)
	obs.obs_data_set_array(settings, "reset_hotkey", hotkey_save_array_reset)
	obs.obs_data_set_array(settings, "pause_hotkey", hotkey_save_array_pause)
	obs.obs_data_array_release(hotkey_save_array_pause)
	obs.obs_data_array_release(hotkey_save_array_reset)
end

function script_load(settings)
	local sh = obs.obs_get_signal_handler()
	obs.signal_handler_connect(sh, "source_activate", source_activated)
	obs.signal_handler_connect(sh, "source_deactivate", source_deactivated)

	hotkey_id_reset = obs.obs_hotkey_register_frontend("reset_timer_thingy", "Reset Timer", reset)
	hotkey_id_pause = obs.obs_hotkey_register_frontend("pause_timer", "Start/Stop Timer", on_pause)
	local hotkey_save_array_reset = obs.obs_data_get_array(settings, "reset_hotkey")
	local hotkey_save_array_pause = obs.obs_data_get_array(settings, "pause_hotkey")
	obs.obs_hotkey_load(hotkey_id_reset, hotkey_save_array_reset)
	obs.obs_hotkey_load(hotkey_id_pause, hotkey_save_array_pause)
	obs.obs_data_array_release(hotkey_save_array_reset)
	obs.obs_data_array_release(hotkey_save_array_pause)

	obs.obs_frontend_add_event_callback(on_event)
end
