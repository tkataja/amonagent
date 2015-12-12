#!/usr/bin/env sh


# chkconfig: 2345 95 05
# description: Amon agent - collects system and process information.
# processname: amonagent
# pidfile: /var/run/amonagent/amonagent.pid


### BEGIN INIT INFO
# Provides:          amonagent
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Starts the Amon agent
# Description:       Amon agent - collects system and process information.
### END INIT INFO

AGENTPATH='/opt/amonagent/amonagent'
AGENTUSER="amonagent"
PIDPATH="/var/run/amonagent/"


[ -f $AGENTPATH ] || echo "$AGENTPATH not found"

. /etc/rc.d/init.d/functions

action=$1

case $action in
    start)
        if [ ! -d $PIDPATH ]; then
            mkdir -p $PIDPATH
            chown amonagent:amonagent $PIDPATH
        fi

        su $AGENTUSER -c "$AGENTPATH stop"
        su $AGENTUSER -c "$AGENTPATH start"
        ;;

    stop)
        su $AGENTUSER -c "$AGENTPATH stop"
        exit $?
        ;;

    restart)
        $0 stop
        $0 start
        exit $?
        ;;

    status)
        su $AGENTUSER -c "$AGENTPATH status"
        exit $?
        ;;

    test)
        su $AGENTUSER -c "$AGENTPATH --test"
        ;;


    *)
        echo "Usage: $0 {start|stop|restart|status|test}"
        exit 2
        ;;
esac
