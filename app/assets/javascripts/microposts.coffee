# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	#点击显示与隐藏评论
	$('.glyphicon-option-horizontal').click (event) ->
		current = $(this)
		micropost_id = current.data("id")
		event.preventDefault();
		if current.parent().siblings(".comments").length > 0
			current.parent().siblings(".comments").remove()
		else
			$.get "/comments?micropost_id=#{micropost_id}", (data) ->
				current.parent().after data
	#点赞
	$('.glyphicon-thumbs-up').click (event) ->
		micropost_id = $(this).data("id")
		event.preventDefault();
		$.ajax({
            url:"/microposts/#{micropost_id}/thumbup",
            type:'POST'
          })
		num = parseInt(/\d+/.exec($(this).html())[0]) + 1
		$(this).html("(#{num})")

#添加评论
$(document).on 'click','.comments a.btn',()->
	$.ajax({
            url:'/comments',
            type:'POST',
            data:$('#new_comment').serialize(),
            success:(data)->$('.comments p').after(data)
          })
	$('.comment-content').val('')
	node = $(this).parent().siblings('p').children('.glyphicon-option-horizontal')
	num = parseInt(/\d+/.exec(node.html())[0]) + 1
	node.html("(#{num})")
