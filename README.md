## Tarantool Queue Image

Введение
--------

Образ с реализацией пакетной обработки очередей на базе [Tarantool](https://www.tarantool.io).

Доступные типы очередей `fifo`, `fifo_replace`, `fifo_skip`, `fifottl`, `utube`, `utubettl`.

Установка
---------

### Шаг 1: Загрузка
```shell
docker pull registry.marfa-tech.net/marfatech/tarantool-queue:latest
```
*Эта команда подразумевает что [Docker](https://www.docker.com) установлен и доступен глобально.*

### Шаг 2: Подключение образа

После подключите образ в `docker-compose.yaml` добавив его для контейнера `tarantool` вашего проекта:

```yaml
services:
    # ...
    tarantool:
        image: registry.marfa-tech.net/marfatech/tarantool-queue:latest
        ports:
            - 3301:3301
        user: tarantool
        volumes:
            - ./.data/tarantool:/var/lib/tarantool
        environment:
            TARANTOOL_PORT: ${TARANTOOL_PORT}
            TARANTOOL_USER_NAME: ${TARANTOOL_USER_NAME}
            TARANTOOL_USER_PASSWORD: ${TARANTOOL_USER_PASSWORD}
    # ...
}
```

Использование
-------------
Выбрать подходящий [коннектор](https://www.tarantool.io/ru/doc/1.6/book/connectors/) для работы с очередями.

Перед работой с очередью необходимо инициализировать `tube`:
```
init_tube(QUEUE_NAME, QUEUE_TYPE)
```

Посредством вызова ниже перечисленных методов предполагается работа с элементами из очереди:
```
queue.tube.QUEUE_NAME:put_list(data_list)
queue.tube.QUEUE_NAME:ack_list(id_list)
queue.tube.QUEUE_NAME:take_list(limit, timeout)
queue.stats(QUEUE_NAME)
```

[Реализация](./files/app/queue/abstract/driver) типов очередей `fifo`, `fifo_replace`, `fifo_skip`, `fifottl`, `utube`, `utubettl`.

*Предполагается наличие базовых знаний языка [Lua](https://www.lua.org/docs.html).*

Разработка
----------

### Авторизоваться
```bash
docker login registry.marfa-tech.net -u XXX -p XXX
```

### Пересобрать образ
```bash
docker build -t tarantool-queue .
```

### Создание тега
```bash
docker tag tarantool-queue:latest registry.marfa-tech.net/marfatech/tarantool-queue:latest
```

### Отправить изменения
```bash
docker push registry.marfa-tech.net/marfatech/tarantool-queue
```

Лицензия
--------

[![license](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](./LICENSE)
