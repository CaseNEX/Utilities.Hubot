# Description:
#   Hubot, send an assemble.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   "hubot weekend" will wish everyone a good weekend

assembles = [
    "http://stream1.gifsoup.com/view1/1102847/admin-team-assemble-o.gif"
]

module.exports = (robot) ->

  robot.respond /weekend/i, (msg) ->
    msg.send "http://images2.fanpop.com/images/photos/7800000/The-Rock-peoples-champ-the-rock-7878571-475-475.gif#.png"
        
