#Description:
#	Hubot rhymes for you
#
#Dependencies:
#	None
#
#Configuration:
#	None
#
#Commands:
#	hubot rhyme me $word  -- Receive a rhyme for $word

module.exports = (robot) ->

	robot.respond /rhyme me( ([a-zA-Z]+))/i, (msg) ->
  		robot.http("http://rhymebrain.com/talk?function=getRhymes&word=" + msg.match[2])
  			.get() (err, res, body) ->
  				rhymes = JSON.parse(body)
  				random = Math.floor(Math.random() * rhymes.length)
  				msg.send rhymes[random]['word']

	robot.respond /rhyme me( ([a-zA-Z]+))( (\d+))+/i, (msg) ->
		count = msg.match[3] || 5
		robot.http("http://rhymebrain.com/talk?function=getRhymes&word=" + msg.match[2])
			.get() (err, res, body) ->
				rhymes = JSON.parse(body)
				responses = []
				while count -= 1
					random = Math.floor(Math.random() * rhymes.length)
					responses[count-1] = rhymes[random]['word']
				msg.send response for response in responses

				
