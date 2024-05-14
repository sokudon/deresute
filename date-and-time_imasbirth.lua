--orig https://obsproject.com/forum/resources/date-and-time.644/
-- 令和テキトー表示とUTCグローバル時間を出せるよう改造
--2024/05/13 学園アイマス追加、アイマスゲーム名をプルダウンに
--誕生日がないものはリストにたさないようにした




--出力例
--サマータイム有り＋時差情報 先頭に!をつけるとUTC時間になる
--%Y/%m/%d(%a)%X(UTC%z%DST)

--全部出し
--%UTC
--%c%DST
--%x%X%z
--%s
--%ISO
--%ISOZ

--複数のタイムゾーン
--%JST
--UTC+?? %UTC
--UTC協定時間%ISOZ
--ISO8601 %ISO


--あいますの情報を出す
--%i
--%J%is
--%K%it
--%E%ie

--誕生日
--%in
--%ib
--%ic
--%EM



--独自拡張
--%EM	あいますお誕生日何日以内のやつ
--%E	デバッグ文字1 サービス終了日
--%J	デバッグ文字2 サービス開始日
--%K	デバッグ文字3 今年の周年日
--$i	あいますゲームの名前,フリーズ防止
--$ii	あいますゲームの名前英名
--%is	あいますの記念日の時間からの経過時間
--%it	あいますの記念日までの時間
--%ie	あいますのサービス終了した時間からの経過時間(データがないものは表示なし)
--%ib	アイドル名誕生日
--%ic	アイドル名誕生日までの時間
--%in	アイドル名
--%ine	アイドル名英名
--%inh	アイドル名ひらがな
--%UTC  worldtime set UTCsetting,	UTC標準時からUI設定の時間を表示,サマータイムは非対応
--%JST  ISO8601表示日本時間
--%ISO  ISO8601表示ローカル時間
--%ISOZ ISO8601表示UTC時間
--%Z	サマーなしタイムゾーン時差情報,元はタイムゾーンストリングだが文字化けで使えないので（）
--%ZZ   timezone,HH:mm  timezoneサマーなしタイムゾーン時差情報  
--%zz   サマータイム有り＋時差情報 HH:mm
--%DST  夏時間かどうか出力する 引数"J"で夏時間
--%s    unixtime,フリーズ防止
--Vw    ローカルの曜日　obs30～以上は相性が悪いため非推奨
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



--inum の番号 あいますゲーム誕生日
--THE IDOLM@STER	2005/07/26	アーケード
--THE IDOLM@STER	2007/01/25	Xbox 360
--THE IDOLM@STER LIVE FOR YOU!	2008/02/28	Xbox 360
--THE IDOLM@STER SP	2009/02/19	PSP
--THE IDOLM@STER Dearly Stars	2009/09/17	DS
--アイドルマスター モバイル	2010/12/21	フィーチャー・フォン
--THE IDOLM@STER 2	2011/02/24	Xbox 360
--THE IDOLM@STER 2	2011/10/27	PS3
--アイドルマスター シンデレラガールズ	2011/11/28	Mobage
--アイドルマスター モバイルi	2012/03/30	iOS
--THE IDOLM@STER SHINY FESTA	2012/10/25	PSP
--アイドルマスター ミリオンライブ!	2013/02/27	GREE
--THE IDOLM@STER SHINY FESTA	2013/04/22	iOS
--アイマスチャンネル	2013/10/02	PS3
--アイドルマスター ワンフォーオール	2014/05/15	PS3
--アイドルマスター SideM	2014/07/17	Mobage
--韓国版アイドルマスターシンデレラガールズ	2014/12/02	Mobage
--アイドルマスター シンデレラガールズ スターライトステージ	2015/09/03	iOS、Android
--アイドルマスター マストソングス 赤盤/青盤	2015/12/10	PS Vita
--アイドルマスター プラチナスターズ	2016/07/28	PS4
--アイドルマスター シンデレラガールズ ビューイングレボリューション	2016/10/13	PS VR
--アイドルマスター ミリオンライブ! シアターデイズ	2017/06/29	iOS、Android
--アイドルマスター SideM LIVE ON ST@GE!	2017/08/30	iOS、Android
--アイドルマスター ステラステージ	2017/12/21	PS4
--アイドルマスター シャイニーカラーズ	2018/04/24	enza
--ミリシタ海外版(韓国)	2019/08/30	iOS、Android
--ミリシタ海外版(台湾,香港,マカオ)	2019/08/30	iOS、Android
--アイドルマスター シンデレラガールズ スターライトスポット	2019/09/03	iOS、Android
--アイドルマスター プロデューサー グリーティングキット	2021/01/08	iOS、Android
--アイドルマスター ポップリンクス	2021/01/21	iOS、Android
--アイドルマスター スターリットシーズン	2021/10/14	PS4、steam
--アイドルマスター SideM　GROWING STARS	2021/10/06	iOS、Android
--アイドルマスター シャイニーカラーズ Song for Prism	2023/11/14	iOS、Android
--学園アイドルマスター	2024/05/16	iOS、Android
--アイドルマスター TOURS	--	アーケード 


obs           = obslua
source_name   = ""

last_text     = ""
format_string = ""
activated     = false
utc           = 0
ima           = 0
imass         = 0
useidol		  = 1
mln        	  = 1
cgn           = 1
smn        	  = 1
scn           = 1
dsn           = 1
gan           = 1
daylim 		  = 7
daystring     =""
debugtxt1	  = ""
debugtxt2	  = ""
debugtxt3	  = ""
debugtxt4	  = ""
daychange     = ""


--上のDATE表記をつかわないで%混合でだしたい　%Vw
local_day={"にち","げつ","か　","すい","もく","きん","ど　",} --dt.wday用 月金土はなぜかとまるのでひらがな
--local_day={"日　","月　","火　","水　","木　","金　","土　"} --dt.wday用 月金土はなぜかとまるのですぺたしでいけるっぽい
--local_day={"天　","一　","二　","三　","四　","五　","六　"} --dt.wday用  中華曜日でもかなりだめっぽい


-- %Vw 週曜日のパラメーター
--あいますようそがないので無理やり追加（）
--https://script.googleusercontent.com/macros/echo?user_content_key=yKlNtB0m82El8ySZ1t46GKNi2YI2JtH6_Ba8Bj3CYA_tq7weSpuYxFibPYVf0-h3jzkXaKbaeLHra79trL501FNd7_VJh7UNm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPrjrzOqG57A42W18Wxz1WDP-eBihPx5SsKk9bfVywybSSQhmxvfOQqhL5HLwlai3E9OlGKLMLnt&lib=MvrSijJWbMSM_kaRZox9WvnndBJ9ix56c"></script>
--https://script.googleusercontent.com/macros/echo?user_content_key=y26MKGO6KrGvdbHl13r9fBslGLG7tCPiA6FJnZh4Jsyk2lBN_XG4jI_Wyv2NVQGFzWV2wrx89p3TYooV2Yx8nXCb8HvrtA1wm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPuihn6KSAqYQajIiGBerRjxT7-n1zx1nVP2RTPbsLWMYTqYZhIACZwYZpTak_o22Q&lib=MmHolKhlrk4LP8GJAw1lMwYFpGDg2vV9V"></script>

