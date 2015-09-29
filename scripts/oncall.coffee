module.exports = (robot) ->

    robot.respond /who(’s|'s|s| is|se)? (on call|oncall|on-call)(.+)?/i, (msg) ->
        schedule =
            '09/13/15': ['Josh', 'Sara']
            '09/20/15': ['Sara', 'Josh']
            '09/27/15': ['Jackie', 'Max']
            '10/04/15': ['Max', 'Jamie']
        for date, people of schedule
            today = new Date()
            start = new Date(date)
            end = new Date(date)
            end.setDate(end.getDate() + 7)
            if today - start >= 0 and end - today > 0?
                msg.send "#{people[0]} is on call, #{people[1]} is on backup!"
                break