# This imports all the layers for "import2" into import2Layers
# Benchmarked Kristoffer Lundberg's slider coding'
rt = Framer.Importer.load "imported/import2"

# Reusable Values
myWidth = 640
myHeight = 1136
myClock = 40
myNav = 88
myTab = 88
myGap = 10
mySpring = "spring(500,25,0)"
chngSpring = "spring(500,30,0)"
minDrag = 100
crnt = 0

tabUp = 30
tabAdd = 30
tabHeight = 88

container = new Layer x:0, y:0, width: myWidth, height: myHeight, backgroundColor: 'transparent'

blob = new Layer x:0, y:740, width: myWidth, height: myHeight, backgroundColor: 'transparent'

applyCSS = (layer)->
	h1 = layer.querySelector("h1")
	h1.style.font = "300 30px Helvetica Neue"
	h1.style.color = "#000"

#rt.blobContents.properties = y:0, width: 640



rt.blobContents.superLayer = blob
blob.states.add
	up: {x: 20, y: 0, width: 600}
	
blob.states.animationOptions = 
	time: .3
	curve: mySpring

rt.blobContents.on Events.Click, ->
	blob.states.next()
	
info = [	
	{
		title: "To Kill a Mockingbird"
		author: "Harper Lee"
		year: "1988"
		type: "Mystery, Thriller, Suspense"
		image: "images/tokillamockingbird__span.jpg"
		prgrph: "The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it, To Kill A Mockingbird became both an instant bestseller and a critical success when it was first published in 1960. It went on to win the Pulitzer Prize in 1961 and was later made into an Academy Award-winning film, also a classic.

Compassionate, dramatic, and deeply moving, To Kill A Mockingbird takes readers to the roots of human behavior - to innocence and experience, kindness and cruelty, love and hatred, humor and pathos. Now with over 18 million copies in print and translated into forty languages, this regional story by a young Alabama woman claims universal appeal. Harper Lee always considered her book to be a simple love story. Today it is regarded as a masterpiece of American literature."
	}, 
	{
		title: "Perks of Being a Wallflower"
		author: "Stephen Chbosky"
		year: "2012"
		type: " Literature, Fiction, Coming of Age"
		image: "images/ .jpg",
		prgrph: "Since its publication, Stephen Chbosky’s haunting debut novel has received critical acclaim, provoked discussion and debate, grown into a cult phenomenon with over three million copies in print, spent over one year at #1 on the New York Times bestseller list, and inspired a major motion picture starring Logan Lerman and Emma Watson.

The Perks of Being a Wallflower is a story about what it’s like to travel that strange course through the uncharted territory of high school. The world of first dates, family dramas, and new friends. Of sex, drugs, and The Rocky Horror Picture Show. Of those wild and poignant roller-coaster days known as growing up."
	}, 
	{	
		title: "All the Light we Cannot.."
		author: "Anthony Doerr"
		year: "2014"
		type: "Literature, Fiction, Historical"
		image: "images/all_the_light_doerr.jpg"
		prgrph: "From the highly acclaimed, multiple award-winning Anthony Doerr, the beautiful, stunningly ambitious instant New York Times bestseller about a blind French girl and a German boy whose paths collide in occupied France as both try to survive the devastation of World War II.

Marie-Laure lives with her father in Paris near the Museum of Natural History, where he works as the master of its thousands of locks. When she is six, Marie-Laure goes blind and her father builds a perfect miniature of their neighborhood so she can memorize it by touch and navigate her way home. When she is twelve, the Nazis occupy Paris and father and daughter flee to the walled citadel of Saint-Malo, where Marie-Laure’s reclusive great-uncle lives in a tall house by the sea. With them they carry what might be the museum’s most valuable and dangerous jewel.

In a mining town in Germany, the orphan Werner grows up with his younger sister, enchanted by a crude radio they find. Werner becomes an expert at building and fixing these crucial new instruments, a talent that wins him a place at a brutal academy for Hitler Youth, then a special assignment to track the resistance. More and more aware of the human cost of his intelligence, Werner travels through the heart of the war and, finally, into Saint-Malo, where his story and Marie-Laure’s converge.

Doerr’s “stunning sense of physical detail and gorgeous metaphors” (San Francisco Chronicle) are dazzling. Deftly interweaving the lives of Marie-Laure and Werner, he illuminates the ways, against all odds, people try to be good to one another. Ten years in the writing, All the Light We Cannot See is a magnificent, deeply moving novel from a writer “whose sentences never fail to thrill” (Los Angeles Times)."
	}]

