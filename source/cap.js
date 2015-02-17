
var casper = require('casper').create();

var username = "";
var password = "";
var hostname = casper.cli.get("hostname");
var count = casper.cli.get("count") + ".png";

//　Basic認証を入れる場合はここに判定と値を記入
// if(hostname.match(/hogehoge/)){
// 	username = "foo";
// 	password = "bar";
// 	casper.echo("match gokakunin2");
// }

casper.options.pageSettings.userName = username;
casper.options.pageSettings.password = password;

casper.start(hostname,function(){
	this.capture(count);
})

casper.run();