imashead ={"ゲーム名","稼働","機種","終わり"}
imas ={{"THE IDOLM@STER","2005-07-25T15:00:00.000Z","アーケード","2010-08-30T15:00:00.000Z","the idolm@ster"},{"THE IDOLM@STER","2007-01-24T15:00:00.000Z","Xbox 360","","the idolm@ster"},{"THE IDOLM@STER LIVE FOR YOU!","2008-02-27T15:00:00.000Z","Xbox 360","","the idolm@ster live for you!"},{"THE IDOLM@STER SP","2009-02-18T15:00:00.000Z","PSP","","the idolm@ster sp"},{"THE IDOLM@STER Dearly Stars","2009-09-16T15:00:00.000Z","DS","","the idolm@ster dearly stars"},{"アイドルマスター モバイル","2010-12-20T15:00:00.000Z","フィーチャー・フォン","2016-03-30T15:00:00.000Z","idolmaster mobile"},{"THE IDOLM@STER 2","2011-02-23T15:00:00.000Z","Xbox 360","","the idolm@ster 2"},{"THE IDOLM@STER 2","2011-10-26T15:00:00.000Z","PS3","","the idolm@ster 2"},{"アイドルマスター シンデレラガールズ","2011-11-27T15:00:00.000Z","Mobage","2023-03-29T15:00:00.000Z","idolmaster cinderella girls"},{"アイドルマスター モバイルi","2012-03-29T15:00:00.000Z","iOS","2016-01-17T15:00:00.000Z","idolmaster mobile i"},{"THE IDOLM@STER SHINY FESTA","2012-10-24T15:00:00.000Z","PSP","","the idolm@ster shiny festa"},{"アイドルマスター ミリオンライブ!","2013-02-26T15:00:00.000Z","GREE","2018-03-19T03:00:00.000Z","the idolm@ster million live!"},{"THE IDOLM@STER SHINY FESTA","2013-04-21T15:00:00.000Z","iOS","2016-03-14T15:00:00.000Z","the idolm@ster shiny festa"},{"アイマスチャンネル","2013-10-01T15:00:00.000Z","PS3","","im@s channel"},{"アイドルマスター ワンフォーオール","2014-05-14T15:00:00.000Z","PS3","","the idolm@ster one for all"},{"アイドルマスター SideM","2014-07-16T15:00:00.000Z","Mobage","2023-01-04T15:00:00.000Z","the idolm@ster sidem"},{"韓国版アイドルマスターシンデレラガールズ","2014-12-01T15:00:00.000Z","Mobage","2016-03-14T06:00:00.000Z","korean version of the idolm@ster cinderella girls"},{"アイドルマスター シンデレラガールズ スターライトステージ","2015-09-02T15:00:00.000Z","iOS、Android","","the idolm@ster cinderella girls starlight stage"},{"アイドルマスター マストソングス 赤盤/青盤","2015-12-09T15:00:00.000Z","PS Vita","","the idolmaster must songs red edition/blue edition"},{"アイドルマスター プラチナスターズ","2016-07-27T15:00:00.000Z","PS4","","idolmaster platinum stars"},{"アイドルマスター シンデレラガールズ ビューイングレボリューション","2016-10-12T15:00:00.000Z","PS VR","","the idolm@ster cinderella girls viewing revolution"},{"アイドルマスター ミリオンライブ! シアターデイズ","2017-06-28T15:00:00.000Z","iOS、Android","","the idolm@ster million live! theater days"},{"アイドルマスター SideM LIVE ON ST@GE!","2017-08-29T15:00:00.000Z","iOS、Android","2021-08-30T15:00:00.000Z","the idolm@ster sidem live on st@ge!"},{"アイドルマスター ステラステージ","2017-12-20T15:00:00.000Z","PS4","","the idolm@ster stella stage"},{"アイドルマスター シャイニーカラーズ","2018-04-23T15:00:00.000Z","enza","","the idolm@ster shiny colors"},{"ミリシタ海外版아이돌 마스터 밀리언 라이브! 시어터 데이즈(韓国)","2019-08-29T15:00:00.000Z","iOS、Android","2022-01-28T04:00:00.000Z","mirishita overseas (korea)"},{"ミリシタ海外版偶像大師 百萬人演唱會！ 劇場時光(台湾,香港,マカオ)","2019-08-29T16:00:00.000Z","iOS、Android","2022-01-28T05:00:00.000Z","mirishita overseas (taiwan, hong kong, macau)"},{"アイドルマスター シンデレラガールズ スターライトスポット","2019-09-02T15:00:00.000Z","iOS、Android","","the idolm@ster cinderella girls star light spot"},{"アイドルマスター プロデューサー グリーティングキット","2021-01-07T15:00:00.000Z","iOS、Android","","the idolm@ster producer greeting kit"},{"アイドルマスター ポップリンクス","2021-01-20T15:00:00.000Z","iOS、Android","2022-07-20T15:00:00.000Z","the idolm@ster pop links"},{"アイドルマスター スターリットシーズン","2021-10-13T15:00:00.000Z","PS4、steam","","idolmaster starlit season"},{"アイドルマスター SideM　GROWING STARS","2021-10-05T15:00:00.000Z","iOS、Android","2023-07-31T04:59:00.000Z","the idolm@ster sidem growing stars"},{"アイドルマスター シャイニーカラーズ Song for Prism","2023-11-13T15:00:00.000Z","iOS、Android","","the idolm@ster shiny colors song for prism"},{"学園アイドルマスター","2024-05-15T15:00:00.000Z","iOS、Android","","school idol master"},{"アイドルマスター TOURS","--","アーケード","","the idolm@ster tours"}}
imasb='{"ml":[["2020-01-08T00:00:00+09:00","エミリー・スチュアート","えみりーすちゅわーと","emily swewart"],["2020-01-18T00:00:00+09:00","北沢志保","きたざわしほ","kitazawashiho"],["2020-01-21T00:00:00+09:00","四条貴音","しじょうたかね","shijotakane"],["2020-01-27T00:00:00+09:00","真壁瑞希","まかべみずき","makabemizuki"],["2020-02-04T00:00:00+09:00","徳川まつり","とくがわまつり","tokugawamatsuri"],["2020-02-12T00:00:00+09:00","横山奈緒","よこやまなお","yokoyamanao"],["2020-02-14T00:00:00+09:00","宮本フレデリカ","みやもとふれでりか","miyamotofrederic"],["2020-02-20T00:00:00+09:00","箱崎星梨花","はこざきせりか","hakozakiserika"],["2020-02-25T00:00:00+09:00","如月千早","きさらずちはや","kisarazuchihaya"],["2020-03-01T00:00:00+09:00","ロコ(伴田路子)","はんだろこ","handaroko"],["2020-03-07T00:00:00+09:00","水谷絵理","みずたにえり","mizutanieri"],["2020-03-18T00:00:00+09:00","七尾百合子","ななおゆりこ","nanaoyuriko"],["2020-03-22T00:00:00+09:00","佐竹美奈子","さたけみなこ","satakeminako"],["2020-03-25T00:00:00+09:00","高槻やよい","たかつきやよい","takatsukiyayoi"],["2020-03-27T00:00:00+09:00","桜守歌織","さくらもりかおり","sakuramorikaori"],["2020-03-30T00:00:00+09:00","福田のり子","ふくだのりこ","fukudanoriko"],["2020-04-03T00:00:00+09:00","天海春香","あまみはるか","amamiharuka"],["2020-04-15T00:00:00+09:00","所恵美","ところめぐみ","tokoromegumi"],["2020-04-24T00:00:00+09:00","宮尾美也","みやおみや","miyaomiya"],["2020-04-29T00:00:00+09:00","大神環","おおがみたまき","ogamitamaki"],["2020-05-05T00:00:00+09:00","水瀬伊織","みなせいおり","minaseiori"],["2020-05-17T00:00:00+09:00","北上麗花","きたかみれいか","kitakamireika"],["2020-05-22T00:00:00+09:00","双海亜美","ふたみあみ","futamiami"],["2020-05-22T00:00:00+09:00","双海真美","ふたみまみ","futamimami"],["2020-05-29T00:00:00+09:00","白石紬","しらいしつむぎ","shiraishitsumugi"],["2020-05-30T00:00:00+09:00","一ﾉ瀬志希","いちのせしき","ichinoseshiki"],["2020-05-31T00:00:00+09:00","望月杏奈","もちづきあんな","mochizukianna"],["2020-06-07T00:00:00+09:00","松田亜利沙","まつだありさ","matsudaarisa"],["2020-06-12T00:00:00+09:00","馬場このみ","ばばこのみ","babakonomi"],["2020-06-23T00:00:00+09:00","秋月律子","あきづきりつこ","akizukiritsuko"],["2020-06-25T00:00:00+09:00","日高愛","ひだかあい","hidakaai"],["2020-06-28T00:00:00+09:00","春日未来","かすがみらい","kasugamirai"],["2020-06-29T00:00:00+09:00","青羽美咲","あおばみさき","aobamisaki"],["2020-07-04T00:00:00+09:00","木下ひなた","きのしたひなた","kinoshitahinata"],["2020-07-06T00:00:00+09:00","高木順一朗","たかぎじゅんいちろう","takagijunichiro"],["2020-07-06T00:00:00+09:00","高木順二朗","たかぎじゅんじろう","takagijunjiro"],["2020-07-19T00:00:00+09:00","三浦あずさ","みうらあずさ","miuraazusa"],["2020-07-23T00:00:00+09:00","舞浜歩","まいはまあゆむ","maihamaayumu"],["2020-07-26T00:00:00+09:00","奥空心白","おくぞらこはく","okuzorakohaku"],["2020-07-30T00:00:00+09:00","伊吹翼","いぶきつばさ","ibukitsubasa"],["2020-08-10T00:00:00+09:00","高坂海美","こうさかうみ","kosakaumi"],["2020-08-18T00:00:00+09:00","矢吹可奈","やぶきかな","yabukikana"],["2020-08-27T00:00:00+09:00","篠宮可憐","しのみやかれん","shinomiyakaren"],["2020-08-29T00:00:00+09:00","菊地真","きくちまこと","kikuchimakoto"],["2020-09-02T00:00:00+09:00","豊川風花","とよかわふうか","toyokawafuka"],["2020-09-06T00:00:00+09:00","黒井崇男","くろいたかお","kuroitakao"],["2020-09-06T00:00:00+09:00","亜夜","あや","aya"],["2020-09-09T00:00:00+09:00","音無小鳥","おとなしことり","otonashikotori"],["2020-09-14T00:00:00+09:00","最上静香","もがみしずか","mogamishizuka"],["2020-09-15T00:00:00+09:00","秋月涼","あきづききりょう","akizukikiryo"],["2020-09-16T00:00:00+09:00","詩花","しいか","shiika"],["2020-09-20T00:00:00+09:00","永吉昴","ながよしすばる","nagayoshisubaru"],["2020-09-26T00:00:00+09:00","ジュリア","じゅりあ","julia"],["2020-10-05T00:00:00+09:00","田中琴葉","たなかことは","tanakakotoha"],["2020-10-10T00:00:00+09:00","我那覇響","がなはひびき","ganahahibiki"],["2020-10-21T00:00:00+09:00","二階堂千鶴","にかいどうちづる","nikaidochizuru"],["2020-10-26T00:00:00+09:00","島原エレナ","しまばらえれな","shimabaraelena"],["2020-11-06T00:00:00+09:00","周防桃子","すおうももこ","suomomoko"],["2020-11-11T00:00:00+09:00","天空橋朋花","てんくうばしともか","tenkubashitomoka"],["2020-11-21T00:00:00+09:00","百瀬莉緒","ももせりお","momoserio"],["2020-11-23T00:00:00+09:00","星井美希","ほしいみき","hoshiimiki"],["2020-12-03T00:00:00+09:00","野々原茜","ののはらあかね","nonoharaakane"],["2020-12-16T00:00:00+09:00","中谷育","なかたにいく","nakataniiku"],["2020-12-24T00:00:00+09:00","萩原雪歩","はぎわらゆきほ","hagiwarayukiho"],["2020-12-29T00:00:00+09:00","高山紗代子","たかやまさよこ","takayamasayoko"],["--","玲音","れおん","leon"],["--","早坂そら","はやさかそら","hayasakasora"],["--","高槻かすみ","たかつきかすみ","takatsukikasumi"],["--","ジョーイ・ロータス","じょーいろーたす","joey lotus"],["--","茜ちゃん","あかねちゃん","akanechan"],["--","シャルル・ドナテルロ18世(うさちゃん)","しゃるるどなてるろじゅうはちせい うさちゃん","charles donatello xviii"],["--","チュパカブラ","ちゅぱかぶら","chupakabura"],["--","北沢陸","きたざわりく","kitazawariku"]],"cg":[["2020-01-01T00:00:00+09:00","道明寺歌鈴","どうみょうじかりん","domyojikarin"],["2020-01-01T00:00:00+09:00","鷹富士茄子","たかふじかこ","takafujikako"],["2020-01-03T00:00:00+09:00","野々村そら","ののむらそら","nonomurasora"],["2020-01-03T00:00:00+09:00","村上巴","むらかみともえ","murakamitomoe"],["2020-01-06T00:00:00+09:00","三村かな子","みむらかなこ","mimurakanako"],["2020-01-06T00:00:00+09:00","安斎都","あんざいみやこ","anzaimiyako"],["2020-01-10T00:00:00+09:00","瀬名詩織","せなしおり","senashiori"],["2020-01-13T00:00:00+09:00","浜口あやめ","はまぐちあやめ","hamaguchiayame"],["2020-01-19T00:00:00+09:00","メアリー・コクラン","めありーこくらん","mary cochran"],["2020-01-21T00:00:00+09:00","福山舞","ふくやままい","fukuyamamai"],["2020-01-21T00:00:00+09:00","四条貴音","しじょうたかね","shijotakane"],["2020-01-21T00:00:00+09:00","松山久美子","まつやまくみこ","matsuyamakumiko"],["2020-01-23T00:00:00+09:00","西園寺琴歌","さいおんじことか","saionjikotoka"],["2020-01-28T00:00:00+09:00","太田優","おおたゆう","otayu"],["2020-02-03T00:00:00+09:00","二宮飛鳥","にのみやあすか","ninomiyaasuka"],["2020-02-04T00:00:00+09:00","白雪千夜","しらゆきちよ","shirayukichiyo"],["2020-02-06T00:00:00+09:00","江上椿","えがみつばき","egamitsubaki"],["2020-02-07T00:00:00+09:00","東郷あい","とうごうあい","togoai"],["2020-02-08T00:00:00+09:00","市原仁奈","いちはらにな","ichiharanina"],["2020-02-11T00:00:00+09:00","浅野風香","あさのふうか","asanofuka"],["2020-02-14T00:00:00+09:00","相原雪乃","あいはらゆきの","aiharayukino"],["2020-02-14T00:00:00+09:00","宮本フレデリカ","みやもとふれでりか","miyamotofrederica"],["2020-02-17T00:00:00+09:00","北川真尋","きたがわまひろ","kitagawamahiro"],["2020-02-19T00:00:00+09:00","遊佐こずえ","ゆさこずえ","yusakozue"],["2020-02-22T00:00:00+09:00","前川みく","まえかわみく","maekawamiku"],["2020-02-24T00:00:00+09:00","桐生つかさ","きりゅうつかさ","kiryutsukasa"],["2020-02-25T00:00:00+09:00","三船美優","みふねみゆ","mifunemiyu"],["2020-02-25T00:00:00+09:00","如月千早","きさらぎちはや","kisaragichihaya"],["2020-02-26T00:00:00+09:00","黒川千秋","くろかわちあき","kurokawachiaki"],["2020-03-03T00:00:00+09:00","今井加奈","いまいかな","imaikana"],["2020-03-05T00:00:00+09:00","小関麗奈","こせきれいな","kosekireina"],["2020-03-06T00:00:00+09:00","有浦柑奈","ありうらかんな","ariurakanna"],["2020-03-07T00:00:00+09:00","片桐早苗","かたぎりさなえ","katagirisanae"],["2020-03-07T00:00:00+09:00","水谷絵理","みずたにえり","mizutanieri"],["2020-03-09T00:00:00+09:00","工藤忍","くどうしのぶ","kudoshinobu"],["2020-03-10T00:00:00+09:00","ルーキートレーナー(青木慶)","るーきーとれーなー あおきけい","rookie aokikei"],["2020-03-12T00:00:00+09:00","ジュニー","じゅにー","junie"],["2020-03-13T00:00:00+09:00","堀裕子","ほりゆうこ","horiyuko"],["2020-03-16T00:00:00+09:00","柳瀬美由紀","やなせみゆき","yanasemiyuki"],["2020-03-18T00:00:00+09:00","衛藤美紗希","えとうみさき","etomisaki"],["2020-03-19T00:00:00+09:00","長富蓮実","ながとみはすみ","nagatomihasumi"],["2020-03-20T00:00:00+09:00","大西由里子","おおにしゆりこ","onishiyuriko"],["2020-03-21T00:00:00+09:00","松尾千鶴","まつおちづる","matsuochizuru"],["2020-03-22T00:00:00+09:00","星街すいせい","ほしまちすいせい","hoshimachisuisei"],["2020-03-23T00:00:00+09:00","中野有香","なかのゆか","nakanoyuka"],["2020-03-25T00:00:00+09:00","高槻やよい","たかつきやよい","takatsukiyayoi"],["2020-03-25T00:00:00+09:00","高峯のあ","たかみねのあ","takaminenoa"],["2020-03-27T00:00:00+09:00","村松さくら","むらまつさくら","muramatsusakura"],["2020-03-28T00:00:00+09:00","白坂小梅","しらさかこうめ","shirasakakome"],["2020-03-30T00:00:00+09:00","大沼くるみ","おおぬまくるみ","onumakurumi"],["2020-04-01T00:00:00+09:00","古賀小春","こがこはる","kogakoharu"],["2020-04-03T00:00:00+09:00","天海春香","あまみはるか","amamiharuka"],["2020-04-04T00:00:00+09:00","ヘレン","へれん","helen"],["2020-04-06T00:00:00+09:00","喜多日菜子","きたひなこ","kitahinako"],["2020-04-07T00:00:00+09:00","和久井留美","わくいるみ","wakuirumi"],["2020-04-08T00:00:00+09:00","櫻井桃華","さくらいももか","sakuraimomoka"],["2020-04-08T00:00:00+09:00","桐野アヤ","きりのあや","kirinoaya"],["2020-04-08T00:00:00+09:00","神崎蘭子","かんざきらんこ","kanzakiranko"],["2020-04-09T00:00:00+09:00","荒木比奈","あらきひな","arakihina"],["2020-04-10T00:00:00+09:00","上条春菜","かみじょうはるな","kamijoharuna"],["2020-04-12T00:00:00+09:00","大原みちる","おおはらみちる","oharamichiru"],["2020-04-14T00:00:00+09:00","赤城みりあ","あかぎみりあ","akagimiria"],["2020-04-15T00:00:00+09:00","相葉夕美","あいばゆみ","aibayumi"],["2020-04-18T00:00:00+09:00","財前時子","ざいぜんときこ","zaizentokiko"],["2020-04-19T00:00:00+09:00","白菊ほたる","しらぎくほたる","shiragikuhotaru"],["2020-04-24T00:00:00+09:00","島村卯月","しまむらうづき","shimamurauzuki"],["2020-04-27T00:00:00+09:00","水木聖來","みずきせいら","mizukiseira"],["2020-04-27T00:00:00+09:00","槙原志保","まきはらしほ","makiharashiho"],["2020-05-01T00:00:00+09:00","難波笑美","なんばえみ","nambaemi"],["2020-05-02T00:00:00+09:00","土屋亜子","つちやあこ","tsuchiyaako"],["2020-05-04T00:00:00+09:00","日下部若葉","くさかべわかば","kusakabewakaba"],["2020-05-05T00:00:00+09:00","水瀬伊織","みなせいおり","minaseiori"],["2020-05-06T00:00:00+09:00","沢田麻理菜","さわだまりな","sawadamarina"],["2020-05-07T00:00:00+09:00","大槻唯","おおつきゆい","otsukiyui"],["2020-05-08T00:00:00+09:00","高橋礼子","たかはしれいこ","takahashireiko"],["2020-05-08T00:00:00+09:00","吉岡沙紀","よしおかさき","yoshiokasaki"],["2020-05-09T00:00:00+09:00","早坂美玲","はやさかみれい","hayasakamirei"],["2020-05-12T00:00:00+09:00","柳清良","やなぎきよら","yanagikiyora"],["2020-05-15T00:00:00+09:00","安部菜々","あべなな","abenana"],["2020-05-18T00:00:00+09:00","古澤頼子","ふるさわよりこ","furusawayoriko"],["2020-05-21T00:00:00+09:00","ライラ","らいら","lyla"],["2020-05-22T00:00:00+09:00","双海亜美","ふたみあみ","futamiami"],["2020-05-22T00:00:00+09:00","双海真美","ふたみまみ","futamimami"],["2020-05-25T00:00:00+09:00","浜川愛結奈","はまかわあゆな","hamakawaayuna"],["2020-05-29T00:00:00+09:00","綾瀬穂乃香","あやせほのか","ayasehonoka"],["2020-05-30T00:00:00+09:00","一ﾉ瀬志希","いちのせしき","ichinoseshiki"],["2020-06-03T00:00:00+09:00","及川雫","おいかわしずく","oikawashizuku"],["2020-06-04T00:00:00+09:00","丹羽仁美","にわひとみ","niwahitomi"],["2020-06-06T00:00:00+09:00","星輝子","ほししょうこ","hoshishoko"],["2020-06-07T00:00:00+09:00","佐々木千枝","ささきちえ","sasakichie"],["2020-06-09T00:00:00+09:00","小室千奈美","こむろちなみ","komurochinami"],["2020-06-10T00:00:00+09:00","池袋晶葉","いけぶくろあきは","ikebukuroakiha"],["2020-06-10T00:00:00+09:00","トレーナー(青木明)","とれーなー あおきめい","trainer aokimei"],["2020-06-11T00:00:00+09:00","緒方智絵里","おがたちえり","ogatachieri"],["2020-06-12T00:00:00+09:00","奥山沙織","おくやまさおり","okuyamasaori"],["2020-06-14T00:00:00+09:00","高垣楓","たかがきかえで","takagakikaede"],["2020-06-15T00:00:00+09:00","藤原肇","ふじわらはじめ","fujiwarahajime"],["2020-06-16T00:00:00+09:00","久川颯","ひさかわはやて","hisakawahayate"],["2020-06-16T00:00:00+09:00","久川凪","ひさかわなぎ","hisakawanagi"],["2020-06-20T00:00:00+09:00","梅木音葉","うめきおとは","umekiotoha"],["2020-06-23T00:00:00+09:00","秋月律子","あきづきりつこ","akizukiritsuko"],["2020-06-25T00:00:00+09:00","三好紗南","みよしさな","miyoshisana"],["2020-06-25T00:00:00+09:00","日高愛","ひだかあい","hidakaai"],["2020-06-27T00:00:00+09:00","仙崎恵磨","せんざきえま","senzakiema"],["2020-06-29T00:00:00+09:00","ナターリア","なたーりあ","natalia"],["2020-06-30T00:00:00+09:00","多田李衣菜","ただりいな","tadariina"],["2020-07-01T00:00:00+09:00","藤居朋","ふじいとも","fujiitomo"],["2020-07-01T00:00:00+09:00","速水奏","はやみかなで","hayamikanade"],["2020-07-03T00:00:00+09:00","依田芳乃","よりたよしの","yoritayoshino"],["2020-07-07T00:00:00+09:00","赤西瑛梨華","あかにしえりか","akanishierika"],["2020-07-07T00:00:00+09:00","桃井あずき","ももいあずき","momoiazuki"],["2020-07-10T00:00:00+09:00","矢口美羽","やぐちみう","yaguchimiu"],["2020-07-13T00:00:00+09:00","氏家むつみ","うじいえむつみ","ujiiemutsumi"],["2020-07-16T00:00:00+09:00","岡崎泰葉","おかざきやすは","okazakiyasuha"],["2020-07-17T00:00:00+09:00","結城晴","ゆうきはる","yukiharu"],["2020-07-19T00:00:00+09:00","三浦あずさ","みうらあずさ","miuraazusa"],["2020-07-20T00:00:00+09:00","龍崎薫","りゅうざきかおる","ryuzakikaoru"],["2020-07-20T00:00:00+09:00","杉坂海","すぎさかうみ","sugisakaumi"],["2020-07-22T00:00:00+09:00","佐藤心","さとうしん","satoshin"],["2020-07-23T00:00:00+09:00","相馬夏美","そうまなつみ","somanatsumi"],["2020-07-25T00:00:00+09:00","高森藍子","たかもりあいこ","takamoriaiko"],["2020-07-27T00:00:00+09:00","新田美波","にったみなみ","nittaminami"],["2020-07-30T00:00:00+09:00","城ヶ崎莉嘉","じょうがさきりか","jogasakirika"],["2020-07-31T00:00:00+09:00","橘ありす","たちばなありす","tachibanaarisu"],["2020-08-01T00:00:00+09:00","棟方愛海","むなかたあつみ","munakataatsumi"],["2020-08-01T00:00:00+09:00","愛野渚","あいのなぎさ","ainonagisa"],["2020-08-02T00:00:00+09:00","イム・ユジン","いむゆじん","imuyujin"],["2020-08-03T00:00:00+09:00","海老原菜帆","えびはらなほ","ebiharanaho"],["2020-08-04T00:00:00+09:00","日野茜","ひのあかね","hinoakane"],["2020-08-07T00:00:00+09:00","向井拓海","むかいたくみ","mukaitakumi"],["2020-08-08T00:00:00+09:00","木場真奈美","きばまなみ","kibamanami"],["2020-08-10T00:00:00+09:00","五十嵐響子","いがらしきょうこ","igarashikyoko"],["2020-08-10T00:00:00+09:00","渋谷凛","しぶやりん","shibuyarin"],["2020-08-15T00:00:00+09:00","ケイト","けいと","kate"],["2020-08-17T00:00:00+09:00","関裕美","せきひろみ","sekihiromi"],["2020-08-17T00:00:00+09:00","西島櫂","にしじまかい","nishijimakai"],["2020-08-18T00:00:00+09:00","首藤葵","しゅとうあおい","shutoaoi"],["2020-08-19T00:00:00+09:00","木村夏樹","きむらなつき","kimuranatsuki"],["2020-08-24T00:00:00+09:00","持田亜里沙","もちだありさ","mochidaarisa"],["2020-08-26T00:00:00+09:00","クラリス","くらりす","clarice"],["2020-08-27T00:00:00+09:00","井村雪菜","いむらせつな","imurasetsuna"],["2020-08-27T00:00:00+09:00","榊原里美","さかきばらさとみ","sakakibarasatomi"],["2020-08-27T00:00:00+09:00","森久保乃々","もりくぼのの","morikubonono"],["2020-08-28T00:00:00+09:00","涼宮星花","すずみやせいか","suzumiyaseika"],["2020-08-29T00:00:00+09:00","菊地真","きくちまこと","kikuchimakoto"],["2020-08-30T00:00:00+09:00","若林智香","わかばやしともか","wakabayashitomoka"],["2020-09-01T00:00:00+09:00","松本沙理奈","まつもとさりな","matsumotosarina"],["2020-09-01T00:00:00+09:00","諸星きらり","もろぼしきらり","moroboshikirari"],["2020-09-02T00:00:00+09:00","双葉杏","ふたばあんず","futabaanzu"],["2020-09-05T00:00:00+09:00","北条加蓮","ほうじょうかれん","hojokaren"],["2020-09-07T00:00:00+09:00","佐久間まゆ","さくままゆ","sakumamayu"],["2020-09-09T00:00:00+09:00","栗原ネネ","くりはらねね","kuriharanene"],["2020-09-10T00:00:00+09:00","ベテラントレーナー(青木聖）","べてらんとれーなー あおきせい","veterantrainer aokisei"],["2020-09-12T00:00:00+09:00","夢見りあむ","ゆめみりあむ","yumemiriamu"],["2020-09-13T00:00:00+09:00","南条光","なんじょうひかる","nanjohikaru"],["2020-09-14T00:00:00+09:00","姫川友紀","ひめかわゆき","himekawayuki"],["2020-09-15T00:00:00+09:00","秋月涼","あきづきりょう","akizukiryo"],["2020-09-16T00:00:00+09:00","神谷奈緒","かみやなお","kamiyanao"],["2020-09-19T00:00:00+09:00","アナスタシア","あなすたしあ","anastasia"],["2020-09-19T00:00:00+09:00","キャシー・グラハム","きゃしーぐらはむ","kathygraham"],["2020-09-20T00:00:00+09:00","脇山珠美","わきやまたまみ","wakiyamatamami"],["2020-09-24T00:00:00+09:00","伊集院惠","いじゅういんめぐみ","ijuimmegumi"],["2020-09-26T00:00:00+09:00","冴島清美","さえじまきよみ","saejimakiyomi"],["2020-09-28T00:00:00+09:00","佐城雪美","さじょうゆきみ","sajoyukimi"],["2020-09-29T00:00:00+09:00","楊菲菲","やおふぇいふぇい","yaofueifuei"],["2020-10-01T00:00:00+09:00","松永涼","まつながりょう","matsunagaryo"],["2020-10-03T00:00:00+09:00","兵藤ﾚﾅ","ひょうどうれな","hyodorena"],["2020-10-06T00:00:00+09:00","乙倉悠貴","おとくらゆうき","otokurayuki"],["2020-10-07T00:00:00+09:00","砂塚あきら","すなづかあきら","sunazukaakira"],["2020-10-09T00:00:00+09:00","浅利七海","あさりななみ","asarinanami"],["2020-10-10T00:00:00+09:00","椎名法子","しいなのりこ","shiinanoriko"],["2020-10-10T00:00:00+09:00","我那覇響","がなはひびき","ganahahibiki"],["2020-10-11T00:00:00+09:00","服部瞳子","はっとりとうこ","hattoritoko"],["2020-10-14T00:00:00+09:00","藤本里奈","ふじもとりな","fujimotorina"],["2020-10-14T00:00:00+09:00","並木芽衣子","なみきめいこ","namikimeiko"],["2020-10-18T00:00:00+09:00","水本ゆかり","みずもとゆかり","mizumotoyukari"],["2020-10-18T00:00:00+09:00","小早川紗枝","こばやかわさえ","kobayakawasae"],["2020-10-23T00:00:00+09:00","西川保奈美","にしかわほなみ","nishikawahonami"],["2020-10-24T00:00:00+09:00","桜井夢子","さくらいゆめこ","sakuraiyumeko"],["2020-10-26T00:00:00+09:00","上田鈴帆","うえだすずほ","uedasuzuho"],["2020-10-27T00:00:00+09:00","鷺沢文香","さぎさわふみか","sagisawafumika"],["2020-10-30T00:00:00+09:00","月宮雅","つきみやみやび","tsukimiyamiyabi"],["2020-11-03T00:00:00+09:00","成宮由愛","なるみやゆめ","narumiyayume"],["2020-11-05T00:00:00+09:00","辻野あかり","つじのあかり","tsujinoakari"],["2020-11-06T00:00:00+09:00","間中美里","まなかみさと","manakamisato"],["2020-11-07T00:00:00+09:00","八神マキノ","やがみまきの","yagamimakino"],["2020-11-09T00:00:00+09:00","リュ・ヘナ","りゅへな","ryuhena"],["2020-11-10T00:00:00+09:00","黒埼ちとせ","くろさきちとせ","kurosakichitose"],["2020-11-11T00:00:00+09:00","相川千夏","あいかわちなつ","aikawachinatsu"],["2020-11-11T00:00:00+09:00","大石泉","おおいしいずみ","oishiizumi"],["2020-11-12T00:00:00+09:00","城ヶ崎美嘉","じょうがさきみか","jogasakimika"],["2020-11-13T00:00:00+09:00","岸部彩華","きしべあやか","kishibeayaka"],["2020-11-14T00:00:00+09:00","原田美世","はらだみよ","haradamiyo"],["2020-11-17T00:00:00+09:00","小松伊吹","こまついぶき","komatsuibuki"],["2020-11-19T00:00:00+09:00","的場梨沙","まとばりさ","matobarisa"],["2020-11-22T00:00:00+09:00","篠原礼","しのはられい","shinohararei"],["2020-11-23T00:00:00+09:00","星井美希","ほしいみき","hoshiimiki"],["2020-11-25T00:00:00+09:00","輿水幸子","こしみずさちこ","koshimizusachiko"],["2020-11-25T00:00:00+09:00","川島瑞樹","かわしまみずき","kawashimamizuki"],["2020-11-28T00:00:00+09:00","千川ちひろ","せんかわちひろ","senkawachihiro"],["2020-12-01T00:00:00+09:00","本田未央","ほんだみお","hondamio"],["2020-12-02T00:00:00+09:00","喜多見柚","きたみゆず","kitamiyuzu"],["2020-12-05T00:00:00+09:00","水野翠","みずのみどり","mizunomidori"],["2020-12-08T00:00:00+09:00","十時愛梨","とときあいり","totokiairi"],["2020-12-10T00:00:00+09:00","マスタートレーナー(青木麗)","ますたーとれーなー あおきれい","mastertrainer aokirei"],["2020-12-12T00:00:00+09:00","塩見周子","しおみしゅうこ","shiomishuko"],["2020-12-14T00:00:00+09:00","サイネリア(鈴木彩音)","さいねりあ　すずきあやね","cineraria suzukiayane"],["2020-12-16T00:00:00+09:00","小日向美穂","こひなたみほ","kohinatamiho"],["2020-12-16T00:00:00+09:00","大和亜季","やまとあき","yamatoaki"],["2020-12-18T00:00:00+09:00","横山千佳","よこやまちか","yokoyamachika"],["2020-12-24T00:00:00+09:00","萩原雪歩","はぎわらゆきほ","hagiwarayukiho"],["2020-12-24T00:00:00+09:00","イヴ・サンタクロース","いぶさんたくろーす","evesantaclaus"],["2020-12-25T00:00:00+09:00","柊志乃","ひいらぎしの","hiiragishino"],["2020-12-25T00:00:00+09:00","望月聖","もちづきひじり","mochizukihijiri"],["2020-12-28T00:00:00+09:00","松原早耶","まつばらさや","matsubarasaya"],["2020-12-29T00:00:00+09:00","斉藤洋子","さいとうようこ","saitoyoko"],["2020-12-29T00:00:00+09:00","真鍋いつき","まなべいつき","manabeitsuki"],["--","ぴにゃこら太","ぴにゃこらた","pinyakorata"]],"sm":[["2020-01-02T00:00:00+09:00","冬美旬","ふゆみじゅん","fuyumijun"],["2020-01-08T00:00:00+09:00","猪狩礼生","いがりれお","igarireo"],["2020-01-13T00:00:00+09:00","硲道夫","はざまみちお","hazamamichio"],["2020-01-17T00:00:00+09:00","神谷幸広","かみやゆきひろ","kamiyayukihiro"],["2020-02-02T00:00:00+09:00","鷹城恭二","たかじょうきょうじ","takajokyoji"],["2020-02-10T00:00:00+09:00","姫野かのん","ひめのかのん","himenokanon"],["2020-02-14T00:00:00+09:00","伊集院北斗","いじゅういんほくと","ijuinhokuto"],["2020-02-22T00:00:00+09:00","風間忍","かざましのぶ","kazamashinobu"],["2020-02-23T00:00:00+09:00","天道輝","てんどうてる","tendoteru"],["2020-03-03T00:00:00+09:00","天ヶ瀬冬馬","あまがせとうま","amagasetoma"],["2020-03-07T00:00:00+09:00","握野英雄","あくのひでお","akunohideo"],["2020-03-22T00:00:00+09:00","渡辺みのり","わたなべみのり","watanabeminori"],["2020-03-25T00:00:00+09:00","岡村直央","おかむらなお","okamuranao"],["2020-03-30T00:00:00+09:00","若里春名","わかざとはるな","wakazatoharuna"],["2020-04-02T00:00:00+09:00","都築圭","つづきけい","tsuzukikei"],["2020-04-04T00:00:00+09:00","紅井朱雀","あかいすざく","akaisuzaku"],["2020-04-12T00:00:00+09:00","伊瀬谷四季","いせやしき","iseyashiki"],["2020-04-20T00:00:00+09:00","御手洗翔太","みたらいしょうた","mitaraishota"],["2020-04-22T00:00:00+09:00","橘志狼","たちばなしろう","tachibanashiro"],["2020-05-05T00:00:00+09:00","木村龍","きむらりゅう","kimuraryu"],["2020-05-14T00:00:00+09:00","牙崎漣","きざきれん","kizakiren"],["2020-05-20T00:00:00+09:00","兜大吾","かぶとだいご","kabutodaigo"],["2020-05-23T00:00:00+09:00","眉見 鋭心","まゆみえいしん","mayumieishin"],["2020-06-02T00:00:00+09:00","柏木翼","かしわぎつばさ","kashiwagitsubasa"],["2020-06-13T00:00:00+09:00","美作武史","みまさかたけし","mimasakatakeshi"],["2020-06-17T00:00:00+09:00","神楽麗","かぐられい","kagurarei"],["2020-06-18T00:00:00+09:00","榊夏来","さかきなつき","sakakinatsuki"],["2020-06-30T00:00:00+09:00","花園 百々人","はなぞのももひと","hanazonomomohito"],["2020-07-02T00:00:00+09:00","山村賢","やまむらけん","yamamuraken"],["2020-07-03T00:00:00+09:00","清澄九郎","きよすみくろう","kiyosumikuro"],["2020-07-07T00:00:00+09:00","蒼井享介","あおいきょうすけ","aoikyosuke"],["2020-07-07T00:00:00+09:00","蒼井悠介","あおいゆうすけ","aoiyusuke"],["2020-07-22T00:00:00+09:00","黒野玄武","くろのげんぶ","kuronogembu"],["2020-08-01T00:00:00+09:00","ピエール","ぴえーる","pierre"],["2020-08-08T00:00:00+09:00","舞田類","まいたるい","maitarui"],["2020-08-19T00:00:00+09:00","水嶋咲","みずしまさき","mizushimasaki"],["2020-08-24T00:00:00+09:00","華村翔真","はなむらしょうま","hanamurashoma"],["2020-09-01T00:00:00+09:00","山下次郎","やましたじろう","yamashitajiro"],["2020-09-14T00:00:00+09:00","円城寺道流","えんじょうじみちる","enjojimichiru"],["2020-09-15T00:00:00+09:00","秋月涼","あきづきりょう","akizukiryo"],["2020-09-24T00:00:00+09:00","桜庭薫","さくらばかおる","sakurabakaoru"],["2020-10-08T00:00:00+09:00","三条悟朗","さんじょうごろう","sanjogoro"],["2020-10-09T00:00:00+09:00","アスラン＝BBII世","あすらん・べるぜびゅーと・にせい","asuran・beruzebyuto・nisei"],["2020-10-11T00:00:00+09:00","古論クリス","ころんくりす","koronkurisu"],["2020-10-13T00:00:00+09:00","九十九一希","つくもかずき","tsukumokazuki"],["2020-10-31T00:00:00+09:00","葛之葉雨彦","くずのはあめひこ","kuzunohaamehiko"],["2020-11-02T00:00:00+09:00","安堂鞠王","あんどうまりお","andomario"],["2020-11-08T00:00:00+09:00","東雲荘一郎","しののめそういちろう","shinonomesoichiro"],["2020-11-12T00:00:00+09:00","猫柳キリオ","ねこやなぎきりお","nekoyanagikirio"],["2020-11-22T00:00:00+09:00","秋山隼人","あきやまはやと","akiyamahayato"],["2020-11-28T00:00:00+09:00","北村想楽","きたむらそら","kitamurasora"],["2020-12-01T00:00:00+09:00","天峰秀","あまみねしゅう","amamineshu"],["2020-12-12T00:00:00+09:00","卯月巻緒","うづきまきお","uzukimakio"],["2020-12-18T00:00:00+09:00","白石瑛流","しらいしえる","shiraishieru"],["2020-12-21T00:00:00+09:00","大河タケル","たいがたける","taigatakeru"],["2020-12-24T00:00:00+09:00","信玄誠司","しんげんせいじ","shingenseiji"],["--","齋藤孝司","さいとうたかし","saitotakashi"],["--","カエール","かえーる","kaeru"]],"sc":[["2020-01-04T00:00:00+09:00","芹沢あさひ","せりざわあさひ","serizawaasahi"],["2020-01-16T00:00:00+09:00","三峰結華","みつみねゆいか","mitsumineyuika"],["2020-01-31T00:00:00+09:00","斑鳩 ルカ","いかるが るか","ikaruga ruka"],["2020-02-03T00:00:00+09:00","七草はづき","ななくさはづき","nanakusahazuki"],["2020-02-24T00:00:00+09:00","園田智代子","そのだちよこ","sonodachiyoko"],["2020-02-25T00:00:00+09:00","月岡恋鐘","つきおかこがね","tsukiokakogane"],["2020-03-04T00:00:00+09:00","風野灯織","もりのりんぜ","morinorinze"],["2020-03-17T00:00:00+09:00","市川雛菜","いちかわひなな","ichikawahinana"],["2020-04-05T00:00:00+09:00","郁田 はるき","いくた はるき","ikuta haruki"],["2020-04-18T00:00:00+09:00","桑山千雪","くわやまちゆき","kuwayamachiyuki"],["2020-04-25T00:00:00+09:00","櫻木真乃","さくらぎまの","sakuragimano"],["2020-05-04T00:00:00+09:00","浅倉透","あさくらとおる","asakuratoru"],["2020-05-24T00:00:00+09:00","田中摩美々","まゆずみふゆこ","mayuzumifuyuko"],["2020-06-27T00:00:00+09:00","白瀬咲耶","しらせさくや","shirasesakuya"],["2020-07-22T00:00:00+09:00","八宮めぐる","はちみやめぐる","hachimiyameguru"],["2020-07-26T00:00:00+09:00","七草にちか","ななくさにちか","nanakusanichika"],["2020-07-29T00:00:00+09:00","小宮果穂","こみやかほ","komiyakaho"],["2020-08-02T00:00:00+09:00","和泉愛依","いずみめい","izumimei"],["2020-08-16T00:00:00+09:00","有栖川夏葉","ありすがわなつは","arisugawanatsuha"],["2020-09-08T00:00:00+09:00","緋田美琴","あけたみこと","aketamikoto"],["2020-09-23T00:00:00+09:00","幽谷霧子","しらせさくや","shirasesakuya"],["2020-10-02T00:00:00+09:00","鈴木 羽那","すずき はな","suzuki hana"],["2020-10-19T00:00:00+09:00","杜野凛世","もりのりんぜ","morinorinze"],["2020-10-27T00:00:00+09:00","樋口円香","ひぐちまどか","higuchimadoka"],["2020-11-11T00:00:00+09:00","福丸小糸","ふくまるこいと","fukumarukoito"],["2020-11-26T00:00:00+09:00","西城樹里","さいじょうじゅり","saijojuri"],["2020-12-04T00:00:00+09:00","黛冬優子","まゆずみふゆこ","mayuzumifuyuko"],["2020-12-25T00:00:00+09:00","大崎甘奈","おおさきあまな","osakiamana"],["2020-12-25T00:00:00+09:00","大崎甜花","おおさきてんか","osakitenka"],["--","天井努","あまいつとむ","amaitsutomu"]],"ds":[["2020-03-07T00:00:00+09:00","水谷絵理","みずたにえり","mizutanieri"],["2020-06-25T00:00:00+09:00","日高愛","ひだかあい","hidakaai"],["2020-09-15T00:00:00+09:00","秋月涼","あきづききりょう","akidukikiryō"],["2020-10-24T00:00:00+09:00","桜井夢子","さくらいゆめこ","sakuraiyumeko"],["2020-12-14T00:00:00+09:00","サイネリア(鈴木彩音)","さいねりあ　すずきあやね","cineraria suzukiayane"],["--","石川実","いしかわ みのり","isikawa minori"],["--","岡本まなみ","おかもと まなみ","okamoto manami"],["--","尾崎玲子","おざき れいこ","ozaki reiko"],["--","日高舞","ひだかまい","hidakamai"],["--","武田蒼一","たけだそういち","takedasōiti"],["--","五十嵐局長","いがらしきょくちょう","igarasikyokutyō"]],"ga":[["2020-01-18T00:00:00+09:00","有村 麻央","ありむらまお","arimuramao"],["2020-03-05T00:00:00+09:00","姫崎 莉波","ひめさきりなみ","himesakirinami"],["2020-04-02T00:00:00+09:00","花海 咲季","はなみさき","hanamisaki"],["2020-04-29T00:00:00+09:00","藤田 ことね","ふじたことね","fujitakotone"],["2020-06-03T00:00:00+09:00","月村 手毬","つきむらてまり","tsukimuratemari"],["2020-07-24T00:00:00+09:00","葛城 リーリヤ","かつらぎりーりあ","katsuralilja"],["2020-08-01T00:00:00+09:00","倉本 千奈","くらもとちな","kuramotochina"],["2020-11-11T00:00:00+09:00","紫雲 清夏","しうんすみか","shiunsumika"],["2020-12-21T00:00:00+09:00","篠澤 広","しのさわひろ","shinosawahiro"],["--","根緒 亜紗里","ねおあさり","neoasari"],["--","十王 邦夫","じゅうおうくにお","juokunio"],["--","秦谷 美鈴","はたやみすず","hatayamisuzu"],["--","十王 星南","じゅうおうせな","juosena"],["--","花海 佑芽","はなみうめ","hanamiume"]]}'
imassel={"cg","ml","sm","sc","ds","ga"}
imasname={"シンデレラ","ミリオン","サイドM","シャニマス","ディアリースターズ","学園アイマス"}

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
	if(dt=="Invalid date")then
	return dt
	end
	local t=parse_json_date_utc(dt) -os.time() 
	return  t
