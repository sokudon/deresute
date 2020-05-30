
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


//2019/11/26　https://script.googleusercontent.com/macros/echo?user_content_key=YTZcFok8T7oOnIKYUDmOdJqiOvPHmTkhAnQJl5N-Zc0_DtvXZtBSwnot7ZcwNQQ3KstN3xy0A8XluPX0Uxy838A1gQSDhYfmm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnBT4TQs36VO96QWKkeEvLb4kY7NZNTJJI6nWH3wTET7baA6SKyZsjrbCeKHyoiDHCOrH0QulUKuK&lib=Mz9c-W5b2oX_w2vwGZs-LgHndBJ9ix56c
//ぐぐるからしゅとく
var tyukanend	= new Date(2019,3,25,15,0);//いべんと開始日時 月-1
var ibe_kaishi	=moment(ibekaishi).utc();//いべんと開始日時 月-1
var ibe_end		=moment(ibeowari).utc();//いべんと終了日時 月-1


var pendend=pendendtime();

function pendendtime(){
if(ibeowari=="" || ibeowari=="--"){
pendend="<br>※終了時未定のためイベント時間および達成率は非表示です";
}
return;
}


//2019/11/20 15:00	2019/11/27 21:00 mente 28

var ibe_owari=ibe_end - ibe_kaishi+Date.UTC(2014,0,1,0,0)-timezone;

var dtd=1;//つーるちっぷ;０でいべんと日付のみ　こんぺあは経過時間のみ、1で両方表示

var DMS=true;//日時分とジフン切り替え
var RM=false;//りある時間
var PER=false;//PER

var defaultdate="YYYY/MM/DD HH:mm";
var timediff = moment(ibekaishi);//csv出力

var outputdt=[
//localtime,elasted time https://www.atmarkit.co.jp/fdotnet/vb6tonet/vb6tonet05/vb6tonet05_01.html
//https://ja.wikipedia.org/wiki/%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E6%99%82%E5%88%BB
moment("1899/12/30 00:00"),//null dummy
moment("0001/01/01 12:00"), //vbnet C# PowerShell
moment("1899/12/30 00:00"), //vb6,googlesp
moment("1970-01-01 00:00"), //js,epoc
moment("2014-01-01 00:00"), //sokudon
moment("1970-01-01 00:00"), //js,epoc excel
moment("1970-01-01 00:00"), //js,epoc
moment(ibekaishi),//null dummy
moment(ibekaishi),  //2020-02-29T12:00:00+09:00 realtime
moment(ibekaishi),  //2020-02-29T12:00:00+09:00 realtime
moment(ibekaishi),  //2020-02-29T12:00:00+09:00 realtime
moment(ibekaishi),  //2020-02-29T12:00:00+09:00 realtime
moment(ibekaishi),  //2020-02-29T12:00:00+09:00 realtime
moment(ibekaishi)];  //2020-02-29T12:00:00+09:00 realtime

var seltxt="イベント開始りある時間(現地) realtime";
/*
<option>--経過時間で出力--</option>
<option>0001/01/01 12:00:00 VB.NET</option>
<option>1899/12/30 00:00:00 VB6,M$エクセル、googleスプレッドシート</option>
<option>1899/12/30 00:00:00 シリアル値VB6,M$エクセル、googleスプレッドシート</option>
<option>1970-01-01 00:00:00 JS,エポック秒</option>
<option>2014-01-01 00:00:00 sokudon</option>
<option>0～ エポック秒</option>
<option>--イベント時間で出力(現イベ基準)--</option>
<option selected="selected">イベント開始りある時間(現地) realtime</option>
<option>イベント開始りある時間 toString()英語表記？</option>
<option>イベント開始りある時間 エクセルシリアル値</option>
<option>イベント開始りある時間ISO8601 realtime</option>
<option>イベント開始りある時間ISO8601 unixtime</option>
<option>イベント開始りある時間 エポック秒</option>
</select>
*/