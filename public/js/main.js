window.onload= function(){
  console.log('What up');
  var $login = $('#login');
  var $signin = $('#signin');
  var $chats = $('#chats');

  $login.click(function(){
    $('.login').fadeIn(1000);
    $('.signin').hide();
    $('.error').hide();
  });
  $signin.click(function(){
    $('.signin').fadeIn(1000);
    $('.login').hide();
    $('.error').hide();
  });
  $chats.click(function(){
    console.log('im fucking clicking');
    $('.chat_div').slideToggle(500);
  });

  // $('.layer').animate({
  //     'opacity': 1
  // }, 2000);

};
