-- parse json https://gist.github.com/zwh8800/9b0442efadc97408ffff248bc8573064
--original timer https://obsproject.com/forum/resources/advanced-timer.637/
--タイトル%T%n経過時間%K%n残り時間%L%nイベント時間%I%n
--現地時間%N%n日本時間%JST%n達成率%P%nS %S%nE %E%nSJ %SJ%nEJ %EJ"
--拡張前　旧版残り時間だけのやつ　https://raw.githubusercontent.com/sokudon/deresute/2c8516d114a6500b0ad4e91d31a776f5b5d48891/OBSdere.lua


obs           = obslua
source_name   = ""
finaltime =""
starttime =""
title =""
para_text=""
time_text=""

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

function set_time_text()
	local text = para_text	
	local elaspted=get_timestring(lefttime(starttime),format)
	local left=get_timestring(lefttime(finaltime),format)
	local ibetime=checkdate(lefttime(starttime),lefttime(finaltime))
	local prog=""
	local bar=""
	if(ibetime==true)then
	ibetime=get_timestring(parse_json_date_utc(finaltime)-parse_json_date_utc(starttime),format)
	prog=string.format("%2.2f",math.abs(lefttime(starttime)/(parse_json_date_utc(finaltime)-parse_json_date_utc(starttime))*100))
	if(tonumber(prog)>100)then
	prog=100
	end
	bar=makebar(prog)
	end
	
	local time_textq=string.gsub(time_text, "%%[EJKLNOPQfikloqsv]","")	 --フリーズ文字 %%[EJKLNOPQfikloqsv]
	text = string.gsub(text, "%%N", os.date(time_textq,os.time() ))
	local time_textj="!".. string.gsub(time_textq, "%%z", "+0900")
	text = string.gsub(text, "%%JST",os.date(time_textj,os.time()+9*3600 ))
	text = string.gsub(text, "%%I", ibetime)
	text = string.gsub(text, "%%T", title)
	text = string.gsub(text, "%%K", elaspted)
	text = string.gsub(text, "%%L", left)
	text = string.gsub(text, "%%P", prog)
	text = string.gsub(text, "%%Q", bar)
	if(parse_json_date_utc(starttime)=="Invalid date")then
	text=  string.gsub(text, "%%SJ?","Invalid date")
	else
	text = string.gsub(text, "%%SJ",os.date(time_textj,parse_json_date_utc(starttime)+9*3600 ))
	text = string.gsub(text, "%%S",os.date(time_textq,parse_json_date_utc(starttime)))
	end
	if(parse_json_date_utc(finaltime)=="Invalid date")then
	text=  string.gsub(text, "%%EJ?","Invalid date")
	else
	text = string.gsub(text, "%%EJ",os.date(time_textj,parse_json_date_utc(finaltime)+9*3600 ))
	text = string.gsub(text, "%%E",os.date(time_textq,parse_json_date_utc(finaltime)))
	end
	text=  string.gsub(text, "%%[EJKLNOPQfikloqsv]","")	 --フリーズ文字 %%[EJKLNOPQfikloqsv]
	
	text =os.date(text)
	

	if total < 1 and (mode == "Countdown" or mode == "Specific time") then
		text = "終了しました"   --stop_text
	end
	

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

function parse_json_date_utc(json_date)
    local pattern = "(%d+)%-(%d+)%-(%d+)%a(%d+)%:(%d+)%:([%d%.]+)([Z%+%-])(%d?%d?)%:?(%d?%d?)"
    local unix 	  = "^(%d+)$"
    local normal  = "(%d+)[%-%/](%d+)[%-%/](%d+)%s+(%d+)%:(%d+)%:?([%d?%.]+)"

    
    if(json_date:match(unix))then
     return json_date
    end
    if(json_date:match(pattern)==nil)then
    
        if((json_date..":00"):match(normal))then
        local year, month, day, hour, minute,
                seconds = (json_date..":00"):match(normal)
        if(seconds==nil or seconds=="")then
        seconds=0
        else
        seconds=seconds:match("[%d%.]+")
        end
    	 return  os.time{year = year, month = month, day = day, hour =  hour, min = minute, sec = seconds}
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
	obs.obs_property_list_add_string(p_mode, "Countdown", "カウントダウン")  --右だけ日本語化
	obs.obs_property_set_modified_callback(p_mode, settings_modified)

	obs.obs_property_set_long_description(f_prop, "%d - days\n%hh - hours with leading zero (00..23)\n%h - hours (0..23)\n%HH - hours with leading zero (00..infinity)\n%H - hours (0..infinity)\n%mm - minutes with leading zero (00..59)\n%m - minutes (0..59)\n%MM - minutes with leading zero (00..infinity)\n%M - minutes (0..infinity)\n%ss - seconds with leading zero (00..59)\n%s - seconds (0..59)\n%SS - seconds with leading zero (00..infinity)\n%S - seconds (0..infinity)\n%t - tenths")

	local p = obs.obs_properties_add_list(props, "source", "テキストソース(GDI+)の名前", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
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


	local p_title_text = obs.obs_properties_add_text(props, "title_text", "イベント名:", obs.OBS_TEXT_DEFAULT)
	local p_start_text = obs.obs_properties_add_text(props, "start_text", "開始時間:例　2020-02-26T15:00:00+09:00", obs.OBS_TEXT_DEFAULT)
	local p_stop_text = obs.obs_properties_add_text(props, "stop_text", "終了時間:例　2020-02-26T21:00:00+09:00", obs.OBS_TEXT_DEFAULT)
	local f_prop = obs.obs_properties_add_text(props, "format", "経過/残表示形式", obs.OBS_TEXT_DEFAULT)
	local p_para_text = obs.obs_properties_add_text(props, "para_text", "表示する時間:", obs.OBS_TEXT_DEFAULT)
	local p_time_text = obs.obs_properties_add_text(props, "time_text", "時刻表記:", obs.OBS_TEXT_DEFAULT)
	
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
	format = cut_string(obs.obs_data_get_string(settings, "format"),100)
	title=cut_string(obs.obs_data_get_string(settings, "title_text"),100)
	para_text=cut_string(obs.obs_data_get_string(settings, "para_text"),255)
	time_text=cut_string(obs.obs_data_get_string(settings, "time_text"),100)

	set_time_text()

	reset(true)
end

function script_defaults(settings)
	obs.obs_data_set_default_string(settings, "start_text", "2020-04-30T12:00:00+09:00")
	obs.obs_data_set_default_string(settings, "stop_text", "2020-05-07T21:00:00+09:00")
	obs.obs_data_set_default_string(settings, "mode", "Countdown")
	obs.obs_data_set_default_string(settings, "a_mode", "Global (timer always active)")
	obs.obs_data_set_default_string(settings, "format", "%H:%m:%s")
	obs.obs_data_set_default_string(settings, "title", "でれすて")
	obs.obs_data_set_default_string(settings, "time_text", "%Y/%m/%d %H:%M:%S")
	obs.obs_data_set_default_string(settings, "para_text", "タイトル%T%n経過時間%K%n残り時間%L%nイベント時間%I%n現地時間%N%n日本時間%JST%n達成率%P%nS %S%nE %E%nSJ %SJ%nEJ %EJ")

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
