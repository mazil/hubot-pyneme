# Description:
#   All of the pynes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   pyne me - Get a random pyne
#   pyne <x> - Get a specific pyne

module.exports = (robot) ->
  
  robot.hear /pyne (\w+)?/i, (msg) ->
    word = msg.match[1] || "me"
    
    if word == "me"
        msg.http("http://pyneme.herokuapp.com/random")
          .get() (err, res, body) ->
            msg.send JSON.parse(body).pyne
    else
        msg.http("http://pyneme.herokuapp.com/pyne/" + word)
          .get() (err, res, body) ->
            msg.send JSON.parse(body).pyne


  robot.hear /how many pynes are there/i, (msg) ->
    msg.http("http://pyneme.herokuapp.com/count")
      .get() (err, res, body) ->
        msg.send "There are #{JSON.parse(body).pyne_count} pynes."
