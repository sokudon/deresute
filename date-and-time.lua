--orig https://obsproject.com/forum/resources/date-and-time.644/
-- 令和テキトー表示とUTCグローバル時間を出せるよう改造

obs           = obslua
source_name   = ""

last_text     = ""
format_string = ""
activated     = false
utc           = 0

-- Function to set the time text
function get_timezone()
  local now = os.time()
  return os.difftime(now, os.time(os.date("!*t", now)))
end

function parse_jp_era(date)
  local dt = os.date("*t")
 if (string.find(date,"%%U")) then
  local t = os.time()+utc*3600 -get_timezone()
  	return os.date('%x %X(UTC'..utc.."00)", t)
  else if (get_timezone() == 9*3600) then
  local jp_day={"日","月","火","水","木","金","土"}
  date= string.gsub(date, "%%Jw",jp_day[dt.wday])
  date= string.gsub(date, "%%JW",jp_day[dt.wday].."曜日")
  date= string.gsub(date, "%%JR","令和"..(dt.year-2018).."年")
  date= string.gsub(date, "%%Jr","R"..(dt.year-2018))  --%Jr/%Y/%m/%d(%Jw)%X
  --date= string.gsub(date, "%%JH","平成"..(dt.year-1988).."年")
  --date= string.gsub(date, "%%Jh","H"..(dt.year-1988))
  --date= string.gsub(date, "%%JT","大正"..(dt.year-1911).."年")
  --date= string.gsub(date, "%%Jt","T"..(dt.year-1911))
  else
   date= string.gsub(date, "%%J%w","")
   date= "%%J?はJST,UTC+9での動作限定です"
  end
  date= string.gsub(date, "%%Z", (get_timezone()/3600)..(get_timezone()%60)) --timezone タイムゾーン時差情報 %Y/%m/%d(%Jw)%X(UTC%z)
 end
  
  return os.date(date)
end

--%U    worldtime set UTCsetting,　UTC標準時から設定どおりの時間を表示　他の%無視して優先順位一位
--%Z    timezone,degit JST is 0900　タイムゾーン時差情報 %Y/%m/%d(%Jw)%X(UTC%z)

--%a	abbreviated weekday name (e.g., Wed)
--%A	full weekday name (e.g., Wednesday)
--%b	abbreviated month name (e.g., Sep)
--%B	full month name (e.g., September)
--%c	date and time (e.g., 09/16/98 23:48:10)
--%d	day of the month (16) [01-31]
--%H	hour, using a 24-hour clock (23) [00-23]
--%I	hour, using a 12-hour clock (11) [01-12]
--%M	minute (48) [00-59]
--%m	month (09) [01-12]
--%p	either "am" or "pm" (pm)
--%S	second (10) [00-61]
--%w	weekday (3) [0-6 = Sunday-Saturday]
--%x	date (e.g., 09/16/98)
--%X	time (e.g., 23:48:10)
--%Y	full year (1998)
--%y	two-digit year (98) [00-99]
--%%	the character `%´

--hour	15 os.date("*t").hash
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
