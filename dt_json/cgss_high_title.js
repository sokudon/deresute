
var ibe_title = "<b>ぼだ</b>";
var ibe_rank = "<b>--</b>";
var ibe_fes = ibe_title;
var display300 =false;

var ibe_point = 'pt';

var ibe_type = "あたぽんぼだ";



//highstockりあるたいむよう　おぷしょん
var tosikosi=false;//年こし数字補正用、年末時はtrue

var base_year=2019;//ぼだ開始年
var BYEAR="2019";
var BYEARN="";

var timezone =-((new Date("2014-01-01T00:00:00Z")).getTimezoneOffset()/60)*3600*1000;//2014時　windowsの時計
var jst =9*3600*1000;


//2019/11/26　https://script.googleusercontent.com/macros/echo?user_content_key=lki_a2OA4PfcQgrTdxvgm-sDFVs0xqpZdVh0_9upcEyHpWlU3pj3eTFlEOjA3Vdgl_U6PaP7w1SlvJZq2B922Bf5wX2liHefm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnEdYs-SHhnypKUTiEZm3SCArUXFrY-Pqes1qZkWvFnS65t53M_2aEoWlR3RThGMpelrAtyz7VYaP&lib=M8drSt-VyvTtx6tm2NqCpPnndBJ9ix56c
//ぐぐるからしゅとく
var tyukanend	= new Date(2019,3,25,15,0);//いべんと開始日時 月-1
var ibe_kaishi	=moment(ibekaishi).utc();//いべんと開始日時 月-1
var ibe_end		=moment(ibeowari).utc();//いべんと終了日時 月-1


//2019/11/20 15:00	2019/11/27 21:00 mente 28

var ibe_owari=ibe_end - ibe_kaishi+Date.UTC(2014,0,1,0,0)-timezone;

var dtd=1;//つーるちっぷ;０でいべんと日付のみ　こんぺあは経過時間のみ、1で両方表示
