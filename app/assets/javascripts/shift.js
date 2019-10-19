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
  $('#clock_date').text(y + '年' + mm + '月' + dd + '日'  + '(' + wd[w] + ')');
  $('#clock_time').text(hh + ':' + mmi + ':' + ss);
  }, 1000);
});


