# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('.glyphicon-option-horizontal').click (event) ->
    		current = $(this)
    		micropost_id = current.data("id")
    		event.preventDefault();
    		if current.parent().siblings(".comments").length > 0
    				current.parent().siblings(".comments").remove()
    		else
    				$.get "/comments?micropost_id=#{micropost_id}", (data) ->
    			      current.parent().after data

