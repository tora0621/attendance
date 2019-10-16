// function set2fig(num) {
//   // 桁数が1桁だったら先頭に0を加えて2桁に調整する
//   var ret;
//   if( num < 10 ) { ret = "0" + num; }
//   else { ret = num; }
//   return ret;
// }
// function showClock2() {
//   var nowTime = new Date();
//   var nowHour = set2fig( nowTime.getHours() );
//   var nowMin  = set2fig( nowTime.getMinutes() );
//   var nowSec  = set2fig( nowTime.getSeconds() );
//   var msg = "現在時刻は、" + nowHour + ":" + nowMin + ":" + nowSec + " です。";
//   document.getElementById("RealtimeClockArea2").innerHTML = msg;
// }
// setInterval('showClock2()',1000);

$(function(){
  $('#demo1').text(new Date());
});

$(function(){
  setInterval(function(){
    $('#demo2').text(new Date());
  }, 1000);
});

$(function(){
  var now = new Date();
  var y = now.getFullYear();
  var m = now.getMonth() + 1;
  var d = now.getDate();
  var w = now.getDay();
  var wd = ['日', '月', '火', '水', '木', '金', '土'];
  var h = now.getHours();
  var mi = now.getMinutes();
  var s = now.getSeconds();
  $('#demo3').text(y + '年' + m + '月' + d + '日' + h + '時' + mi + '分' + s + '秒' + '(' + wd[w] + ')');
})

$(function(){
  setInterval(function(){
  var now = new Date();
  var y = now.getFullYear();
  var m = now.getMonth() + 1;
  var d = now.getDate();
  var w = now.getDay();
  var wd = ['日', '月', '火', '水', '木', '金', '土'];
  var h = now.getHours();
  var mi = now.getMinutes();
  var s = now.getSeconds();
  $('#demo4').text(y + '年' + m + '月' + d + '日' + h + '時' + mi + '分' + s + '秒' + '(' + wd[w] + ')');
  }, 1000);
});

$(function(){
  setInterval(function(){
  var now = new Date();
  var y = now.getFullYear();
  var m = now.getMonth() + 1;
  var d = now.getDate();
  var w = now.getDay();
  var wd = ['日', '月', '火', '水', '木', '金', '土'];
  var h = now.getHours();
  var mi = now.getMinutes();
  var s = now.getSeconds();
  var mm = ('0' + m).slice(-2);
  var dd = ('0' + d).slice(-2);
  var hh = ('0' + h).slice(-2);
  var mmi = ('0' + mi).slice(-2);
  var ss = ('0' + s).slice(-2);
  $('#demo5').text(y + '年' + mm + '月' + dd + '日' + hh + '時' + mmi + '分' + ss + '秒' + '(' + wd[w] + ')');
  }, 1000);
});
