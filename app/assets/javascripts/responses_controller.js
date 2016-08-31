// Generated by CoffeeScript 1.10.0
(function() {
  $(function() {
    var ANIMATION_TIME, card, close, envelope, envelopeUp, send;
    ANIMATION_TIME = 500;
    envelope = $('#envelope');
    envelopeUp = $('#envelope-up');
    card = $('#card');
    close = $('#close');
    send = $('#mailit');
    envelope.click(function() {
      if (!$(this).hasClass('flip')) {
        $(this).removeClass('pulse');
        $(this).addClass('flip');
        envelopeUp.fadeOut(ANIMATION_TIME);
        window.setTimeout((function() {
          card.find('h1').hide().fadeIn(300);
          card.css('display', 'block');
        }), ANIMATION_TIME);
      }
    });
    close.click(function(e) {
      card.css('display', 'none');
      envelope.removeClass('flip').addClass('flip-back');
      envelopeUp.fadeIn(ANIMATION_TIME);
      window.setTimeout((function() {
        envelope.removeClass('flip-back');
        envelope.addClass('pulse');
      }), ANIMATION_TIME);
      e.stopPropagation();
    });
    actions.click(function(e) {
      var valuesToSubmit;
      alert("post created");
      valuesToSubmit = $('form').serialize();
      $.ajax({
        type: 'POST',
        url: $('form').attr('action'),
        data: valuesToSubmit,
        dataType: 'JSON'
      }).success(function(json) {
        console.log('success', json);
      });
      false;
      card.css('display', 'none');
      envelope.removeClass('flip').addClass('send');
      e.stopPropagation();
    });
  });

}).call(this);
