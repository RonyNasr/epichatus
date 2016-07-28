var scheme   = "ws://";
var uri      = scheme + window.document.location.host + "/";
var ws       = new WebSocket(uri);

ws.onmessage = function(message) {
  var data = JSON.parse(message.data);
  console.log(data)
  if(data === true){
    window.location.replace("/two_player/game");
  }
};

// public/assets/js/application.js
$("#input-form").on("submit", function(event) {
  event.preventDefault();
  var handle = $("#input-handle")[0].value;
  var text   = $("#input-text")[0].value;
  ws.send(JSON.stringify({ handle: handle, text: text }));
  $("#input-text")[0].value = "";
});
