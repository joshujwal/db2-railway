#!/bin/bash

echo "▶️ Starting DB2 engine..."
su - db2inst1 -c "source ~db2inst1/sqllib/db2profile && db2start"

echo "📦 Creating database 'testdb'..."
su - db2inst1 -c "source ~db2inst1/sqllib/db2profile && db2 create database testdb"

echo "✅ Done. Keeping container running."
tail -f /dev/null
