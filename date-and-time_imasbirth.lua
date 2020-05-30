--orig https://obsproject.com/forum/resources/date-and-time.644/
-- 令和テキトー表示とUTCグローバル時間を出せるよう改造

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
daylim 		  =7
daystring     =""
debugtxt1	  = ""
debugtxt2	  = ""
debugtxt3	  = ""

--あいますようそがないので無理やり追加（）
--https://script.googleusercontent.com/macros/echo?user_content_key=ETKjv48buN5rK2r4wpjCSZET2OQiIV-y3T_Yo1sO9RWDb2j2bNXU4Zw-vXPSLkT2PAEmtVq1qbpiIQBE2mWH2GtjwIj1WZRCm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnImdhCglA_bw00zKJV-3uMxFhM94xSIKcykYkHTwB1nSW4GadiCkn1G8mzDTCqnGIg&lib=Mp89x2A3ZSHn80Z0KafsZgXndBJ9ix56c
imashead ={"ゲーム名","稼働","機種","終わり"}
imas ={{"THE IDOLM@STER","2005-07-25T15:00:00.000Z","アーケード",""},{"THE IDOLM@STER","2007-01-24T15:00:00.000Z","Xbox 360",""},{"THE IDOLM@STER LIVE FOR YOU!","2008-02-27T15:00:00.000Z","Xbox 360",""},{"THE IDOLM@STER SP","2009-02-18T15:00:00.000Z","PSP",""},{"THE IDOLM@STER Dearly Stars","2009-09-16T15:00:00.000Z","DS",""},{"アイドルマスター モバイル","2010-12-20T15:00:00.000Z","フィーチャー・フォン","2016-03-30T15:00:00.000Z"},{"THE IDOLM@STER 2","2011-02-23T15:00:00.000Z","Xbox 360",""},{"THE IDOLM@STER 2","2011-10-26T15:00:00.000Z","PS3",""},{"アイドルマスター シンデレラガールズ","2011-11-27T15:00:00.000Z","Mobage",""},{"アイドルマスター モバイルi","2012-03-29T15:00:00.000Z","iOS","2016-01-17T15:00:00.000Z"},{"THE IDOLM@STER SHINY FESTA","2012-10-24T15:00:00.000Z","PSP",""},{"アイドルマスター ミリオンライブ!","2013-02-26T15:00:00.000Z","GREE","2018-03-19T03:00:00.000Z"},{"THE IDOLM@STER SHINY FESTA","2013-04-21T15:00:00.000Z","iOS",""},{"アイマスチャンネル","2013-10-01T15:00:00.000Z","PS3",""},{"アイドルマスター ワンフォーオール","2014-05-14T15:00:00.000Z","PS3",""},{"アイドルマスター SideM","2014-07-16T15:00:00.000Z","Mobage",""},{"韓国版アイドルマスターシンデレラガールズ","2014-12-01T15:00:00.000Z","Mobage","2016-03-14T06:00:00.000Z"},{"アイドルマスター シンデレラガールズ スターライトステージ","2015-09-02T15:00:00.000Z","iOS、Android",""},{"アイドルマスター マストソングス 赤盤/青盤","2015-12-09T15:00:00.000Z","PS Vita",""},{"アイドルマスター プラチナスターズ","2016-07-27T15:00:00.000Z","PS4",""},{"アイドルマスター シンデレラガールズ ビューイングレボリューション","2016-10-12T15:00:00.000Z","PS VR",""},{"アイドルマスター ミリオンライブ! シアターデイズ","2017-06-28T15:00:00.000Z","iOS、Android",""},{"アイドルマスター SideM LIVE ON ST@GE!","2017-08-29T15:00:00.000Z","iOS、Android",""},{"アイドルマスター ステラステージ","2017-12-20T15:00:00.000Z","PS4",""},{"アイドルマスター シャイニーカラーズ","2018-04-23T15:00:00.000Z","enza",""},{"ミリシタ海外版","2019-08-29T15:00:00.000Z","iOS、Android",""}}
imasb='{"ml":[["2020-01-07T15:00:00.000Z","エミリー・スチュアート","えみりーすちゅわーと"],["2020-01-17T15:00:00.000Z","北沢志保","きたざわしほ"],["2020-01-20T15:00:00.000Z","四条貴音","しじょうたかね"],["2020-01-26T15:00:00.000Z","真壁瑞希","まかべみずき"],["2020-02-03T15:00:00.000Z","徳川まつり","とくがわまつり"],["2020-02-11T15:00:00.000Z","横山奈緒","よこやまなお"],["2020-02-19T15:00:00.000Z","箱崎星梨花","はこざきせりか"],["2020-02-24T15:00:00.000Z","如月千早","きさらずちはや"],["2020-02-29T15:00:00.000Z","ロコ(伴田路子)","はんだろこ"],["2020-03-06T15:00:00.000Z","水谷絵理","みずたにえり"],["2020-03-17T15:00:00.000Z","七尾百合子","ななおゆりこ"],["2020-03-21T15:00:00.000Z","佐竹美奈子","さたけみなこ"],["2020-03-24T15:00:00.000Z","高槻やよい","たかつきやよい"],["2020-03-26T15:00:00.000Z","桜守歌織","さくらもりかおり"],["2020-03-29T15:00:00.000Z","福田のり子","ふくだのりこ"],["2020-04-02T15:00:00.000Z","天海春香","あまみはるか"],["2020-04-14T15:00:00.000Z","所恵美","ところめぐみ"],["2020-04-23T15:00:00.000Z","宮尾美也","みやおみや"],["2020-04-28T15:00:00.000Z","大神環","おおがみたまき"],["2020-05-04T15:00:00.000Z","水瀬伊織","みなせいおり"],["2020-05-16T15:00:00.000Z","北上麗花","きたかみれいか"],["2020-05-21T15:00:00.000Z","双海亜美","ふたみあみ"],["2020-05-21T15:00:00.000Z","双海真美","ふたみまみ"],["2020-05-28T15:00:00.000Z","白石紬","しらいしつむぎ"],["2020-05-30T15:00:00.000Z","望月杏奈","もちづきあんな"],["2020-06-06T15:00:00.000Z","松田亜利沙","まつだありさ"],["2020-06-11T15:00:00.000Z","馬場このみ","ばばこのみ"],["2020-06-22T15:00:00.000Z","秋月律子","あきづきりつこ"],["2020-06-24T15:00:00.000Z","日高愛","ひだかあい"],["2020-06-27T15:00:00.000Z","春日未来","かすがみらい"],["2020-06-28T15:00:00.000Z","青羽美咲","あおばみさき"],["2020-07-03T15:00:00.000Z","木下ひなた","きのしたひなた"],["2020-07-05T15:00:00.000Z","高木順一朗","たかぎじゅんいちろう"],["2020-07-05T15:00:00.000Z","高木順二朗","たかぎじゅんじろう"],["2020-07-18T15:00:00.000Z","三浦あずさ","みうらあずさ"],["2020-07-22T15:00:00.000Z","舞浜歩","まいはまあゆむ"],["2020-07-29T15:00:00.000Z","伊吹翼","いぶきつばさ"],["2020-08-09T15:00:00.000Z","高坂海美","こうさかうみ"],["2020-08-17T15:00:00.000Z","矢吹可奈","やぶきかな"],["2020-08-26T15:00:00.000Z","篠宮可憐","しのみやかれん"],["2020-08-28T15:00:00.000Z","菊地真","きくちまこと"],["2020-09-01T15:00:00.000Z","豊川風花","とよかわふうか"],["2020-09-05T15:00:00.000Z","黒井崇男","くろいたかお"],["2020-09-08T15:00:00.000Z","音無小鳥","おとなしことり"],["2020-09-13T15:00:00.000Z","最上静香","もがみしずか"],["2020-09-14T15:00:00.000Z","秋月涼","あきづききりょう"],["2020-09-15T15:00:00.000Z","詩花","しいか"],["2020-09-19T15:00:00.000Z","永吉昴","ながよしすばる"],["2020-09-25T15:00:00.000Z","ジュリア","じゅりあ"],["2020-10-04T15:00:00.000Z","田中琴葉","たなかことは"],["2020-10-09T15:00:00.000Z","我那覇響","がなはひびき"],["2020-10-20T15:00:00.000Z","二階堂千鶴","にかいどうちづる"],["2020-10-25T15:00:00.000Z","島原エレナ","しまばらえれな"],["2020-11-05T15:00:00.000Z","周防桃子","すおうももこ"],["2020-11-10T15:00:00.000Z","天空橋朋花","てんくうばしともか"],["2020-11-20T15:00:00.000Z","百瀬莉緒","ももせりお"],["2020-11-22T15:00:00.000Z","星井美希","ほしいみき"],["2020-12-02T15:00:00.000Z","野々原茜","ののはらあかね"],["2020-12-15T15:00:00.000Z","中谷育","なかたにいく"],["2020-12-23T15:00:00.000Z","萩原雪歩","はぎわらゆきほ"],["2020-12-28T15:00:00.000Z","高山紗代子","たかやまさよこ"],["--","玲音","れおん"],["--","早坂そら","はやさかそら"],["--","高槻かすみ","たかつきかすみ"],["--","ジョーイ・ロータス","じょーいろーたす"],["--","茜ちゃん","あかねちゃん"],["--","シャルル・ドナテルロ18世(うさちゃん)","しゃるるどなてるろじゅうはちせい うさちゃん"],["--","チュパカブラ","ちゅぱかぶら"]],"cg":[["2019-12-31T15:00:00.000Z","道明寺歌鈴","どうみょうじかりん"],["2019-12-31T15:00:00.000Z","鷹富士茄子","たかふじかこ"],["2020-01-02T15:00:00.000Z","野々村そら","ののむらそら"],["2020-01-02T15:00:00.000Z","村上巴","むらかみともえ"],["2020-01-05T15:00:00.000Z","三村かな子","みむらかなこ"],["2020-01-05T15:00:00.000Z","安斎都","あんざいみやこ"],["2020-01-09T15:00:00.000Z","瀬名詩織","せなしおり"],["2020-01-12T15:00:00.000Z","浜口あやめ","はまぐちあやめ"],["2020-01-18T15:00:00.000Z","メアリー・コクラン","めありーこくらん"],["2020-01-20T15:00:00.000Z","福山舞","ふくやままい"],["2020-01-20T15:00:00.000Z","四条貴音","しじょうたかね"],["2020-01-20T15:00:00.000Z","松山久美子","まつやまくみこ"],["2020-01-22T15:00:00.000Z","西園寺琴歌","さいおんじことか"],["2020-01-27T15:00:00.000Z","太田優","おおたゆう"],["2020-02-02T15:00:00.000Z","二宮飛鳥","にのみやあすか"],["2020-02-03T15:00:00.000Z","白雪千夜","しらゆきちよ"],["2020-02-05T15:00:00.000Z","江上椿","えがみつばき"],["2020-02-06T15:00:00.000Z","東郷あい","とうごうあい"],["2020-02-07T15:00:00.000Z","市原仁奈","いちはらにな"],["2020-02-10T15:00:00.000Z","浅野風香","あさのふうか"],["2020-02-13T15:00:00.000Z","相原雪乃","あいはらゆきの"],["2020-02-13T15:00:00.000Z","宮本フレデリカ","みやもとふれでりか"],["2020-02-16T15:00:00.000Z","北川真尋","きたがわまひろ"],["2020-02-18T15:00:00.000Z","遊佐こずえ","ゆさこずえ"],["2020-02-21T15:00:00.000Z","前川みく","まえかわみく"],["2020-02-23T15:00:00.000Z","桐生つかさ","きりゅうつかさ"],["2020-02-24T15:00:00.000Z","三船美優","みふねみゆ"],["2020-02-24T15:00:00.000Z","如月千早","きさらぎちはや"],["2020-02-25T15:00:00.000Z","黒川千秋","くろかわちあき"],["2020-03-02T15:00:00.000Z","今井加奈","いまいかな"],["2020-03-04T15:00:00.000Z","小関麗奈","こせきれいな"],["2020-03-05T15:00:00.000Z","有浦柑奈","ありうらかんな"],["2020-03-06T15:00:00.000Z","片桐早苗","かたぎりさなえ"],["2020-03-06T15:00:00.000Z","水谷絵理","みずたにえり"],["2020-03-08T15:00:00.000Z","工藤忍","くどうしのぶ"],["2020-03-09T15:00:00.000Z","ルーキートレーナー(青木慶)","るーきーとれーなー あおきけい"],["2020-03-11T15:00:00.000Z","ジュニー","じゅにー"],["2020-03-12T15:00:00.000Z","堀裕子","ほりゆうこ"],["2020-03-15T15:00:00.000Z","柳瀬美由紀","やなせみゆき"],["2020-03-17T15:00:00.000Z","衛藤美紗希","えとうみさき"],["2020-03-18T15:00:00.000Z","長富蓮実","ながとみはすみ"],["2020-03-19T15:00:00.000Z","大西由里子","おおにしゆりこ"],["2020-03-20T15:00:00.000Z","松尾千鶴","まつおちづる"],["2020-03-22T15:00:00.000Z","中野有香","なかのゆか"],["2020-03-24T15:00:00.000Z","高槻やよい","たかつきやよい"],["2020-03-24T15:00:00.000Z","高峯のあ","たかみねのあ"],["2020-03-26T15:00:00.000Z","村松さくら","むらまつさくら"],["2020-03-27T15:00:00.000Z","白坂小梅","しらさかこうめ"],["2020-03-29T15:00:00.000Z","大沼くるみ","おおぬまくるみ"],["2020-03-31T15:00:00.000Z","古賀小春","こがこはる"],["2020-04-02T15:00:00.000Z","天海春香","あまみはるか"],["2020-04-03T15:00:00.000Z","ヘレン","へれん"],["2020-04-05T15:00:00.000Z","喜多日菜子","きたひなこ"],["2020-04-06T15:00:00.000Z","和久井留美","わくいるみ"],["2020-04-07T15:00:00.000Z","櫻井桃華","さくらいももか"],["2020-04-07T15:00:00.000Z","桐野アヤ","きりのあや"],["2020-04-07T15:00:00.000Z","神崎蘭子","かんざきらんこ"],["2020-04-08T15:00:00.000Z","荒木比奈","あらきひな"],["2020-04-09T15:00:00.000Z","上条春菜","かみじょうはるな"],["2020-04-11T15:00:00.000Z","大原みちる","おおはらみちる"],["2020-04-13T15:00:00.000Z","赤城みりあ","あかぎみりあ"],["2020-04-14T15:00:00.000Z","相葉夕美","あいばゆみ"],["2020-04-17T15:00:00.000Z","財前時子","ざいぜんときこ"],["2020-04-18T15:00:00.000Z","白菊ほたる","しらぎくほたる"],["2020-04-23T15:00:00.000Z","島村卯月","しまむらうづき"],["2020-04-26T15:00:00.000Z","水木聖來","みずきせいら"],["2020-04-26T15:00:00.000Z","槙原志保","まきはらしほ"],["2020-04-30T15:00:00.000Z","難波笑美","なんばえみ"],["2020-05-01T15:00:00.000Z","土屋亜子","つちやあこ"],["2020-05-03T15:00:00.000Z","日下部若葉","くさかべわかば"],["2020-05-04T15:00:00.000Z","水瀬伊織","みなせいおり"],["2020-05-05T15:00:00.000Z","沢田麻理菜","さわだまりな"],["2020-05-06T15:00:00.000Z","大槻唯","おおつきゆい"],["2020-05-07T15:00:00.000Z","高橋礼子","たかはしれいこ"],["2020-05-07T15:00:00.000Z","吉岡沙紀","よしおかさき"],["2020-05-08T15:00:00.000Z","早坂美玲","はやさかみれい"],["2020-05-11T15:00:00.000Z","柳清良","やなぎきよら"],["2020-05-14T15:00:00.000Z","安部菜々","あべなな"],["2020-05-17T15:00:00.000Z","古澤頼子","ふるさわよりこ"],["2020-05-20T15:00:00.000Z","ライラ","らいら"],["2020-05-21T15:00:00.000Z","双海亜美","ふたみあみ"],["2020-05-21T15:00:00.000Z","双海真美","ふたみまみ"],["2020-05-24T15:00:00.000Z","浜川愛結奈","はまかわあゆな"],["2020-05-28T15:00:00.000Z","綾瀬穂乃香","あやせほのか"],["2020-05-29T15:00:00.000Z","一ﾉ瀬志希","いちのせしき"],["2020-06-02T15:00:00.000Z","及川雫","おいかわしずく"],["2020-06-03T15:00:00.000Z","丹羽仁美","にわひとみ"],["2020-06-05T15:00:00.000Z","星輝子","ほししょうこ"],["2020-06-06T15:00:00.000Z","佐々木千枝","ささきちえ"],["2020-06-08T15:00:00.000Z","小室千奈美","こむろちなみ"],["2020-06-09T15:00:00.000Z","池袋晶葉","いけぶくろあきは"],["2020-06-09T15:00:00.000Z","トレーナー(青木明)","とれーなー あおきめい"],["2020-06-10T15:00:00.000Z","緒方智絵里","おがたちえり"],["2020-06-11T15:00:00.000Z","奥山沙織","おくやまさおり"],["2020-06-13T15:00:00.000Z","高垣楓","たかがきかえで"],["2020-06-14T15:00:00.000Z","藤原肇","ふじわらはじめ"],["2020-06-15T15:00:00.000Z","久川颯","ひさかわはやて"],["2020-06-15T15:00:00.000Z","久川凪","ひさかわなぎ"],["2020-06-19T15:00:00.000Z","梅木音葉","うめきおとは"],["2020-06-22T15:00:00.000Z","秋月律子","あきづきりつこ"],["2020-06-24T15:00:00.000Z","三好紗南","みよしさな"],["2020-06-24T15:00:00.000Z","日高愛","ひだかあい"],["2020-06-26T15:00:00.000Z","仙崎恵磨","せんざきえま"],["2020-06-28T15:00:00.000Z","ナターリア","なたーりあ"],["2020-06-29T15:00:00.000Z","多田李衣菜","ただりいな"],["2020-06-30T15:00:00.000Z","藤居朋","ふじいとも"],["2020-06-30T15:00:00.000Z","速水奏","はやみかなで"],["2020-07-02T15:00:00.000Z","依田芳乃","よりたよしの"],["2020-07-06T15:00:00.000Z","赤西瑛梨華","あかにしえりか"],["2020-07-06T15:00:00.000Z","桃井あずき","ももいあずき"],["2020-07-09T15:00:00.000Z","矢口美羽","やぐちみう"],["2020-07-12T15:00:00.000Z","氏家むつみ","うじいえむつみ"],["2020-07-15T15:00:00.000Z","岡崎泰葉","おかざきやすは"],["2020-07-16T15:00:00.000Z","結城晴","ゆうきはる"],["2020-07-18T15:00:00.000Z","三浦あずさ","みうらあずさ"],["2020-07-19T15:00:00.000Z","龍崎薫","りゅうざきかおる"],["2020-07-19T15:00:00.000Z","杉坂海","すぎさかうみ"],["2020-07-21T15:00:00.000Z","佐藤心","さとうしん"],["2020-07-22T15:00:00.000Z","相馬夏美","そうまなつみ"],["2020-07-24T15:00:00.000Z","高森藍子","たかもりあいこ"],["2020-07-26T15:00:00.000Z","新田美波","にったみなみ"],["2020-07-29T15:00:00.000Z","城ヶ崎莉嘉","じょうがさきりか"],["2020-07-30T15:00:00.000Z","橘ありす","たちばなありす"],["2020-07-31T15:00:00.000Z","棟方愛海","むなかたあつみ"],["2020-07-31T15:00:00.000Z","愛野渚","あいのなぎさ"],["2020-08-01T15:00:00.000Z","イム・ユジン","いむゆじん"],["2020-08-02T15:00:00.000Z","海老原菜帆","えびはらなほ"],["2020-08-03T15:00:00.000Z","日野茜","ひのあかね"],["2020-08-06T15:00:00.000Z","向井拓海","むかいたくみ"],["2020-08-07T15:00:00.000Z","木場真奈美","きばまなみ"],["2020-08-09T15:00:00.000Z","五十嵐響子","いがらしきょうこ"],["2020-08-09T15:00:00.000Z","渋谷凛","しぶやりん"],["2020-08-14T15:00:00.000Z","ケイト","けいと"],["2020-08-16T15:00:00.000Z","関裕美","せきひろみ"],["2020-08-16T15:00:00.000Z","西島櫂","にしじまかい"],["2020-08-17T15:00:00.000Z","首藤葵","しゅとうあおい"],["2020-08-18T15:00:00.000Z","木村夏樹","きむらなつき"],["2020-08-23T15:00:00.000Z","持田亜里沙","もちだありさ"],["2020-08-25T15:00:00.000Z","クラリス","くらりす"],["2020-08-26T15:00:00.000Z","井村雪菜","いむらせつな"],["2020-08-26T15:00:00.000Z","榊原里美","さかきばらさとみ"],["2020-08-26T15:00:00.000Z","森久保乃々","もりくぼのの"],["2020-08-27T15:00:00.000Z","涼宮星花","すずみやせいか"],["2020-08-28T15:00:00.000Z","菊地真","きくちまこと"],["2020-08-29T15:00:00.000Z","若林智香","わかばやしともか"],["2020-08-31T15:00:00.000Z","松本沙理奈","まつもとさりな"],["2020-08-31T15:00:00.000Z","諸星きらり","もろぼしきらり"],["2020-09-01T15:00:00.000Z","双葉杏","ふたばあんず"],["2020-09-04T15:00:00.000Z","北条加蓮","ほうじょうかれん"],["2020-09-06T15:00:00.000Z","佐久間まゆ","さくままゆ"],["2020-09-08T15:00:00.000Z","栗原ネネ","くりはらねね"],["2020-09-09T15:00:00.000Z","ベテラントレーナー(青木聖）","べてらんとれーなー あおきせい"],["2020-09-11T15:00:00.000Z","夢見りあむ","ゆめみりあむ"],["2020-09-12T15:00:00.000Z","南条光","なんじょうひかる"],["2020-09-13T15:00:00.000Z","姫川友紀","ひめかわゆき"],["2020-09-14T15:00:00.000Z","秋月涼","あきづきりょう"],["2020-09-15T15:00:00.000Z","神谷奈緒","かみやなお"],["2020-09-18T15:00:00.000Z","アナスタシア","あなすたしあ"],["2020-09-18T15:00:00.000Z","キャシー・グラハム","きゃしーぐらはむ"],["2020-09-19T15:00:00.000Z","脇山珠美","わきやまたまみ"],["2020-09-23T15:00:00.000Z","伊集院惠","いじゅういんめぐみ"],["2020-09-25T15:00:00.000Z","冴島清美","さえじまきよみ"],["2020-09-27T15:00:00.000Z","佐城雪美","さじょうゆきみ"],["2020-09-28T15:00:00.000Z","楊菲菲","やおふぇいふぇい"],["2020-09-30T15:00:00.000Z","松永涼","まつながりょう"],["2020-10-02T15:00:00.000Z","兵藤ﾚﾅ","ひょうどうれな"],["2020-10-05T15:00:00.000Z","乙倉悠貴","おとくらゆうき"],["2020-10-06T15:00:00.000Z","砂塚あきら","すなづかあきら"],["2020-10-08T15:00:00.000Z","浅利七海","あさりななみ"],["2020-10-09T15:00:00.000Z","椎名法子","しいなのりこ"],["2020-10-09T15:00:00.000Z","我那覇響","がなはひびき"],["2020-10-10T15:00:00.000Z","服部瞳子","はっとりとうこ"],["2020-10-13T15:00:00.000Z","藤本里奈","ふじもとりな"],["2020-10-13T15:00:00.000Z","並木芽衣子","なみきめいこ"],["2020-10-17T15:00:00.000Z","水本ゆかり","みずもとゆかり"],["2020-10-17T15:00:00.000Z","小早川紗枝","こばやかわさえ"],["2020-10-22T15:00:00.000Z","西川保奈美","にしかわほなみ"],["2020-10-23T15:00:00.000Z","桜井夢子","さくらいゆめこ"],["2020-10-25T15:00:00.000Z","上田鈴帆","うえだすずほ"],["2020-10-26T15:00:00.000Z","鷺沢文香","さぎさわふみか"],["2020-10-29T15:00:00.000Z","月宮雅","つきみやみやび"],["2020-11-02T15:00:00.000Z","成宮由愛","なるみやゆめ"],["2020-11-04T15:00:00.000Z","辻野あかり","つじのあかり"],["2020-11-05T15:00:00.000Z","間中美里","まなかみさと"],["2020-11-06T15:00:00.000Z","八神マキノ","やがみまきの"],["2020-11-08T15:00:00.000Z","リュ・ヘナ","りゅへな"],["2020-11-09T15:00:00.000Z","黒埼ちとせ","くろさきちとせ"],["2020-11-10T15:00:00.000Z","相川千夏","あいかわちなつ"],["2020-11-10T15:00:00.000Z","大石泉","おおいしいずみ"],["2020-11-11T15:00:00.000Z","城ヶ崎美嘉","じょうがさきみか"],["2020-11-12T15:00:00.000Z","岸部彩華","きしべあやか"],["2020-11-13T15:00:00.000Z","原田美世","はらだみよ"],["2020-11-16T15:00:00.000Z","小松伊吹","こまついぶき"],["2020-11-18T15:00:00.000Z","的場梨沙","まとばりさ"],["2020-11-21T15:00:00.000Z","篠原礼","しのはられい"],["2020-11-22T15:00:00.000Z","星井美希","ほしいみき"],["2020-11-24T15:00:00.000Z","輿水幸子","こしみずさちこ"],["2020-11-24T15:00:00.000Z","川島瑞樹","かわしまみずき"],["2020-11-27T15:00:00.000Z","千川ちひろ","千川ちひろ"],["2020-11-30T15:00:00.000Z","本田未央","ほんだみお"],["2020-12-01T15:00:00.000Z","喜多見柚","きたみゆず"],["2020-12-04T15:00:00.000Z","水野翠","みずのみどり"],["2020-12-07T15:00:00.000Z","十時愛梨","とときあいり"],["2020-12-09T15:00:00.000Z","マスタートレーナー(青木麗)","ますたーとれーなー あおきれい"],["2020-12-11T15:00:00.000Z","塩見周子","しおみしゅうこ"],["2020-12-13T15:00:00.000Z","サイネリア(鈴木彩音)","さいねりあ　すずきあやね"],["2020-12-15T15:00:00.000Z","小日向美穂","こひなたみほ"],["2020-12-15T15:00:00.000Z","大和亜季","やまとあき"],["2020-12-17T15:00:00.000Z","横山千佳","よこやまちか"],["2020-12-23T15:00:00.000Z","萩原雪歩","はぎわらゆきほ"],["2020-12-23T15:00:00.000Z","イヴ・サンタクロース","いぶさんたくろーす"],["2020-12-24T15:00:00.000Z","柊志乃","ひいらぎしの"],["2020-12-24T15:00:00.000Z","望月聖","もちづきひじり"],["2020-12-27T15:00:00.000Z","松原早耶","まつばらさや"],["2020-12-28T15:00:00.000Z","斉藤洋子","さいとうようこ"],["2020-12-28T15:00:00.000Z","真鍋いつき","まなべいつき"],["--","ぴにゃこら太","ぴにゃこらた"]],"sm":[["2020-01-01T15:00:00.000Z","冬美旬","ふゆみじゅん"],["2020-01-07T15:00:00.000Z","猪狩礼生","いがりれお"],["2020-01-12T15:00:00.000Z","硲道夫","はざまみちお"],["2020-01-16T15:00:00.000Z","神谷幸広","かみやゆきひろ"],["2020-02-01T15:00:00.000Z","鷹城恭二","たかじょうきょうじ"],["2020-02-09T15:00:00.000Z","姫野かのん","ひめのかのん"],["2020-02-13T15:00:00.000Z","伊集院北斗","いじゅういんほくと"],["2020-02-21T15:00:00.000Z","風間忍","かざましのぶ"],["2020-02-22T15:00:00.000Z","天道輝","てんどうてる"],["2020-03-02T15:00:00.000Z","天ヶ瀬冬馬","あまがせとうま"],["2020-03-06T15:00:00.000Z","握野英雄","あくのひでお"],["2020-03-21T15:00:00.000Z","渡辺みのり","わたなべみのり"],["2020-03-24T15:00:00.000Z","岡村直央","おかむらなお"],["2020-03-29T15:00:00.000Z","若里春名","わかざとはるな"],["2020-04-01T15:00:00.000Z","都築圭","つづきけい"],["2020-04-03T15:00:00.000Z","紅井朱雀","あかいすざく"],["2020-04-11T15:00:00.000Z","伊瀬谷四季","いせやしき"],["2020-04-19T15:00:00.000Z","御手洗翔太","みたらいしょうた"],["2020-04-21T15:00:00.000Z","橘志狼","たちばなしろう"],["2020-05-04T15:00:00.000Z","木村龍","きむらりゅう"],["2020-05-13T15:00:00.000Z","牙崎漣","きざきれん"],["2020-05-19T15:00:00.000Z","兜大吾","かぶとだいご"],["2020-06-01T15:00:00.000Z","柏木翼","かしわぎつばさ"],["2020-06-12T15:00:00.000Z","美作武史","みまさかたけし"],["2020-06-16T15:00:00.000Z","神楽麗","かぐられい"],["2020-06-17T15:00:00.000Z","榊夏来","さかきなつき"],["2020-07-01T15:00:00.000Z","山村賢","やまむらけん"],["2020-07-02T15:00:00.000Z","清澄九郎","きよすみくろう"],["2020-07-06T15:00:00.000Z","蒼井享介","あおいきょうすけ"],["2020-07-06T15:00:00.000Z","蒼井悠介","あおいゆうすけ"],["2020-07-21T15:00:00.000Z","黒野玄武","くろのげんぶ"],["2020-07-31T15:00:00.000Z","ピエール","ぴえーる"],["2020-08-07T15:00:00.000Z","舞田類","まいたるい"],["2020-08-18T15:00:00.000Z","水嶋咲","みずしまさき"],["2020-08-23T15:00:00.000Z","華村翔真","はなむらしょうま"],["2020-08-31T15:00:00.000Z","山下次郎","やましたじろう"],["2020-09-13T15:00:00.000Z","円城寺道流","えんじょうじみちる"],["2020-09-14T15:00:00.000Z","秋月涼","あきづきりょう"],["2020-09-23T15:00:00.000Z","桜庭薫","さくらばかおる"],["2020-10-07T15:00:00.000Z","三条悟朗","さんじょうごろう"],["2020-10-08T15:00:00.000Z","アスラン＝BBII世","あすらん・べるぜびゅーと・にせい"],["2020-10-10T15:00:00.000Z","古論クリス","ころんくりす"],["2020-10-12T15:00:00.000Z","九十九一希","つくもかずき"],["2020-10-30T15:00:00.000Z","葛之葉雨彦","くずのはあめひこ"],["2020-11-01T15:00:00.000Z","安堂鞠王","あんどうまりお"],["2020-11-07T15:00:00.000Z","東雲荘一郎","しののめそういちろう"],["2020-11-11T15:00:00.000Z","猫柳キリオ","ねこやなぎきりお"],["2020-11-21T15:00:00.000Z","秋山隼人","あきやまはやと"],["2020-11-27T15:00:00.000Z","北村想楽","きたむらそら"],["2020-12-11T15:00:00.000Z","卯月巻緒","うづきまきお"],["2020-12-17T15:00:00.000Z","白石瑛流","しらいしえる"],["2020-12-20T15:00:00.000Z","大河タケル","たいがたける"],["2020-12-23T15:00:00.000Z","信玄誠司","しんげんせいじ"],["--","齋藤孝司","さいとうたかし"],["--","カエール","かえーる"]],"sc":[["2020-01-03T15:00:00.000Z","芹沢あさひ","せりざわあさひ"],["2020-01-15T15:00:00.000Z","三峰結華","みつみねゆいか"],["2020-02-02T15:00:00.000Z","七草はづき","ななくさはづき"],["2020-02-23T15:00:00.000Z","園田智代子","そのだちよこ"],["2020-02-24T15:00:00.000Z","月岡恋鐘","つきおかこがね"],["2020-03-03T15:00:00.000Z","風野灯織","もりのりんぜ"],["2020-03-16T15:00:00.000Z","市川雛菜","いちかわひなな"],["2020-04-17T15:00:00.000Z","桑山千雪","くわやまちゆき"],["2020-04-24T15:00:00.000Z","櫻木真乃","さくらぎまの"],["2020-05-03T15:00:00.000Z","浅倉透","あさくらとおる"],["2020-05-23T15:00:00.000Z","田中摩美々","まゆずみふゆこ"],["2020-06-26T15:00:00.000Z","白瀬咲耶","しらせさくや"],["2020-07-21T15:00:00.000Z","八宮めぐる","はちみやめぐる"],["2020-07-28T15:00:00.000Z","小宮果穂","こみやかほ"],["2020-08-01T15:00:00.000Z","和泉愛依","いずみめい"],["2020-08-15T15:00:00.000Z","有栖川夏葉","ありすがわなつは"],["2020-09-22T15:00:00.000Z","幽谷霧子","しらせさくや"],["2020-10-18T15:00:00.000Z","杜野凛世","もりのりんぜ"],["2020-10-26T15:00:00.000Z","樋口円香","ひぐちまどか"],["2020-11-10T15:00:00.000Z","福丸小糸","ふくまるこいと"],["2020-11-25T15:00:00.000Z","西城樹里","さいじょうじゅり"],["2020-12-03T15:00:00.000Z","黛冬優子","まゆずみふゆこ"],["2020-12-24T15:00:00.000Z","大崎甘奈","おおさきあまな"],["2020-12-24T15:00:00.000Z","大崎甜花","おおさきてんか"],["--","天井努","あまいつとむ"]],"ds":[["2020-03-06T15:00:00.000Z","水谷絵理","みずたにえり"],["2020-06-24T15:00:00.000Z","日高愛","ひだかあい"],["2020-09-14T15:00:00.000Z","秋月涼","あきづききりょう"],["2020-10-23T15:00:00.000Z","桜井夢子","さくらいゆめこ"],["2020-12-13T15:00:00.000Z","サイネリア(鈴木彩音)","さいねりあ　すずきあやね"],["--","石川実","いしかわ みのり"],["--","岡本まなみ","おかもと まなみ"],["--","尾崎玲子","おざき れいこ"],["--","日高舞","ひだかまい"],["--","武田蒼一","たけだそういち"],["--","五十嵐局長","いがらしきょくちょう"]]}'
imassel={"cg","ml","sm","sc","ds"}
imasname={"ミリオンライブ","シンデレラ","サイドM","シャイニーカラーズ","ディアリースターズ"}

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

