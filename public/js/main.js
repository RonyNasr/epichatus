window.onload= function(){
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
    console.log('user list revealed');
    $('.chat_div').slideToggle(500);
  });
  $('.chat').click(function(){
    $(this)
  });
  $('.minus').click(function(){
    $(this).closest("section").children(".discussion").toggle();
    $(this).siblings(".plus").show();
    $(this).hide();
  });
  $('.plus').click(function(){
    $(this).closest("section").children(".discussion").toggle();
    $(this).siblings(".minus").show();
    $(this).hide();
  });
  $('.exit').click(function(){
    $(this).closest("section").toggle();
  });

  // $('.layer').animate({
  //     'opacity': 1
  // }, 2000);

};
