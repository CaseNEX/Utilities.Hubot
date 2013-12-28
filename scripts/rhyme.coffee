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
# 	hubot rhyme me $word $num -- Receive $num rhymes for $word

module.exports = (robot) ->

	robot.respond /rhyme me( ([a-zA-Z]+))$/i, (msg) ->
		robot.http("http://rhymebrain.com/talk?function=getRhymes&word=" + msg.match[2])
			.get() (err, res, body) ->
				rhymes = JSON.parse(body)
				filtered = []
				for key, value of rhymes
        			if value.score >= 300
            			filtered.push(value.word)
				if filtered.length == 0
					msg.send "No rhymes found, sorry!"
				else
					random = Math.floor(Math.random() * filtered.length)
					msg.send filtered[random]


	robot.respond /rhyme me( ([a-zA-Z]+))( (\d+))+/i, (msg) ->
		count = msg.match[3] || 5
		count = parseInt(count, 10) + 1
		robot.http("http://rhymebrain.com/talk?function=getRhymes&word=" + msg.match[2])
			.get() (err, res, body) ->
				rhymes = JSON.parse(body)
				filtered = []
				for key, value of rhymes
        			if value.score >= 300
            			filtered.push(value.word)
				if filtered.length == 0
					msg.send "No rhymes found, sorry!"
				else
					responses = []
					while count -= 1
						random = Math.floor(Math.random() * filtered.length)
						responses[count-1] = filtered[random]
					msg.send response for response in responses


