
$(function () {
Highcharts.setOptions({global: { useUTC: false},
// http://architect-wat.hatenablog.jp/entry/20130320/1363786174　日本語化ここを参考
      lang: {  // 言語設定
        rangeSelectorZoom: '表示範囲',
        resetZoom: '表示期間をリセット',
        resetZoomTitle: '表示期間をリセット',
        rangeSelectorFrom: '表示期間',
        rangeSelectorTo: '～',
        //printButtonTitle: 'チャートを印刷',
        printChart : 'チャートを印刷',
        exportButtonTitle: '画像としてダウンロード',
        downloadJPEG: 'JPEG画像でダウンロード',
        downloadPDF: 'PDF文書でダウンロード',
        downloadPNG: 'PNG画像でダウンロード',
        downloadSVG: 'SVG形式でダウンロード',
        months: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        weekdays: ['日', '月', '火', '水', '木', '金', '土'],
        numericSymbols: null,   // 1000を1kと表示しない,
        thousandsSep: ","
      }

 });
$('#container').highcharts('StockChart', {
	    	    chart: {
    	        type: 'spline',
        	    zoomType: 'x',
		        },
		        title: {
        		    text: '<b>' + ibe_type +'　のこりじかんひかく</b>'
		        },
        		subtitle: {
            		text: 'グラフ内ドラックで拡大,見出しクリックで表示/非表示'
		        },
				credits: {
				text: 'SOKUDON with highchart',
				href: 'https://docs.google.com/spreadsheet/pub?key=0ArIs57u-VlLWdHlaSk1NY2kzcnNFbjg3b2xNaXJUbnc&output=html'
				},
                rangeSelector: {
                    inputEnabled: $('#container').width() > 480,
			        inputDateFormat: '%e日%H時%M分',
        			inputEditDateFormat: '%e日%H時%M分',
        			inputBoxWidth: 100,
        			inputDateParser: function (value) {
                value = value.split(/[日時分]/);
                //1388502000000= 2014/1/1 0:00
                var dddd = Date.UTC(2014,0,
                parseInt(value[0], 10)+1,
                parseInt(value[1], 10),
                parseInt(value[2], 10));
                return dddd;
            		},
			        buttons : [{ //6つまで
          //type : 'minute', count : 5,text : '5m'}, {
          //type : 'minute',           count : 10,text : '10m'  }, {
          //type : 'minute',count : 30,text : '30m' }, {
          type : 'hour',           count : 1,               text : '1h'       
          }, {
          //   type : 'hour',count : 4,text : '4h'}, {
          type : 'hour', 
          count : 8,     
          text : '8h'       
          }, {
          type : 'hour', count : 12,text : '12h'},{
          type : 'day', 
          count : 1,     
          text : '1d'       
          }, {
          type : 'day', 
          count : 5,     
          text : '5d'       
          }, {
          type : 'all',    
          count : 1,
          text : 'All'
          }]
          },
        		xAxis: {
            		type: 'datetime',
		            dateTimeLabelFormats: { // don't display the dummy year
		            millisecond: '%M分',
					second: '%M分',
					minute: '%H時%M分',
					hour: '%H時',
					day: '%e日',
					},
		            title: {
        		        text: '残時間　日時分(day hour:minutes)'
		            },
		            plotLines: [{
	                color: '#FF0000',
    	            width: 1,
        	        value: ibe_owari //Date.UTC(2014,0,7,7,0)+15*3600*1000
            		}],
	            	minRange: 10*60*1000
            	},
	       		 yAxis: {
            		title: {
                		text: 'ぼだ pt'
		            },
                    plotLines: [{
                        value: 0,
                        width: 2,
                        color: 'silver'
                    }],
        	    min: 0
		        },
        		legend: {
            		enabled: true,
            		maxHeight: 100,
		         },
	    		navigator: {
	    			 xAxis: {
            			type: 'datetime',
            				labels: {
                				formatter: function () {
                   		 return GETTIMEx(this.value);
                		}}
            		},
			    },
                tooltip: {
				shared: true,
	            useHTML: true,
	            //headerFormat: '<b>{point.key}</b><table>',
				//pointFormat: '<tr style="line-height : 80%;"><td style="color: {series.color};">{series.name}</td>' +
                //'<td style="text-align: right;color: {series.color}">{point.y} pt</td></tr>',
         		//footerFormat: '</table>',
         		//xDateFormat: dtf[dtd],
           		formatter: function () {
                return GETdiff(this);
                }
                },
			    series: border_data
      });
      
var chart = $('#container').highcharts(),
        $button1 = $('#501'),
        $button5 = $('#2001'),
        $button51 = $('#5001'),
        $button50 = $('#10001'),
        $button501 = $('#50001'),
        $button12 = $('#20001'),
        $button13 = $('#60001'),
        $button14 = $('#120001'),
        $buttonal = $('#all');
		
	function houji(d){
	    for(var i=0;i<chart.series.length;i++){
        if(chart.series[i].name.indexOf(d)<0){
            chart.series[i].hide();
        }
        else if(d=="20001位"){
            if(chart.series[i].name.indexOf("120")>=0){
            chart.series[i].hide();
        	}
        	else if(!chart.series[i].visible){
            chart.series[i].show();
        	}
        }
        else if(!chart.series[i].visible){
            chart.series[i].show();
        }}
    return false;
    }
        
    $button51.click(function (){
		houji("5001位");
		diff=1;
    });
    $button501.click(function (){
		houji("50001位");
		diff=1;
    });
    $button1.click(function (){
		houji("501位");
		diff=1;
    });
    $button5.click(function () {
		houji("2001位");
		diff=1;
    });
    $button50.click(function () {
		houji("10001位");
		diff=1;
    });
    $button12.click(function () {
		houji("20001位");
		diff=1;
    });
    $button13.click(function () {
		houji("60001位");
		diff=1;
    });
    $button14.click(function () {
		houji("120001位");
		diff=1;
    });
    $buttonal.click(function () {
		houji("位");
		diff=0;
    });
    $buttonmd.click(function () {
		diff=0;
    var st=document.getElementById('seek_n').value;
    var m=st.match("^/(.+)/$");
	if(m!=null){
	var l=m[0].match("^/(.+)/$");
	var rg = st.replace(st,l[1]);
	    for(var i=0;i<chart.series.length;i++){
        if(chart.series[i].name.match(rg)==null){
            chart.series[i].hide();
        }
        else if(!chart.series[i].visible){
            chart.series[i].show();
        }}
	}
	else{
	houji(st);
	}
    });
});

