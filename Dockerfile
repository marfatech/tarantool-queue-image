FROM tarantool/tarantool:1.7
MAINTAINER Wakeapp <wakecent@wakeapp.ru>

COPY files/app /usr/share/tarantool
COPY files/app.lua /opt/tarantool

CMD ["tarantool", "/opt/tarantool/app.lua"]

EXPOSE 3301