textarea = new Layer y:364, width: myWidth, height: 700, backgroundColor: "transparent"
textarea.superLayer = blob

booktext = new Layer width: myWidth, height: myHeight, backgroundColor: 'transparent'
booktext.superLayer = textarea
booktext.scroll = true

booktext.style = {
	"paddingLeft": "50px"
	"paddingRight": "80px"
	"paddingTop": "40px"
	"marginBottom": "100px"
	"fontFamily": "Helvetica Neue"
	"fontSize": "40px"
	"lineHeight": "48px"
	"color": "#333333"
}

bookWrap = new Layer width: myWidth*info.length, height: myHeight, backgroundColor: '#000', opacity: 1

bookWrap.superLayer = container

rt.bar.superLayer = container
rt.clock.superLayer = container

blob.superLayer = container

bookWrap.draggable.enabled = true
bookWrap.draggable.speedY = 0

for i in [0...info.length]
	imageBox = new Layer
		superLayer: bookWrap
		x: myWidth*(i), y:0,
		width: myWidth,
		height: myHeight
		image: info[i].image


rt.shade.bringToFront()
rt.shade.superLayer = blob

lbrMap = new Layer width: myWidth, height: myHeight, backgroundColor: 'transparent', opacity: 0

lbrMap.superLayer = container
rt.bookinfo_map.superLayer = lbrMap
rt.mapSpots.superLayer = lbrMap
rt.hunt.superLayer = lbrMap
rt.huntSpot.superLayer = lbrMap
rt.sorrells.superLayer = lbrMap
rt.sorrellsSpot.superLayer = lbrMap
rt.mellon.superLayer = lbrMap
rt.mellonSpot.superLayer = lbrMap
rt.ebook.superLayer = lbrMap

rt.huntSpot.opacity = 0
rt.mellonSpot.opacity = 0
rt.sorrellsSpot.opacity = 0

# Hunt Library 
rt.huntSpot.properties = scale:1, y:320
rt.huntSpot.states.add
	show: {opacity:1, y:310, scale:1.2}

rt.hunt.states.add
	up: {y:594}

rt.hunt.on Events.Click, ->
	rt.hunt.states.next()
	rt.huntSpot.states.next()

rt.huntSpot.states.animationOptions =
	time: 0.4
	curve: mySpring
rt.hunt.states.animationOptions =
	time: 0.1
	curve: mySpring

# Sorrells Library
rt.sorrellsSpot.properties = scale:1, y:224
rt.sorrellsSpot.states.add
	show: {opacity:1, y:214, scale:1.2}
rt.sorrells.states.add
	up: {y:716-30}
rt.sorrells.on Events.Click, ->
	rt.sorrells.states.next()
	rt.sorrellsSpot.states.next()
rt.sorrells.states.animationOptions =
	time: 0.1
	curve: mySpring
rt.sorrellsSpot.states.animationOptions =
	time: 0.4
	curve: mySpring

# Mellon Library
rt.mellonSpot.properties = scale:1, y:188
rt.mellonSpot.states.add
	show: {opacity:1, y:178, scale:1.2}
rt.mellon.states.add
	up: {y:838-50}
rt.mellon.on Events.Click, ->
	rt.mellon.states.next()
	rt.mellonSpot.states.next()
rt.mellon.states.animationOptions =
	time: 0.1
	curve: mySpring
rt.mellonSpot.states.animationOptions =
	time: 0.4
	curve: mySpring
tab = new Layer y:1136-118, width: myWidth, height: tabHeight + tabUp, backgroundColor: 'transparent'
tab.superLayer = container
rt.red1.properties = x:0, y:50
rt.red1.superLayer = tab
rt.bookInfo.properties = x:50, y:64
rt.bookInfo.superLayer = tab

rt.red2.properties = x:160+1, y:50
rt.red2.superLayer = tab
rt.rating.properties = x:188, y:68
rt.rating.superLayer = tab

rt.red3.properties = x:320+2, y:50
rt.red3.superLayer = tab
rt.addtoInbox.properties = x:370, y:64
rt.addtoInbox.superLayer = tab