end

function elasped(dt) 
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

function JSTday()
return os.date('!%d',os.time()+3600*9)
end


function parse_json_date_utc(json_date) --ISO8601datetimeparse パーサー完成版？
    local pattern = "(%d+)%-(%d+)%-(%d+)%a(%d+)%:(%d+)%:([%d+.]+)([Z%+%-])(%d?%d?):?(%d?%d?)"

    if(json_date:match("U$")) then --try parse UTC FIX
    local normal = "(%d+)[%-%/](%d+)[%-%/](%d+) +(%d+)%:(%d+)U$"--ローカル時間MD+HM
        if(json_date:match(normal))then
        local year, month, day, hour, minute,
        seconds = json_date:match(normal)
        json_date = year.."-"..month.."-"..day.."T"..hour..":"..minute..":00".. get_tzoffset(utc*3600)
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
        seconds, offsetsign, offsethour, offsetmin =json_date:match(pattern)
    
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
  return s == nil or s == '' or  s == '--'
end

function JPday(date,t)
  
  local dt = os.date("*t",t)
  if (get_timezone_the_day() == 9*3600) then --動作は日本時間のときだけ
  	date= string.gsub(date, "%%Vr",(dt.year-2018))  --R%Vr/%Y/%m/%d(%Vw)%X
  	date= string.gsub(date, "%%Vh",(dt.year-1988))  --H%Vr/%Y/%m/%d(%Vw)%X
  	date= string.gsub(date, "%%Vs",(dt.year-1925))  --S%Vr/%Y/%m/%d(%Vw)%X
  	date= string.gsub(date, "%%Vt",(dt.year-1911))  --T%Vr/%Y/%m/%d(%Vw)%X
  end
  
  --DateUTC(2020,2,31,20,48,0,0)
  date= string.gsub(date, "%%EM",daystring)  ----フリーズ文字代替
  date= string.gsub(date, "%%E",debugtxt1)  ----フリーズ文字代替
  date= string.gsub(date, "%%J",debugtxt2)  ----フリーズ文字代替
  date= string.gsub(date, "%%K",debugtxt3)  ----フリーズ文字代替
  --date= string.gsub(date, "%%K",debugtxt4)  ----フリーズ文字代替
  date= string.gsub(date, "%%s",os.time())  ----フリーズ文字代替
  date= string.gsub(date, "%%DST",isDST("J"))
  date= string.gsub(date, "%%Vw",local_day[tonumber(os.date("%w",t))+1])
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
  
   --if(os.date("!%H%M",t)=="1500")then --0時のとき切り替え
  if(daychange ~= JSTday())then
  findday()
  end
  
  if (string.find(date,"%%i")) then
  
  
   local inum = (ima)%(#imas+1)    --imas[1] AC,dre 18 ,miri 22
   if(inum==0)then
   inum =1
   end  	

   local imasname =imas[inum][1] .."("..imas[inum][3]..")"
   local imasnamee =imas[inum][5] .."("..imas[inum][3]..")"
   local tu = elasped(imas[inum][2])
   local gm = "開始から" 
  
	local dateu='!%m%d'       --(%a)%X(UTC+09:00)'
	local nst =os.date(dateu,os.time()+9*3600)
	local tt = parse_json_date_utc(imas[inum][2])+9*3600
	local ist =os.date(dateu,tt)
	local nenme =""
	if(nst==ist)then
	local years    = math.floor(tu*10/(864000*365))
	nenme = ","..years.."周年"
	end
   local ep=get_ep(tu)
  	date =string.gsub(date, "%%is",gm..ep ..nenme)
  
   local theyear=string.format("%04d",tonumber(os.date("!%Y",os.time()+9*3600)))
   local dt = theyear .. "-".. string.format("%02d",tonumber(os.date('!%m',tt))).."-".. string.format("%02d",tonumber(os.date('!%d',tt))).."T"..string.format("%02d",tonumber(os.date('!%H',tt))) ..":00:00+09:00"
 
    debugtxt3=dt
    
  local gm = "周年" 
  local aniv= lefttime(dt)
  if(aniv<0) then
  aniv =-aniv
  gm = gm.."から"
  else
  gm = gm.."まで"
  end
  local ep= string.gsub(get_ep(aniv),"0年","")
  	date =string.gsub(date, "%%it",gm..ep)
  	
  local idn=imasb[imassel[imass]][useidol][2]
  local idne=imasb[imassel[imass]][useidol][3]
  local idnh=imasb[imassel[imass]][useidol][4]
  local dt=imasb[imassel[imass]][useidol][1]
  if(dt=="" or dt == nil or dt =="--")then
  	date =string.gsub(date, "%%ine",idne)
  	date =string.gsub(date, "%%inh",idnh)
  	date =string.gsub(date, "%%in",idn)
  	date =string.gsub(date, "%%ib","誕生日は不明です")
  	date =string.gsub(date, "%%ic","")
  else
  dt=string.gsub(dt,"2020",theyear)
  
  local aniv=  lefttime(dt)
  local gm = "誕生日" 
  if(aniv<0) then
  aniv =-aniv
  gm = gm.."から"
  else
  gm = gm.."まで"
  end
  local ep= string.gsub(get_ep(aniv),"0年","")
  	date =string.gsub(date, "%%ine",idne)
  	date =string.gsub(date, "%%inh",idnh)
  	date =string.gsub(date, "%%in",idn)
  	date =string.gsub(date, "%%ib",JST(dt))
  	date =string.gsub(date, "%%ic",gm..ep)
  end
  	
  	local imm=imas[inum][4]
  	debugtxt2=JST(imas[inum][2])  --開始日
  	debugtxt1=""
  	
  	--debugtxt1=imasb["sc"][1][2]
  	--debugtxt2=imasb["ml"][1][2]
    --debugtxt3=imasb["cg"][1][2]
  	
  	if(isempty(imm)==false) then
  	debugtxt1= JST(imm) --差終わり日
    tu= elasped(imas[inum][4])
  	
   local ep=get_ep(tu)
  	date =string.gsub(date, "%%ie","サ終から"..ep )
  	end
  	date =string.gsub(date, "%%ie","")
  	date =string.gsub(date, "%%ii",imasnamee)
  	date =string.gsub(date, "%%i",imasname)
  end
  
  
  if (string.find(date,"%%UTC")) then
  local tu = os.time()  + (tonumber(utc)*3600)
  
  local u= get_tzoffset_sepa(utc*3600)
    local dateu='!%Y/%m/%d(%a)%X(UTC'..u..')' --%z系はOS依存のため使用不可
   
    --local dt = os.date("!*t",tu) --%Vwを使いたいとき utcの時間で曜日を取得する必要がある
	--dateu= string.gsub(dateu, "%%Vw",local_day[dt.wday])
	
	--%w用
    --local getd = os.date("!%w",tu) --%Vwを使いたいとき utcの時間で曜日を取得する必要がある
	--dateu= string.gsub(dateu, "%%Vw",local_day[tonumber(getd)+1])
	
  	dateu=JPday(dateu,tu)
  	datestring = os.date(dateu,tu)
  	date =string.gsub(date, "%%UTC",datestring)
  end
  if (string.find(date,"%%JST")) then
  local dateu='!%Y/%m/%dT%X(GMT+9:00,JST,日本時間) %a' --%z系はOS依存のため使用不可
  
  	datestring = os.date(dateu, t+9*3600)
  	date =string.gsub(date, "%%JST",datestring)
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
			source_id = obs.obs_source_get_unversioned_id(source)
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name(source)
				obs.obs_property_list_add_string(p, name, name)
			end
		end
	end
	obs.source_list_release(sources)

	obs.obs_properties_add_text(props, "format_string", "Format String", obs.OBS_TEXT_MULTILINE)
	obs.obs_properties_add_float(props, "UTC", "WorldTime UTC-14～+14(%UTC)", -14, 14, 1)
	local list = obs.obs_properties_add_list(props, "im", "アイマスゲーム名", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING)
		for _, img in ipairs(imas) do
		 if(img[2] ~= "--") then
		obs.obs_property_list_add_string(list, img[1].." "..img[3], img[1].." "..img[3])
		end
	end
	
	obs.obs_properties_add_int(props, "IMSERIES", "誕生日アイマスシリーズ", 1, 6, 1)
	
	for i=1,#imassel do
	local dre = obs.obs_properties_add_list(props,  imassel[i], i.."."..imasname[i], obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
		for _, img in ipairs(imasb[imassel[i]]) do
		obs.obs_property_list_add_string(dre, img[2],  img[2])
		end
	end
	obs.obs_properties_add_int(props, "DAYLIM", "誕生日何日以内全部", 0, 30, 1)
	return props
end

-- A function named script_description returns the description shown to
-- the user
function script_description()
	return "Sets a text source to act as a date/time text when the source is active.\n\nMade by Ragowit"
end

function findidol(sel,s)

local stlen=tonumber(#imas)

if(sel=="im")then
for i=1,stlen do
if((imas[i][1].." "..imas[i][3])==(s))then
return i
end
end
return 1
end

local st=imasb[sel]
stlen=tonumber(#st)

if(sel=="ml")then
for i=1,stlen do
if((imasb["ml"][i][2]..imasb["ml"][i][3]..imasb["ml"][i][4]):match(s))then
return i
end
end
end

if(sel=="cg")then
for i=1,stlen do
if((imasb["cg"][i][2]..imasb["cg"][i][3]..imasb["cg"][i][4]):match(s))then
return i
end
end
end

if(sel=="sm")then
for i=1,stlen do
if((imasb["sm"][i][2]..imasb["sm"][i][3]..imasb["sm"][i][4]):match(s))then
return i
end
end
end

if(sel=="sc")then
for i=1,stlen do
if((imasb["sc"][i][2]..imasb["sc"][i][3]..imasb["sc"][i][4]):match(s))then
return i
end
end
end

if(sel=="ds")then
for i=1,stlen do
if((imasb["ds"][i][2]..imasb["ds"][i][3]..imasb["ds"][i][4]):match(s))then
return i
end
end
end

if(sel=="ga")then
for i=1,stlen do
if((imasb["ga"][i][2]..imasb["ga"][i][3]..imasb["ga"][i][4]):match(s))then
return i
end
end
end

	return 1
end

function MMDD(dt)
return os.date("!%m/%d",parse_json_date_utc(dt)+9*3600)
end

function findday()
daystring =""
local birthst={}
local daycalc=tonumber(daylim)
local stlen=tonumber(#imas)
--1={{"THE IDOLM@STER","2005-07-25T15:00:00.000Z","アーケード",""
local theyear=os.date("!%Y",os.time()+9*3600)
local theyearn=theyear*1+1

debugtxt1=string.gsub(imas[15][2], "^(%d+)",theyear)

for i=1,stlen do
local birth=imas[i][2]
if(birth:match("([Z%+])(%d?%d?):?(%d?%d?)$")) then
local tmp=string.gsub(imas[i][2], "^(%d+)",theyear)
local tmp2=string.gsub(imas[i][2], "^(%d+)",theyearn)
local t=lefttime(tmp)
local tt=lefttime(tmp2)
local name=imas[i][1] .."("..imas[i][3]..")"
local namen=imas[i][1] ..imas[i][2]
t=math.ceil(t/3600/24);
tt=math.ceil(tt/3600/24);
if((t>=0 and t<=daycalc) or (tt>=0 and tt<=daycalc))then
tmp =MMDD(birth).." あと".. math.abs(t).."日 "
if(t<0)then
tmp =MMDD(birth).." あと".. math.abs(tt).."日 "
end
tmp = tmp .. name.."\r\n"
birthst[namen]=tmp
end
end
end

--ml":[["2020-01-07T15:00:00.000Z","エミリー・スチュアート","えみりーすちゅわーと"
stlen=tonumber(#imasb["ml"])
for i=1,stlen do
local birth=imasb["ml"][i][1]
local idol=imasb["ml"][i][2]
if(birth:match("([Z%+])(%d?%d?):?(%d?%d?)$")) then
local tmp=string.gsub(birth, "^(%d+)",theyear)
local tmp2=string.gsub(birth, "^(%d+)",theyearn)
local t=lefttime(tmp)
local tt=lefttime(tmp2)
t=math.ceil(t/3600/24);
tt=math.ceil(tt/3600/24);
if((t>=0 and t<=daycalc) or (tt>=0 and tt<=daycalc))then
tmp =MMDD(birth).." あと".. math.abs(t).."日 "
if(t<0)then
tmp =MMDD(birth).." あと".. math.abs(tt).."日 "
end
tmp = tmp .. idol.."\r\n"
birthst[idol]=tmp
end
end
end

stlen=tonumber(#imasb["cg"])
for i=1,stlen do
local birth=imasb["cg"][i][1]
local idol=imasb["cg"][i][2]
if(birth:match("([Z%+])(%d?%d?):?(%d?%d?)$")) then
local tmp=string.gsub(birth, "^(%d+)",theyear)
local tmp2=string.gsub(birth, "^(%d+)",theyearn)
local t=lefttime(tmp)
local tt=lefttime(tmp2)
t=math.ceil(t/3600/24);
tt=math.ceil(tt/3600/24);
if((t>=0 and t<=daycalc) or (tt>=0 and tt<=daycalc))then
tmp =MMDD(birth).." あと".. math.abs(t).."日 "
if(t<0)then
tmp =MMDD(birth).." あと".. math.abs(tt).."日 "
end
tmp = tmp .. idol.."\r\n"
birthst[idol]=tmp
end
end
end

stlen=tonumber(#imasb["sm"])
for i=1,stlen do
local birth=imasb["sm"][i][1]
local idol=imasb["sm"][i][2]
if(birth:match("([Z%+])(%d?%d?):?(%d?%d?)$")) then
local tmp=string.gsub(birth, "^(%d+)",theyear)
local tmp2=string.gsub(birth, "^(%d+)",theyearn)
local t=lefttime(tmp)
local tt=lefttime(tmp2)
t=math.ceil(t/3600/24);
tt=math.ceil(tt/3600/24);
if((t>=0 and t<=daycalc) or (tt>=0 and tt<=daycalc))then
tmp =MMDD(birth).." あと".. math.abs(t).."日 "
if(t<0)then
tmp =MMDD(birth).." あと".. math.abs(tt).."日 "
end
tmp = tmp .. idol.."\r\n"
birthst[idol]=tmp
end
end
end

stlen=tonumber(#imasb["sc"])
for i=1,stlen do
local birth=imasb["sc"][i][1]
local idol=imasb["sc"][i][2]
if(birth:match("([Z%+])(%d?%d?):?(%d?%d?)$")) then
local tmp=string.gsub(birth, "^(%d+)",theyear)
local tmp2=string.gsub(birth, "^(%d+)",theyearn)
local t=lefttime(tmp)
local tt=lefttime(tmp2)
t=math.ceil(t/3600/24);
tt=math.ceil(tt/3600/24);
if((t>=0 and t<=daycalc) or (tt>=0 and tt<=daycalc))then
tmp =MMDD(birth).." あと".. math.abs(t).."日 "
if(t<0)then
tmp =MMDD(birth).." あと".. math.abs(tt).."日 "
end
tmp = tmp .. idol.."\r\n"
birthst[idol]=tmp
end
end
end

stlen=tonumber(#imasb["ds"])
for i=1,stlen do
local birth=imasb["ds"][i][1]
local idol=imasb["ds"][i][2]
if(birth:match("([Z%+])(%d?%d?):?(%d?%d?)$")) then
local tmp=string.gsub(birth, "^(%d+)",theyear)
local tmp2=string.gsub(birth, "^(%d+)",theyearn)
local t=lefttime(tmp)
local tt=lefttime(tmp2)
t=math.ceil(t/3600/24);
tt=math.ceil(tt/3600/24);
if((t>=0 and t<=daycalc) or (tt>=0 and tt<=daycalc))then
tmp =MMDD(birth).." あと".. math.abs(t).."日 "
if(t<0)then
tmp =MMDD(birth).." あと".. math.abs(tt).."日 "
end
tmp = tmp .. idol.."\r\n"
birthst[idol]=tmp
end
end
end

stlen=tonumber(#imasb["ga"])
for i=1,stlen do
local birth=imasb["ga"][i][1]
local idol=imasb["ga"][i][2]
if(birth:match("([Z%+])(%d?%d?):?(%d?%d?)$")) then
local tmp=string.gsub(birth, "^(%d+)",theyear)
local tmp2=string.gsub(birth, "^(%d+)",theyearn)
local t=lefttime(tmp)
local tt=lefttime(tmp2)
t=math.ceil(t/3600/24);
tt=math.ceil(tt/3600/24);
if((t>=0 and t<=daycalc) or (tt>=0 and tt<=daycalc))then
tmp =MMDD(birth).." あと".. math.abs(t).."日 "
if(t<0)then
tmp =MMDD(birth).." あと".. math.abs(tt).."日 "
end
tmp = tmp .. idol.."\r\n"
birthst[idol]=tmp
end
end
end


local tkeys = {}
-- populate the table that holds the keys
for k in pairs(birthst) do
table.insert(tkeys, { birthst[k],string.match( birthst[k], "あと%d+")})
end
-- sort the keys
--table.sort(tkeys)
table.sort(tkeys,
	function(a,b)
		return (a[2] < b[2])
	end)

for i=1,#tkeys do
   daystring=daystring .. tkeys[i][1]
end

daychange =  JSTday()
	return 1
end

function table.to_qs(arg)
	local qs = {}
	for key, value in pairs(arg) do
		table.insert(qs, key .. "=" .. tostring(value):urlencode())
	end
	return "?" .. table.concat(qs, "&")
end

function cut_string(s,max)
if(#s>=max)then
s = s:sub(1,max)
end

return s
end

-- A function named script_update will be called when settings are changed
function script_update(settings)
	activate(false)

	source_name = obs.obs_data_get_string(settings, "source")
	format_string = cut_string(obs.obs_data_get_string(settings, "format_string"),100)
	utc           = obs.obs_data_get_double(settings, "UTC")
	ima           = findidol("im",cut_string(obs.obs_data_get_string(settings, "im"),150))
	obs.obs_data_set_string(settings, "im",imas[ima][1]..imas[ima][3])
	imass           = obs.obs_data_get_int(settings, "IMSERIES")
	daylim           = obs.obs_data_get_int(settings, "DAYLIM")
	cgn =findidol("cg",cut_string(obs.obs_data_get_string(settings, "cg"),20))
	mln =findidol("ml",cut_string(obs.obs_data_get_string(settings, "ml"),20))
	smn =findidol("sm",cut_string(obs.obs_data_get_string(settings, "sm"),20))
	scn =findidol("sc",cut_string(obs.obs_data_get_string(settings, "sc"),20))
	dsn =findidol("ds",cut_string(obs.obs_data_get_string(settings, "ds"),20))
	gan =findidol("ga",cut_string(obs.obs_data_get_string(settings, "ga"),20))
	local inum={cgn,mln,smn,scn,dsn,gan}
	useidol=inum[imass]
	findday()
	
	reset(true)
end

-- A function named script_defaults will be called to set the default settings
function script_defaults(settings)
	obs.obs_data_set_default_string(settings, "format_string", "%Y/%m/%d(%a)%X(GMT%z)")
	obs.obs_data_set_default_double(settings, "UTC", 9)
	obs.obs_data_set_default_string(settings, "im",imas[1][1])
	obs.obs_data_set_default_int(settings, "IMSERIES", 1)
	obs.obs_data_set_default_string(settings, "ml","エミリー・スチュアート")
	obs.obs_data_set_default_string(settings, "cg","道明寺歌鈴")
	obs.obs_data_set_default_string(settings, "sm","冬美旬")
	obs.obs_data_set_default_string(settings, "sc","芹沢あさひ")
	obs.obs_data_set_default_string(settings, "ds","水谷絵理")
	obs.obs_data_set_default_string(settings, "ga","藤田 ことね")
	obs.obs_data_set_default_int(settings, "DAYLIM", 2)
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



--JSONparser


local json = { _version = "0.1.2" }

-------------------------------------------------------------------------------
-- Encode
-------------------------------------------------------------------------------

local encode

local escape_char_map = {
  [ "\\" ] = "\\",
  [ "\"" ] = "\"",
  [ "\b" ] = "b",
  [ "\f" ] = "f",
  [ "\n" ] = "n",
  [ "\r" ] = "r",
  [ "\t" ] = "t",
}

local escape_char_map_inv = { [ "/" ] = "/" }
for k, v in pairs(escape_char_map) do
  escape_char_map_inv[v] = k
end


local function escape_char(c)
  return "\\" .. (escape_char_map[c] or string.format("u%04x", c:byte()))
end


local function encode_nil(val)
  return "null"
end


local function encode_table(val, stack)
  local res = {}
  stack = stack or {}

  -- Circular reference?
  if stack[val] then error("circular reference") end

  stack[val] = true

  if rawget(val, 1) ~= nil or next(val) == nil then
    -- Treat as array -- check keys are valid and it is not sparse
    local n = 0
    for k in pairs(val) do
      if type(k) ~= "number" then
        error("invalid table: mixed or invalid key types")
      end
      n = n + 1
    end
    if n ~= #val then
      error("invalid table: sparse array")
    end
    -- Encode
    for i, v in ipairs(val) do
      table.insert(res, encode(v, stack))
    end
    stack[val] = nil
    return "[" .. table.concat(res, ",") .. "]"

  else
    -- Treat as an object
    for k, v in pairs(val) do
      if type(k) ~= "string" then
        error("invalid table: mixed or invalid key types")
      end
      table.insert(res, encode(k, stack) .. ":" .. encode(v, stack))
    end
    stack[val] = nil
    return "{" .. table.concat(res, ",") .. "}"
  end
end


local function encode_string(val)
  return '"' .. val:gsub('[%z\1-\31\\"]', escape_char) .. '"'
end


local function encode_number(val)
  -- Check for NaN, -inf and inf
  if val ~= val or val <= -math.huge or val >= math.huge then
    error("unexpected number value '" .. tostring(val) .. "'")
  end
  return string.format("%.14g", val)
end


local type_func_map = {
  [ "nil"     ] = encode_nil,
  [ "table"   ] = encode_table,
  [ "string"  ] = encode_string,
  [ "number"  ] = encode_number,
  [ "boolean" ] = tostring,
}


encode = function(val, stack)
  local t = type(val)
  local f = type_func_map[t]
  if f then
    return f(val, stack)
  end
  error("unexpected type '" .. t .. "'")
end


function json.encode(val)
  return ( encode(val) )
end


-------------------------------------------------------------------------------
-- Decode
-------------------------------------------------------------------------------

local parse

local function create_set(...)
  local res = {}
  for i = 1, select("#", ...) do
    res[ select(i, ...) ] = true
  end
  return res
end

local space_chars   = create_set(" ", "\t", "\r", "\n")
local delim_chars   = create_set(" ", "\t", "\r", "\n", "]", "}", ",")
local escape_chars  = create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")
local literals      = create_set("true", "false", "null")

local literal_map = {
  [ "true"  ] = true,
  [ "false" ] = false,
  [ "null"  ] = nil,
}


local function next_char(str, idx, set, negate)
  for i = idx, #str do
    if set[str:sub(i, i)] ~= negate then
      return i
    end
  end
  return #str + 1
end


local function decode_error(str, idx, msg)
  local line_count = 1
  local col_count = 1
  for i = 1, idx - 1 do
    col_count = col_count + 1
    if str:sub(i, i) == "\n" then
      line_count = line_count + 1
      col_count = 1
    end
  end
  error( string.format("%s at line %d col %d", msg, line_count, col_count) )
end


local function codepoint_to_utf8(n)
  -- http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=iws-appendixa
  local f = math.floor
  if n <= 0x7f then
    return string.char(n)
  elseif n <= 0x7ff then
    return string.char(f(n / 64) + 192, n % 64 + 128)
  elseif n <= 0xffff then
    return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
  elseif n <= 0x10ffff then
    return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128,
                       f(n % 4096 / 64) + 128, n % 64 + 128)
  end
  error( string.format("invalid unicode codepoint '%x'", n) )
end


local function parse_unicode_escape(s)
  local n1 = tonumber( s:sub(1, 4),  16 )
  local n2 = tonumber( s:sub(7, 10), 16 )
   -- Surrogate pair?
  if n2 then
    return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)
  else
    return codepoint_to_utf8(n1)
  end
end


local function parse_string(str, i)
  local res = ""
  local j = i + 1
  local k = j

  while j <= #str do
    local x = str:byte(j)

    if x < 32 then
      decode_error(str, j, "control character in string")

    elseif x == 92 then -- `\`: Escape
      res = res .. str:sub(k, j - 1)
      j = j + 1
      local c = str:sub(j, j)
      if c == "u" then
        local hex = str:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", j + 1)
                 or str:match("^%x%x%x%x", j + 1)
                 or decode_error(str, j - 1, "invalid unicode escape in string")
        res = res .. parse_unicode_escape(hex)
        j = j + #hex
      else
        if not escape_chars[c] then
          decode_error(str, j - 1, "invalid escape char '" .. c .. "' in string")
        end
        res = res .. escape_char_map_inv[c]
      end
      k = j + 1

    elseif x == 34 then -- `"`: End of string
      res = res .. str:sub(k, j - 1)
      return res, j + 1
    end

    j = j + 1
  end

  decode_error(str, i, "expected closing quote for string")
end


local function parse_number(str, i)
  local x = next_char(str, i, delim_chars)
  local s = str:sub(i, x - 1)
  local n = tonumber(s)
  if not n then
    decode_error(str, i, "invalid number '" .. s .. "'")
  end
  return n, x
end


local function parse_literal(str, i)
  local x = next_char(str, i, delim_chars)
  local word = str:sub(i, x - 1)
  if not literals[word] then
    decode_error(str, i, "invalid literal '" .. word .. "'")
  end
  return literal_map[word], x
end


local function parse_array(str, i)
  local res = {}
  local n = 1
  i = i + 1
  while 1 do
    local x
    i = next_char(str, i, space_chars, true)
    -- Empty / end of array?
    if str:sub(i, i) == "]" then
      i = i + 1
      break
    end
    -- Read token
    x, i = parse(str, i)
    res[n] = x
    n = n + 1
    -- Next token
    i = next_char(str, i, space_chars, true)
    local chr = str:sub(i, i)
    i = i + 1
    if chr == "]" then break end
    if chr ~= "," then decode_error(str, i, "expected ']' or ','") end
  end
  return res, i
end


local function parse_object(str, i)
  local res = {}
  i = i + 1
  while 1 do
    local key, val
    i = next_char(str, i, space_chars, true)
    -- Empty / end of object?
    if str:sub(i, i) == "}" then
      i = i + 1
      break
    end
    -- Read key
    if str:sub(i, i) ~= '"' then
      decode_error(str, i, "expected string for key")
    end
    key, i = parse(str, i)
    -- Read ':' delimiter
    i = next_char(str, i, space_chars, true)
    if str:sub(i, i) ~= ":" then
      decode_error(str, i, "expected ':' after key")
    end
    i = next_char(str, i + 1, space_chars, true)
    -- Read value
    val, i = parse(str, i)
    -- Set
    res[key] = val
    -- Next token
    i = next_char(str, i, space_chars, true)
    local chr = str:sub(i, i)
    i = i + 1
    if chr == "}" then break end
    if chr ~= "," then decode_error(str, i, "expected '}' or ','") end
  end
  return res, i
end


local char_func_map = {
  [ '"' ] = parse_string,
  [ "0" ] = parse_number,
  [ "1" ] = parse_number,
  [ "2" ] = parse_number,
  [ "3" ] = parse_number,
  [ "4" ] = parse_number,
  [ "5" ] = parse_number,
  [ "6" ] = parse_number,
  [ "7" ] = parse_number,
  [ "8" ] = parse_number,
  [ "9" ] = parse_number,
  [ "-" ] = parse_number,
  [ "t" ] = parse_literal,
  [ "f" ] = parse_literal,
  [ "n" ] = parse_literal,
  [ "[" ] = parse_array,
  [ "{" ] = parse_object,
}


parse = function(str, idx)
  local chr = str:sub(idx, idx)
  local f = char_func_map[chr]
  if f then
    return f(str, idx)
  end
  decode_error(str, idx, "unexpected character '" .. chr .. "'")
end


function json.decode(str)
  if type(str) ~= "string" then
    error("expected argument of type string, got " .. type(str))
  end
  local res, idx = parse(str, next_char(str, 1, space_chars, true))
  idx = next_char(str, idx, space_chars, true)
  if idx <= #str then
    decode_error(str, idx, "trailing garbage")
  end
  return res
end


--return json
imasb=json.decode(imasb)