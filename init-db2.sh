#!/bin/bash

echo "▶️ Starting DB2 engine..."
su - db2inst1 -c "source ~db2inst1/sqllib/db2profile && db2start"

echo "⏳ Waiting for DB2 to fully initialize..."
sleep 100

echo "📦 Checking if database exists..."
su - db2inst1 -c "source ~db2inst1/sqllib/db2profile && db2 list db directory" | grep -q "TESTDB"
if [ $? -ne 0 ]; then
  echo "📦 Creating database 'testdb'..."
  su - db2inst1 -c "source ~db2inst1/sqllib/db2profile && db2 create database testdb"
else
  echo "✅ Database 'testdb' already exists."
fi

echo "✅ DB2 is ready. Keeping container alive..."
tail -f /dev/null