rt.red4.properties = x:480+3, y:50
rt.red4.superLayer = tab
rt.wishlist.properties = x:540, y:64
rt.wishlist.superLayer = tab


lbrMap.states.add
	on: {opacity: 1}
lbrMap.states.animationOptions =
	time: 1
	curve: mySpring	

rt.red1.states.add
	on: {y: 0, height: tabHeight+tabUp}
rt.red1.states.animationOptions = 
		time: .6
		curve: mySpring

rt.bookInfo.states.add
	on: {scale: 1.2, shadowY:2, shadowBlur:8, y: 20}
rt.bookInfo.states.animationOptions = 
		time: .6
		curve: mySpring

bookWrap.states.add
	blur: {blur: 20}
bookWrap.states.animationOptions =
		time: .6
		curve: mySpring

# First button reaction
rt.red1.on Events. Click, ->
	rt.bookInfo.states.next()
	rt.red1.states.next()
	lbrMap.states.next()
	bookWrap.states.next()	
rt.bookInfo.on Events.Click, ->
	rt.bookInfo.states.next()
	bookWrap.states.next()
	rt.red1.states.next()
	lbrMap.states.next()
	
# Second button reaction

updt = ->
	booktitle.html = "<div><h1 style='font-family:Source Sans Pro; font-size: 44px;color:#000000;line-height:80pt;padding-left:54px; padding-right:54px;'>"+info[crnt].title+"</h1></div>" +
	"<div><h2 style='font-family:Source Sans Pro; font-weight:400; font-size: 36px;color:#333333;line-height:0px;padding-left:54px; padding-right:54px;'>"+"by "+info[crnt].author+" | "+info[crnt].year+"</h2></div>" +
	"<div><h2 style='font-family:Source Sans Pro; font-weight:400; font-size: 36px;color:#333333;line-height:90px;padding-left:54px; padding-right:54px;'>"+info[crnt].type+"</h2></div>" 
	booktext.html = info[crnt].prgrph

bkHome = ->
	crnt = 0
	#updt()
	bookWrap.animate
		properties: 
			x: 0,
		time: .6
		curve: chngSpring

bookWrap.on Events.DragStart, ->
	arrows.states.next()

bookWrap.on Events.DragEnd, ->
# Drag to Right
	if bookWrap.x < -((myWidth*crnt)+minDrag) && bookWrap.x > -(myWidth*(crnt+1))
		if (crnt+1) < info.length
			crnt += 1
			updt()
			bookWrap.animate
				properties: 
					x: -(myWidth*crnt),
				time: .6
				curve: chngSpring
		else
			bookWrap.animate
				properties: 
					x: -(myWidth*crnt),
				time: .6
				curve: chngSpring
# Drag to Left
	else
		if crnt == 0
			bkHome()
		else
			if bookWrap.x > -((myWidth*crnt)-minDrag)
				bookWrap.animate
					properties: 
						x: -(myWidth*(crnt-1)),
					time: .6
					curve: chngSpring
				crnt -= 1
				updt()
			else
				bookWrap.animate
					properties: 
						x: -(myWidth*(crnt)),
					time: .6
					curve: chngSpring
				updt()
	Utils.delay 0.1, ->
		arrows.states.next()

arrows = new Layer width: myWidth, height: myHeight, backgroundColor: 'transparent'
arrows.superLayer = container
rt.arrowRight.superLayer = arrows
rt.arrowLeft.superLayer = arrows

arrows.states.add 
	fadeout: {opacity:0}
arrows.states.animationOptions = 
	time: 0.2


booktext.html = info[crnt].prgrph

booktitle = new Layer y: 120, width: myWidth, height: 200, backgroundColor: 'transparent'
booktitle.superLayer = blob

booktitle.html = "<div><h1 style='font-family:Source Sans Pro; font-size: 44px;color:#000000;line-height:80pt;padding-left:54px; padding-right:54px;'>"+info[crnt].title+"</h1></div>" +
"<div><h2 style='font-family:Source Sans Pro; font-weight:400; font-size: 36px;color:#333333;line-height:0px;padding-left:54px; padding-right:54px;'>"+"by "+info[crnt].author+" | "+info[0].year+"</h2></div>" +
"<div><h2 style='font-family:Source Sans Pro; font-weight:400; font-size: 36px;color:#333333;line-height:90px;padding-left:54px; padding-right:54px;'>"+info[crnt].type+"</h2></div>" 
