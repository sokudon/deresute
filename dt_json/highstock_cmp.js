
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
        		    text: '<b>'+ibe_type +'　けいかじかんひかく</b>'
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
        		        text: '経過時間　日時分(day hour:minutes)'
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
        $button50 = $('#50'),
        $button12 = $('#1200'),
        $buttonmd = $('#md'),
        $buttonal = $('#all');
		
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
        
    $button1.click(function (){
		houji("100位");
    });
    $button5.click(function () {
		houji("500位");
    });
    $button50.click(function () {
		houji("50位");
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
'%e日目%H時間%M分',
'%e日目%H時間%M分<br>(%p)<br>' //YYYMMDDHHmm有り
];
//dtd=1;

var youbi =['日', '月', '火', '水', '木', '金', '土'];

//PM表示を改造
function GETTIMEZ(a){
a =a  -Date.UTC(2014,0,1,9,0)+ibe_kaishi;
var k= new Date(a);
var s= 
(k.getMonth()+1) +"月"+
(k.getDate()) +"日 "+
youbi[k.getDay()] +" "+
(k.getHours()) +"時" +
k.getMinutes() +"分";

return s;
}