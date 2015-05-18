# FAN ZONE #

Add to /entries/index.html for comments:

<div class="well">
	<%= render 'comments/form', comments: @comments, commentable: entry %>
</div>