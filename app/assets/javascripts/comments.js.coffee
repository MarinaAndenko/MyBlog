# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "submit", "#new_form", (e) ->
  e.preventDefault()
  $form = $ this

  $.post "#{$form.attr 'action'}.json", $form.serializeArray(), (@comment) ->
    $user = $('<span>').text comment.user.username
    $createdAt = $('<span>').text comment.created_at
    $body = $('<span>').text comment.body
    $newComment = $('<div class="comment-list">').append($text).append $createdAt
    $('.comment-list:last').after $newComment
