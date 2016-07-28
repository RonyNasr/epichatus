$(function(){
  $(".send").click(function(){
    client = Faye

    url = '/conversation/' +  this.id
    body = $("#body-"+this.id).val()
    client.publish(url, {text: body})
  });
});
