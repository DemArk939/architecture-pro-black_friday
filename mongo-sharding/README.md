# pymongo-api

## Как запустить

В терминале переходим на папку mongo-sharding

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Mongodb: 
- Инициализируем сервер конфигурации,
- Инициализируйте шарды,
- Инцициализируйте роутер и наполните его тестовыми данными,
- Заполняем mongodb данными:

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

### Если вы запускаете проект на локальной машине

Откройте в браузере http://localhost:8080

В json можно увидеть collections -> distribution_by_shards - распределение элементов по шардам

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
      27020
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
          "shard_id": "shard2",
          "docs_on_shard": 508
        },
        {
          "shard_id": "shard1",
          "docs_on_shard": 492
        }
      ]
    }
  },
  "shards": {
    "shard1": "shard1/shard1:27018",
    "shard2": "shard2/shard2:27019"
  },
  "cache_enabled": false,
  "status": "OK"
}
```