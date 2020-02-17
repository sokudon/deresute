
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
        numericSymbols: null   // 1000を1kと表示しない
      }

 });
$('#container').highcharts('StockChart', {
	    	    chart: {
    	        type: 'spline',
        	    zoomType: 'x'
		        },
		        title: {
        		    text: '<b>' + ibe_type +'　かこぼだひかく</b>'
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
			        inputDateFormat: '%B%e日%H時%M分',
        			inputEditDateFormat: '%B%e日%H時%M分',
        			inputBoxWidth: 140,
        			inputDateParser: function (value) {
                value = value.split(/[月日時分]/);
                var dddd= Date.UTC(base_year,
                    parseInt(value[0], 10)-1,
                    parseInt(value[1], 10),
                    parseInt(value[2], 10),
                    parseInt(value[3], 10));
                    if(tosikosi && value[0]==1){
                    dddd += (Date.UTC(base_year,0,1,0,0)-Date.UTC(base_year-1,0,1,0,0));
                    }
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
        		        text: '日時(day hour:minutes)'
		            },
		            plotLines: [{
	                color: '#FF0000',
    	            width: 1,
        	        value: ibe_kaishi+ibe_owari-Date.UTC(2014,0,1,0,0)
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
	    			//top: 200
			    },
                tooltip: {
				shared: true,
	            useHTML: true,
           		headerFormat: '<b>{point.key}</b><table>',
				pointFormat: '<tr style="line-height : 80%;"><td style="color: {series.color};">{series.name}</td>' +
                '<td style="text-align: right;color: {series.color}">{point.y} pt</td></tr>',
         		footerFormat: '</table>',
         		xDateFormat: dtf[dtd]
                },
			    series: border_data
      });
      
    var chart = $('#container').highcharts(),
        $button1 = $('#100'),
        $button5 = $('#500'),
        $button12 = $('#1200'),
        $buttonmd = $('#md'),
        $buttonal = $('#all'),
        $buttonbd = $('#bdcmp');
		
	function houji(d){
	    for(var i=0;i<chart.series.length;i++){
        if(chart.series[i].name.indexOf(d)<0){
            chart.series[i].hide();
        }
        else if(!chart.series[i].visible){
            chart.series[i].show();
        }}
    return false;
    }
    
	$buttonbd.click(function (){
	merge_pos=!merge_pos;
	border_data=[];
	border_merge();
	convert_left_time(border_data);
	while(chart.series.length>6){
	chart.series[0].remove();
	}
	for(var i=6;i<border_data.length;i++){
	chart.addSeries(border_data[i]);
	}
	})
    $button1.click(function (){
		houji("100位");
    });
    $button5.click(function () {
		houji("500位");
    });
    $button12.click(function () {
		houji("1200位");
    });
    $buttonal.click(function () {
		houji("位");
    });
    $buttonmd.click(function () {
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


var dtf=[
'%e日%H時間%M分',
'%Y年%e日%H時間%M分<br>(%p)<br>' //YYYMMDDHHmm有り
];

var youbi =['日', '月', '火', '水', '木', '金', '土'];

function border_merge(){
$.get("./dt_json/bd_high_cmp.js",function(data){
var border=[];
for(var i=0;i<base.length;i++){
border[i]=[];
border[i]['name'] = base[i]['name'];
border[i]["data"] = base[i]['data'].concat(real[i]['data']);
}
var tmp=data.replace(/var.*?=/,"").replace(/\/\/.+/,"");
border_data=border.concat(JSON.parse(tmp));
convert_left_time(border_data);
});
}


	
//PM表示を改造
function GETTIMEZ(a){
var ibe_otsu = ibe_kaishi+ibe_owari-Date.UTC(2014,0,1,0,0);
if(merge_pos){
a = ibe_otsu-a;
}
else{
a = a-ibe_kaishi-9*3600*1000;
}
var k= new Date(a);
var s=
((k.getDate())-1) +"日"+
(k.getHours()) +"時" +
k.getMinutes() +"分";

if(merge_pos){
s= "あと"+s;
}
else{
s+="経過";
}

return s;
}


function convert_left_time(bd){

var ini = ibe_kaishi-Date.UTC(2014,0,1,0,0);
var ibe_len = ibe_owari-Date.UTC(2014,0,1,-9,0);
var offset = 0;
for(var j=0;j< bd.length;j++){
if(bd[j].name.match(/[a-z\-\/]+/)!=null){
if(merge_pos){
offset = ibe_len-(bd[j].data[bd[j].data.length-1][0]-bd[j].data[0][0]);
}}
for(var i=0;i< bd[j].data.length;i++){
bd[j].data[i][0] += (offset+ini);
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

