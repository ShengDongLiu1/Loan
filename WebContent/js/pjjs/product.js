$(function(){
	//页面初始化
	utils.initPage();
	$('#hengjin').show();
	hashChange();
	$('.sub-a-nav a').click(function(){
		if($(this).hasClass('active')){
			return ;
		}
		var index = $(this).index();
		$(this).addClass('active').siblings('a').removeClass('active');
		$('.em-line').animate({'left':40+index*120+'px'},500);
		$('.sub-a-box').eq(index).show().siblings('.sub-a-box').hide();
	})
});
function hashChange(){
	var hash = location.hash.replace('#','');
	switch(hash){
	case 'hengjinb':
		$('#hengjin').show().siblings('.sub-a-box').hide();
		$('.sub-a-nav a').eq(0).addClass('active').siblings('a').removeClass('active');
		$('.em-line').animate({'left':'40px'},500);
		break;
	case 'pujinb':
		$('#pujin').show().siblings('.sub-a-box').hide();
		$('.sub-a-nav a').eq(1).addClass('active').siblings('a').removeClass('active');
		$('.em-line').animate({'left':'160px'},500);
		break;
	case 'duojinb':
		$('#duojin').show().siblings('.sub-a-box').hide();
		$('.sub-a-nav a').eq(2).addClass('active').siblings('a').removeClass('active');
		$('.em-line').animate({'left':'280px'},500);
		break;
	default : 
		$('#hengjin').show().siblings('.sub-a-box').hide();
		$('.sub-a-nav a').eq(0).addClass('active').siblings('a').removeClass('active');
		$('.em-line').animate({'left':'40px'},500);
	break;
};
}