var diff=0

var dtf=[
'%e日%H時間%M分',
'%e日%H時間%M分<br>(%p)<br>' //YYYMMDDHHmm有り
];
//dtd=1;

var youbi =['日', '月', '火', '水', '木', '金', '土'];


function GETdiff(chart){
var a= chart.x;
var k= new Date(a);
var d=(k.getDate()-1)+"日";
var h=(k.getHours())+"時";
var m=k.getMinutes()+"分";

var s="";
if(diff){
s= "<b>残り"+d+h+m+"</b>("+GETTIMEZ(a)+")<br><table class=\"border\">";
if(diff){
s+= "<thead><tr><th>比較対象らんきんぐ</th><th>ぽいんと</th><th>"+chart.points[0].series.name+"との差</th><th>〃比率</th></tr></thead>";
}
else{
s+= "<thead><tr><th>らんきんぐ</th><th>ぽいんと</th></tr></thead>";
}

var base=chart.points[0].y;
for(var i=0;i<chart.points.length;i++){
s+='<tr><td style=\"color: '
+chart.points[i].color
+';\">'
+chart.points[i].series.name
+'</td><td style=\"color: '
+chart.points[i].color
+';\">'
+addc(chart.points[i].y)
+'</td>';
if(diff&&i>0){
s+='<td style=\"color: '
+chart.points[i].color
+';\">'
+ addc(base-chart.points[i].y) +"</td>"
+'<td style=\"color: '
+chart.points[i].color
+';\">'
+addc((base/chart.points[i].y).toFixed(3)) +"</td>";
}
s+="</tr>";
}
s+="</table>";


document.getElementById("tbl").innerHTML=s;
}else{
document.getElementById("tbl").innerHTML="";

}


s= "<b>残り"+d+h+m+"</b><br>("+GETTIMEZ(a)+")<br><table>";
for(var i=0;i<chart.points.length;i++){
s+='<tr style=\"line-height : 80%;"><td style=\"color: '
+chart.points[i].color
+';\">'
+chart.points[i].series.name
+'</td>'
+'<td style=\"text-align: right;color: '
+chart.points[i].color
+';\">'
+addc(chart.points[i].y)
+' pt</td>';
//s+=chart.points[i].series.name +";" +chart.points[i].y;
s+="</tr>";
}
s+="</table>";

return s;


}


function GETTIMEx(a){
var k= new Date(a);
var d=(k.getDate()-1);
var h=(k.getHours());
var m=k.getMinutes();
if(m){return m+"分";}
if(h){return h+"時";}

return d+"日";


}

//PM表示を改造
function GETTIMEZ(a){
a =ibe_kaishi+ibe_owari-a -9*3600*1000;
var k= new Date(a);
var s= 
(k.getMonth()+1) +"月"+
(k.getDate()) +"日 "+
youbi[k.getDay()] +" "+
(k.getHours()) +"時" +
k.getMinutes() +"分";

return s;
}


//正規でカンマつける
function addc(a){
	return String(a).replace(/(\d)(?=(\d\d\d)+(?!\d))/g,'$1,');
}

function convert_left_time(bd){

var end = ibe_owari;
var ini = Date.UTC(2014,0,1,-9,0);
for(var j=0;j< bd.length;j++){
if(bd[j].name.match(/[a-zA-Zあ-ン\-\/]+/)!=null){
end = bd[j].data[bd[j].data.length-1][0]
-bd[j].data[0][0]+ini;
}
for(var i=0;i< bd[j].data.length;i++){
bd[j].data[i][0] = end - bd[j].data[i][0] + ini;
}}

for(var j=0;j< bd.length;j++){
bd_qs=bd[j].data;
bd_qs.sort(
function(a,b){
if( a[0] > b[0] ) return 1;
if( a[0] < b[0] ) return -1;
return 0;
});
}
return bd;
}