function parse_json_date_utc(json_date) --ISO8601datetimeparse パーサー完成版？
    local pattern = "(%d+)%-(%d+)%-(%d+)%a(%d+)%:(%d+)%:([%d+.]+)([Z%+%-])(%d?%d?):?(%d?%d?)"

    if(json_date:match(pattern)==nil)then
   
    local unix = "^(%d+)$"
    local normal = "(%d+)[%-%/](%d+)[%-%/](%d+) +(%d+)%:(%d+)%:?([%d%.]+)"--ローカル時間 YYYY/MM/DD HH:MM:ss :ssはなくてもおｋ

        if(json_date:match(normal))then
        local year, month, day, hour, minute,
        seconds = json_date:match(pattern)
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
  
  --DateUTC(2020,2,31,20,48,0,0)
  local jp_day={"日","月","火","水","木","金","土"} --%w用
  date= string.gsub(date, "%%EM",daystring)  ----フリーズ文字代替
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
  
  if(os.date("!%H%M",t)=="1500")then --0時のとき切り替え
  findday()
  end
  
  if (string.find(date,"%%i")) then
  
   local inum = (ima)%27    --imas[1] AC,dre 18 ,miri 22
   if(inum==0)then
   inum =1
   end
   local tu = elasped(imas[inum][2])
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
	local years    = math.floor(tu*10/(864000*365))
	nenme = ","..years.."周年"
	end
   local ep=get_ep(tu)
  	date =string.gsub(date, "%%is",gm..ep ..nenme)
  
  local theyear=string.format("%04d",tonumber(os.date("!%Y",os.time()+9*3600)))
  local dt = theyear .. "-".. string.format("%02d",tonumber(os.date('!%m',tt))).."-".. string.format("%02d",tonumber(os.date('!%d',tt))).."T00:00:00+09:00"
 
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
  	
  local idn=imasb[imassel[imass]][useidol][2]
  local dt=imasb[imassel[imass]][useidol][1]
  if(dt=="" or dt == nil or dt =="--")then
  	date =string.gsub(date, "%%in",idn)
  	date =string.gsub(date, "%%ib","誕生日は不明です")
  	date =string.gsub(date, "%%ic","")
  else
  dt=string.gsub(dt,"2020",theyear)
  local aniv=lefttime(dt)
  local gm = "誕生日" 
  if(aniv<0) then
  aniv =-aniv
  gm = gm.."から"
  else
  gm = gm.."まで"
  end
  local ep= string.gsub(get_ep(aniv),"0年","")
  	date =string.gsub(date, "%%in",idn)
  	date =string.gsub(date, "%%ib",JST(dt))
  	date =string.gsub(date, "%%ic",gm..ep)
  end
  	
  	local imm=imas[inum][4]
    debugtxt3=dt
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
--出力例
--サマータイム有り＋時差情報 先頭に!をつけるとUTC時間になる
--%Y/%m/%d(%Vw)%X(UTC%z%DST)

