# Dockerfile for Railway to run IBM DB2
FROM ibmcom/db2

# Accept license, set password, and default database
ENV LICENSE=accept \
    DB2INST1_PASSWORD=password \
    DBNAME=testdb

# Copy and make init script executable
COPY init-db2.sh /init-db2.sh
RUN chmod +x /init-db2.sh

# Expose DB2 port
EXPOSE 50000

# Run init script
CMD ["/init-db2.sh"]
