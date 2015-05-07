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
#   "hubot assemble" will post an assemble gif
#   "hubot online assemble" will remind users to update their dev status

assembles = [
    "http://stream1.gifsoup.com/view1/1102847/admin-team-assemble-o.gif",
    "http://forgifs.com/gallery/d/208054-3/Avengers-pugs.gif",
    "http://24.media.tumblr.com/297528ec42358172da25980c6a217b0c/tumblr_mh0pn0yNrh1r0oxhwo1_500.gif",
    "http://24.media.tumblr.com/tumblr_m84sq9LTMR1rbqu2po1_500.gif",
    "http://25.media.tumblr.com/003ad350d13c9c15b6aa3cbb7c3a7994/tumblr_mhfi7yrMtr1s1popdo1_500.gif",
    "http://25.media.tumblr.com/25befefcd97add9efd4e11a5364b1626/tumblr_mhv3f4Nz7E1s1popdo1_400.gif",
    "http://24.media.tumblr.com/tumblr_lsff6v8KkQ1r0hwkoo1_250.gif",
    "http://25.media.tumblr.com/29ff97457ba29bced572237511968792/tumblr_mika5xysYR1rygnsio1_250.gif",
    "http://i.imgur.com/gubjrKV.gif",
    "http://img121.imageshack.us/img121/1498/groupr.gif",
    "http://24.media.tumblr.com/f402c0124c7ad18ae4b44229aada7915/tumblr_mlzm77tOvU1s0hzzjo1_500.gif",
    "http://s3-ec.buzzfed.com/static/enhanced/web05/2012/10/11/14/anigif_enhanced-buzz-32214-1349979755-9.gif",
    "http://i.imgur.com/MmNPB.gif",
    "http://i.imgur.com/m5kAg.gif",
    "http://i.imgur.com/gLvFHMD.gif"
]

module.exports = (robot) ->

  robot.respond /assemble/i, (msg) ->
        assemble = msg.random assembles
        msg.send assemble
        msg.send "@all Dev Team, ASSEMBLE!"

  robot.respond /email assemble/i, (msg) ->
        msg.send "@all email standup today, send to standup@casenex.com"
        msg.send "http://i.imgur.com/5OAvU9a.gif" if Math.random() >= 0.8
