(function() {
  $(function() {
    return setInterval((function() {
      var ageInYears, birth, birthTime, days, hours, minutes, now, time, years;
      minutes = 1000 * 60;
      hours = minutes * 60;
      days = hours * 24;
      years = days * 365;
      now = new Date;
      birth = new Date(1979, 7, 27, 21, 44);
      time = now.getTime();
      birthTime = birth.getTime();
      ageInYears = (time - birthTime) / years;
      $("span.age").html(ageInYears.toFixed(14));
    }), 1000);
  });

}).call(this);
