$(document).ready(function(){
  console.log('What up');
  var $login = $('#login');
  var $signin = $('#signin');

  $login.click(function(){
    $('.login').fadeIn(1000);
  });
  $signin.click(function(){
    $('.signin').fadeIn(1000);
  });

});