--和暦表示　令和から
-- %VR%m月%d日(%Vw)%H時%M分%S秒

--全部出し
--%UTC%n%c%DST%n%x%X%z%n%s%n%ISO%n%ISOZ%n%VR%m月%d日(%Vw)%H時%M分%S秒

--複数のタイムゾーン
--%JST%nUTC+?? %UTC%nUTC協定時間%ISOZ%nISO8601 %ISO%n

--あいますの情報を出す
--%JST%n%i%n%J%is%n%K%it%n%E%ie%n

--誕生日
--%JST%n%in%n%ib%n%ic

--独自拡張2020/04/17現在 
--%EM	あいますお誕生日何日以内のやつ
--%E	デバッグ文字1 サービス終了日
--%J	デバッグ文字2 サービス開始日
--%K	デバッグ文字3 今年の周年日
--$i	あいますゲームの名前,フリーズ防止
--%is	あいますの記念日の時間からの経過時間
--%it	あいますの記念日までの時間
--%ie	あいますのサービス終了した時間からの経過時間(データがないものは表示なし)
--%ib	アイドル名誕生日
--%ic	アイドル名誕生日までの時間
--%in	アイドル名
--%UTC  worldtime set UTCsetting,	UTC標準時からUI設定の時間を表示,サマータイムは非対応
--%JST  ISO8601表示日本時間
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
	obs.obs_properties_add_float(props, "UTC", "WorldTime UTC-14～+14(%UTC)", -14, 14, 1)
	obs.obs_properties_add_int(props, "IMAS", "IMAS", 1, 27, 1)
	obs.obs_properties_add_text(props, "im", "IM@S開始日", obs.OBS_TEXT_DEFAULT)
	obs.obs_properties_add_int(props, "IMSERIES", "誕生日アイマスシリーズ", 1, 5, 1)
	obs.obs_properties_add_text(props, "cg", "1.シンデレラ", obs.OBS_TEXT_DEFAULT)
	obs.obs_properties_add_text(props, "ml", "2.ミリオン", obs.OBS_TEXT_DEFAULT)
	obs.obs_properties_add_text(props, "sm", "3.サイドＭ", obs.OBS_TEXT_DEFAULT)
	obs.obs_properties_add_text(props, "sc", "4.シャニマス", obs.OBS_TEXT_DEFAULT)
	obs.obs_properties_add_text(props, "ds", "5.ディアリースターズ", obs.OBS_TEXT_DEFAULT)
	obs.obs_properties_add_int(props, "DAYLIM", "誕生日何日以内全部", 0, 7, 1)
	return props
