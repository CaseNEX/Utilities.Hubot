#Description:
#	CaseNEX memes for everyone!
#
#Dependencies:
#	None
#
#Configuration:
#	None
#
#Commands:
#	hubot memenex -- Receive a casenex meme
#	hubot memenex N -- Receive N memes

module.exports = (robot) ->

	robot.respond /memenex$/i, (msg) ->
  		robot.http("http://rhymebrain.com/talk?function=getRhymes&word=case")
  			.get() (err, res, body) ->
  				rhymes = JSON.parse(body)
  				random = Math.floor(Math.random() * rhymes.length)
  				msg.send rhymes[random]['word'] + 'NEX'
	
	robot.respond /memenex( (\d+))+/i, (msg) ->
		count = msg.match[2] || 5
		count = parseInt(count, 10) + 1
		robot.http("http://rhymebrain.com/talk?function=getRhymes&word=case")
			.get() (err, res, body) ->
				rhymes = JSON.parse(body)
				memes = []
				while count -= 1
					random = Math.floor(Math.random() * rhymes.length)
					memes[count-1] = rhymes[random]['word'] + 'NEX'
				msg.send meme for meme in memes

				
