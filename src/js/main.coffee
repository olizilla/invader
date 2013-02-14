#
# exampleInvader = 
# {
#   grid:[
#     [0,1,1],
#     [0,0,1],
#     [1,1,1],
#     [0,1,1],
#     [0,1,0]
# 	]
# }
randomInvader = ->
	
	createCell = -> Math.round(Math.random())
	
	createRow  = -> createCell() for [0..2]
	
	createGrid = -> createRow() for [0..4]
	
	return { 
		grid: createGrid()
	}


render = (invader, container) ->

	if not container then container = $('body')

	container.empty();

	context = 
		width: container.width() / 5
		height: container.height() / 5

	renderPixel = (pixel) -> 
		$('<div class="pixel">').addClass(if pixel then 'on' else '')
			.width(context.width)
			.height(context.height)
			.appendTo(container)

	renderRow = (row) ->
		renderPixel leftPixel for leftPixel in row
		renderPixel rightPixel for rightPixel in row[0..1].reverse();

	renderRow row for row in invader.grid	


jQuery -> 
	render(randomInvader())
	$('body').click( -> render(randomInvader()) )
