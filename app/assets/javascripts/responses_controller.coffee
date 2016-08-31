# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  ANIMATION_TIME = 500
  envelope = $('#envelope')
  envelopeUp = $('#envelope-up')
  card = $('#card')
  close = $('#close')
  send = $('#mailit')
  
  envelope.click ->
    if !$(this).hasClass('flip')
      $(this).removeClass 'pulse'
      $(this).addClass 'flip'
      envelopeUp.fadeOut ANIMATION_TIME
      window.setTimeout (->
        card.find('h1').hide().fadeIn 300
        card.css 'display', 'block'
        return
      ), ANIMATION_TIME
    return
  close.click (e) ->
    card.css 'display', 'none'
    envelope.removeClass('flip').addClass 'flip-back'
    envelopeUp.fadeIn ANIMATION_TIME
    window.setTimeout (->
      envelope.removeClass 'flip-back'
      envelope.addClass 'pulse'
      return
    ), ANIMATION_TIME
    e.stopPropagation()
    return
  
  actions.click (e) ->
    alert("post created");
    valuesToSubmit = $('form').serialize()
    $.ajax(
      type: 'POST'
      url: $('form').attr('action')
      data: valuesToSubmit
      dataType: 'JSON').success (json) ->
      console.log 'success', json
      return
    false
    card.css 'display', 'none'
    envelope.removeClass('flip').addClass 'send'
    e.stopPropagation()
    return
  return
  
    
