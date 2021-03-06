# Description:
#   Give, Take and List User Points
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
#
# Author:
#   wschuur
#
# Commands:
#   "hubot setpass <user> <pass>" sets the basic auth pass
#   "hubot define <name> <url>" adds a url to the list of ops calls
#   "hubot get <name>" makes a post request to the defined url
#   "hubot delete <name>" removes a url from the list of ops calls
#   "hubot list <name>" displays the list of ops calls



user = ""
pass = ""
urls = {}

saveUrls = (robot) -> 
    robot.brain.data.urls = urls
saveAuth = (robot) ->
    robot.brain.data.username = user
    robot.brain.data.pass = pass

module.exports = (robot) ->
    robot.brain.on 'loaded', ->
        urls = robot.brain.data.urls or {}
        user = robot.brain.data.username or ""
        pass = robot.brain.data.pass or ""

    robot.respond /setpass (.*) (.*)$/i, (msg) ->
        user = msg.match[1]
        pass = msg.match[2]
        saveAuth(robot)
        msg.send 'Saved pass for ' + robot.brain.data.username

    robot.respond /define (.*) (.*)$/i, (msg) ->
        variableName = msg.match[1]
        url = msg.match[2]
        urls[variableName] = url
        saveUrls(robot)
        msg.send 'Ok, ' + variableName + ' = ' + url

    robot.respond /get (.*)$/i, (msg) ->
        variableName = msg.match[1]
        if urls.hasOwnProperty(variableName)
            user = robot.brain.data.username
            pass = robot.brain.data.pass
            auth = 'Basic ' + new Buffer(user + ':' + pass).toString('base64')
            msg.http(urls[variableName] + '?room=' + (msg.message.room.replace("_", "+")) + "&r=" + Math.random())
                .headers(Authorization: auth)
                .post() (err, res, body) ->
                    msg.send err if err
        else
            msg.send variableName + " doesn't exist"

    robot.respond /delete (.*)$/i, (msg) ->
        variableName = msg.match[1]
        delete urls[variableName]
        saveUrls(robot)
        msg.send 'deleted ' + variableName

    robot.respond /list$/i, (msg) ->
        msg.send Object.keys(urls).join(", ")