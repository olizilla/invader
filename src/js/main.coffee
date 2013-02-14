# exampleInvader = 
# 	grid: [
# 		[0,1,1],
# 		[0,0,1],
# 		[1,1,1],
# 		[0,1,1],
# 		[0,1,0]
# 	]
#
# render exampleInvader, $('.box').first()

randomInvader = ->
	
	createCell = (grid, x, y) -> grid[y][x] = Math.round(Math.random())
	
	createRow  =    (grid, y) -> grid[y] = []; createCell grid, x, y for x in [0..2]
	
	createGrid =              -> grid = []; createRow grid, y for y in [0..4]; return grid;
	
	{ 
		grid: createGrid()
	}

render = (invader, container) ->

	if not container then container = $('body')

	container.empty();

	context = 
		width: container.width() / 5;
		height: container.height() / 5;

	renderPixel = (pixel) ->
		pixel = $('<div class="pixel">').addClass(if pixel then 'on' else '');
		pixel.width(context.width)
		pixel.height(context.height)
		container.append(pixel)

	renderRow = (row) ->
		renderPixel leftPixel for leftPixel in row
		renderPixel rightPixel for rightPixel in row[0..1].reverse();

	renderRow row for row in invader.grid	

setInterval( 
	-> render randomInvader(),
	900
)