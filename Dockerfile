FROM ibmcom/db2

ENV LICENSE=accept \
    DB2INST1_PASSWORD=password \
    DBNAME=testdb

COPY init-db2.sh /init-db2.sh
RUN chmod +x /init-db2.sh

EXPOSE 50000

CMD ["/init-db2.sh"]
