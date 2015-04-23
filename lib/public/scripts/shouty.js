$(function () {

  var $registrationForm = $("#registration form");
  var $feed = $("#feed");
  var $shoutForm = $feed.find("form");

  var name, position;

  $feed.hide();

  $registrationForm.submit(function (e) {
    e.preventDefault();
    name = $("#name").val();
    position = $("#position").val();
    var payload = {
      name: name,
      position: position
    };
    $.post("/register", payload, function () {
      $registrationForm.hide();
      $feed.find('.name').text(name);
      $feed.find('.position').text(position);
      $feed.show();
      setInterval(function () {
        $.get("/last-message", {name: name}, function (message) {
          $feed.find('.last-heard-message').text(message);
        })
      }, 1000);
    });
  });

  $shoutForm.submit(function (e) {
    e.preventDefault();
    var message = $("#message").val();
    $("#message").val("");
    $.post("/shout", { name: name, message: message });
  });
});
