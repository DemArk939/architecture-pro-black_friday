#!/bin/bash

echo "=== shard1-1 ==="
docker compose exec -T shard1-1 mongosh --port 27018 --quiet <<'EOF'
use somedb;
db.helloDoc.countDocuments();
EOF

echo "=== shard1-2 ==="
docker compose exec -T shard1-2 mongosh --port 27019 --quiet <<'EOF'
use somedb;
db.helloDoc.countDocuments();
EOF

echo "=== shard1-3 ==="
docker compose exec -T shard1-3 mongosh --port 27020 --quiet <<'EOF'
use somedb;
db.helloDoc.countDocuments();
EOF

echo "=== shard2-1 ==="
docker compose exec -T shard2-1 mongosh --port 27021 --quiet <<'EOF'
use somedb;
db.helloDoc.countDocuments();
EOF

echo "=== shard2-2 ==="
docker compose exec -T shard2-2 mongosh --port 27022 --quiet <<'EOF'
use somedb;
db.helloDoc.countDocuments();
EOF

echo "=== shard2-3 ==="
docker compose exec -T shard2-3 mongosh --port 27023 --quiet <<'EOF'
use somedb;
db.helloDoc.countDocuments();
EOF