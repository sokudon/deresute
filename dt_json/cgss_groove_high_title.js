
var ibe_title = "<b>ぼだ</b>";
var ibe_rank = "<b>--</b>";
var ibe_fes = ibe_title;
var display300 =false;

var ibe_point = 'pt';

var ibe_type = "グルーブぼだ";



//highstockりあるたいむよう　おぷしょん
var tosikosi=false;//年こし数字補正用、年末時はtrue

var base_year=2019;//ぼだ開始年
var BYEAR="2019";
var BYEARN="";


//10/6(金) 12:00 ～ 10/16(月) 23:59
var tyukanend	= new Date(2019,2,25,15,0);//いべんと開始日時 月-1
var ibe_kaishi	=moment(ibekaishi).add('hours',9);//いべんと開始日時 月-1
var ibe_end		=moment(ibeowari).add('hours',9);;//いべんと終了日時 月-1

var ibe_owari=ibe_end - ibe_kaishi+Date.UTC(2014,0,1,-9,0);


var dtd=1;//つーるちっぷ;０でいべんと日付のみ　こんぺあは経過時間のみ、1で両方表示
