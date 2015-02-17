var casper = require('casper').create({
	pageSettings: {
		userName: '',
		password: ''
	}
});

casper.options.pageSettings.userName = 'tstwww';
casper.options.pageSettings.password = 'Fg6jNcsp';

casper.start("http://tstwww.jfr-card.co.jp/cocodecow/index.html",function(){
	this.wait(1000,function () {
		this.capture("test.png");
	});
});

casper.run();