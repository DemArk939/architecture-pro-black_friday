# pymongo-api

## Как запустить

В терминале переходим на папку mongo-sharding-repl

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Mongodb: 
- Инициализируем сервер конфигурации,
- Инициализируем шарды и реплики,
- Инициализируем роутер и наполните его тестовыми данными:

```shell
./scripts/mongo-init.sh
```

В ходе выполнения скрипта увидим:
```
=== Инициализация конфигурационного сервера ===
...
=== Инициализация первого шарда ===
...
=== Инициализация второго шарда ===
...
=== Настройка кластера (добавляем шарды и включаем шардирование) ===
...
```


## Как проверить

Для проверки количества документов в каждой реплике можно выполнить скрипт:

```shell
./scripts/mongo-check.sh
```
Пример вывода:
```
=== shard1-1 ===
shard1 [direct: primary] test> switched to db somedb
shard1 [direct: primary] somedb> 492
...
shard2 [direct: secondary] somedb> === shard2-3 ===
shard2 [direct: secondary] test> switched to db somedb
shard2 [direct: secondary] somedb> 508 
```
### Если вы запускаете проект на локальной машине

Откройте в браузере http://localhost:8080

В json можно увидеть shards - реплики по каждой шарде

Пример вывода:
```
{
  "mongo_topology_type": "Sharded",
  "mongo_replicaset_name": null,
  "mongo_db": "somedb",
  "read_preference": "Primary()",
  "mongo_nodes": [
    [
      "mongos_router",
      27024
    ]
  ],
  "mongo_primary_host": null,
  "mongo_secondary_hosts": [],
  "mongo_is_primary": true,
  "mongo_is_mongos": true,
  "collections": {
    "helloDoc": {
      "total_documents": 1000,
      "distribution_by_shards": [
        {
          "shard_id": "shard1",
          "docs_on_shard": 492
        },
        {
          "shard_id": "shard2",
          "docs_on_shard": 508
        }
      ]
    }
  },
  "shards": {
    "shard1": "shard1/shard1-1:27018,shard1-2:27019,shard1-3:27020",
    "shard2": "shard2/shard2-1:27021,shard2-2:27022,shard2-3:27023"
  },
  "cache_enabled": false,
  "status": "OK"
}
```