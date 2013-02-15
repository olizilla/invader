###
main.coffee
===========
Creates a randomised model of an Invader:

> "The Invader occupies a 5 x 5 grid of blocks (25 bits). 
> Internally, the Invader is represented by a 3 x 5 grid (15 bits) 
> because it is horizontally symmetric." jtarbell, july 2003

e.g
	[             renders as: 
		[1,0,1],              X.X.X
		[1,1,1],              XXXXX
		[0,1,1],              .XXX.
		[0,0,1],              ..X..
		[0,1,0]               .X.X.
	]

Renders to dom elements, for CSS to have it's way with.

@author olizilla
###

###
randomInvader: Creates the raw data equivalent of an Invader.
@return {Object} an Invader with a grid property holding the 'pixel' data
###
randomInvader = ->
	
	createCell = -> Math.round(Math.random())
	
	createRow  = -> createCell() for [0..2] # The results are automagically accumlated in an array, and returned.
	
	createGrid = -> createRow() for [0..4]  # Same here... 
	
	return { 
		grid: createGrid()
	}

###
render: Turns an Invader into DOM and appends it to a container or the body.
NOTE Empties the container before use so it can be called repeatedly with the same container
###
render = (invader, container) ->

	if not container then container = $('body')

	renderCell = (cell) -> 
		$('<div class="pixel">').addClass(if cell then 'on' else '')
		
	renderRow = (row) -> 
		row[4..3] = row[0..1].reverse()
		renderCell(cell) for cell in row

	elements = []
	elements = elements.concat(renderRow(row)) for row in invader.grid

	container.removeClass('on').empty().append(elements)

# Do it!
jQuery -> 
	render(randomInvader())
	$('body').on('click', '.pixel', 
		(event) -> 
			render(randomInvader(), $(this))
			return false
	)
