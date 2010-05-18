#!/bin/sh
cd /home/ocabulo/stampede_app/log && rm mongrel.pid -f
pkill -9 mongrel_rails -u ocabulo
cd /home/ocabulo/stampede_app && /usr/local/bin/mongrel_rails start -e production -p 4312 -d