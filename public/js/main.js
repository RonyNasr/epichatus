$(document).ready(function(){
  console.log('What up');
  var $login = $('#login');
  var $signin = $('#signin');
  var $chats = $('#chats');

  $login.click(function(){
    $('.login').fadeIn(1000);
  });
  $signin.click(function(){
    $('.signin').fadeIn(1000);
  });
  $chats.click(function(){
    console.log('im fucking clicking');
    $('.chat_div').slideToggle(500);
  });
});
