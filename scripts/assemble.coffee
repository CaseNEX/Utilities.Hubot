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
    "http://25.media.tumblr.com/tumblr_m4376dLOpj1qzgj88o1_500.gif",
    "http://stream1.gifsoup.com/view/97615/voltron-o.gif",
    "http://24.media.tumblr.com/297528ec42358172da25980c6a217b0c/tumblr_mh0pn0yNrh1r0oxhwo1_500.gif",
    "http://24.media.tumblr.com/tumblr_m84sq9LTMR1rbqu2po1_500.gif",
    "http://25.media.tumblr.com/003ad350d13c9c15b6aa3cbb7c3a7994/tumblr_mhfi7yrMtr1s1popdo1_500.gif",
    "http://25.media.tumblr.com/25befefcd97add9efd4e11a5364b1626/tumblr_mhv3f4Nz7E1s1popdo1_400.gif",
    "http://24.media.tumblr.com/tumblr_lsff6v8KkQ1r0hwkoo1_250.gif",
    "http://25.media.tumblr.com/29ff97457ba29bced572237511968792/tumblr_mika5xysYR1rygnsio1_250.gif"
]

module.exports = (robot) ->

  robot.respond /assemble/i, (msg) ->
        assemble = msg.random assembles
        msg.send assemble
        msg.send "@all Dev Team, ASSEMBLE!"

  robot.respond /online assemble/i, (msg) ->
        msg.send "@all online assemble today, please update http://milestones.datacation.net"
