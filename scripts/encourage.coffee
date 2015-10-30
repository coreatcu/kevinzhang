# Description:
#   What an encouraging robot!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot encourage me
#   hubot encourage name
#   hubot encourage all
#   
# Author:
#   WoogieNoogie

remarks = [
    "Great job, %!",
    "% is a ray of sunshine on a cloudy day.",
    "A gold star for %!"
    "Way to go, %!",
    "% is amazing, and everyone should be happy this amazing person is with us.",
    "I wish I were more like %.",
    "% is good at, like, 10 times more things than I am.",
    "%, you are a wonderfully sensitive person who inspires joyous feelings in all those around you.",
    "%, you are crazy, but in a good way.",
    "% has a phenomenal attitude.",
    "% is a great part of the team!",
    "I admire %'s strength and perseverance.",
    "% is a problem-solver and cooperative teammate.",
    "% is the wind beneath my wings.",
    "The FBI tapped %'s phone just to hear the sound of this person's voice.",
    "At least two friends are going to name their child and/or goldfish after %."
    "% has a great reputation.",
    "%. What a beautiful name.",
    "%, you are fabulous.",
    "% is one of the most talented people I know.",
    "Who doesn't love %?",
    "I constantly feel fortunate to know %."
]
allinclusive = [
    "Great job today, everyone!",
    "Go team!",
    "Super duper, gang!",
    "If I could afford it, I would buy you all lunch!",
    "What a great group of individuals there are in here. I'm proud to be chatting with you.",
    "You all are capable of accomplishing whatever you set your mind to doing.",
    "I love this team's different way of looking at things!",
    "You're an innovative, talented group of people.",
    "I'm so lucky to be here with you all!",
    "Fantastic work, everyone!"
]

module.exports = (robot) ->
    robot.respond /(encourage )(.*)/i, (msg) ->
        encourage = msg.random remarks

        encouragingme = () -> msg.send encourage.replace "%", msg.message.user.name
        encouragingyou = () -> msg.send encourage.replace "%", msg.match[2]
        
        if msg.match[2] == 'me'
            encouragingme()
        else if msg.match[2] == 'all'
            msg.send msg.random allinclusive
        else
            encouragingyou()