end

-- A function named script_description returns the description shown to
-- the user
function script_description()
	return "Sets a text source to act as a date/time text when the source is active.\n\nMade by Ragowit"
end

function findidol(sel,s)
local st=imasb[sel]
local stlen=tonumber(#st)

if(sel=="ml")then
for i=1,stlen do
if((imasb["ml"][i][2]..imasb["ml"][i][3]):match(s))then
return i
end
end
end

if(sel=="cg")then
for i=1,stlen do
if((imasb["cg"][i][2]..imasb["cg"][i][3]):match(s))then
return i
end
end
end

if(sel=="sm")then
for i=1,stlen do
if((imasb["sm"][i][2]..imasb["sm"][i][3]):match(s))then
return i
end
end
end

if(sel=="sc")then
for i=1,stlen do
if((imasb["sc"][i][2]..imasb["sc"][i][3]):match(s))then
return i
end
end
end

if(sel=="ds")then
for i=1,stlen do
if((imasb["ds"][i][2]..imasb["ds"][i][3]):match(s))then
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
if(birth:match("Z")) then
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
if(birth:match("Z")) then
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
if(birth:match("Z")) then
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
if(birth:match("Z")) then
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
if(birth:match("Z")) then
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
if(birth:match("Z")) then
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
table.insert(tkeys, birthst[k])
end
-- sort the keys
table.sort(tkeys)

for i=1,#tkeys do
   daystring=daystring .. tkeys[i]
end

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
	ima           = obs.obs_data_get_int(settings, "IMAS")
	obs.obs_data_set_string(settings, "im",imas[ima][1]..imas[ima][3])
	imass           = obs.obs_data_get_int(settings, "IMSERIES")
	daylim           = obs.obs_data_get_int(settings, "DAYLIM")
	cgn =findidol("cg",cut_string(obs.obs_data_get_string(settings, "cg"),20))
	mln =findidol("ml",cut_string(obs.obs_data_get_string(settings, "ml"),20))
	smn =findidol("sm",cut_string(obs.obs_data_get_string(settings, "sm"),20))
	scn =findidol("sc",cut_string(obs.obs_data_get_string(settings, "sc"),20))
	dsn =findidol("ds",cut_string(obs.obs_data_get_string(settings, "ds"),20))
	local inum={cgn,mln,smn,scn,dsn}
	useidol=inum[imass]
	findday()
	
	reset(true)
end

-- A function named script_defaults will be called to set the default settings
function script_defaults(settings)
	obs.obs_data_set_default_string(settings, "format_string", "%Y/%m/%d(%Jw)%X(UTC%z)") --"%Y-%m-%d %X")
	obs.obs_data_set_default_double(settings, "UTC", 9)
	obs.obs_data_set_default_int(settings, "IMAS", 18)
	obs.obs_data_set_default_string(settings, "im",imas[1][1]..imas[1][3])
	obs.obs_data_set_default_int(settings, "IMSERIES", 1)
	obs.obs_data_set_default_string(settings, "ml","エミリー・スチュアート")
	obs.obs_data_set_default_string(settings, "cg","道明寺歌鈴")
	obs.obs_data_set_default_string(settings, "sm","冬美旬")
	obs.obs_data_set_default_string(settings, "sc","芹沢あさひ")
	obs.obs_data_set_default_string(settings, "ds","水谷絵理")
	obs.obs_data_set_default_string(settings, "ds","水谷絵理")
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