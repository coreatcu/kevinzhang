# Description:
#   Lets CORE members know who's on call for emails that week.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot who's on call - Returns name of person on call and person on backup
#
# Author:
#   jackiehluo

module.exports = (robot) ->

    robot.respond /who(’s|'s|s| is|se)? (on call|oncall|on-call)(.+)?/i, (msg) ->
        schedule =
            '09/13/15': ['Josh', 'Sara']
            '09/20/15': ['Sara', 'Josh']
            '09/27/15': ['Jackie', 'Max']
            '10/04/15': ['Jamie', 'Kat']
            '10/11/15': ['Max', 'Jamie']
            '10/18/15': ['Kat', 'no one']
            '10/25/15': ['Kimberly', 'Simon']
            '11/8/15': ['No one', 'George']
            '11/15/15': ['George', 'Jackie']
            '11/22/15': ['No one', 'no one']
            '11/29/15': ['No one', 'no one']
        for date, people of schedule
            today = new Date()
            start = new Date(date)
            end = new Date(date)
            end.setDate(end.getDate() + 7)
            if today - start >= 0 and end - today > 0?
                msg.send "#{people[0]} is on call, #{people[1]} is on backup!"
                break