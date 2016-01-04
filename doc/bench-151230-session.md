```bash
siege -c100 http://127.0.0.1:8001/test -b -t30s
** SIEGE 3.0.5
** Preparing 100 concurrent users for battle.
The server is now under siege...
Lifting the server siege...      done.

Transactions:		      221731 hits
Availability:		      100.00 %
Elapsed time:		       29.31 secs
Data transferred:	        3.59 MB
Response time:		        0.01 secs
Transaction rate:	     7565.03 trans/sec
Throughput:		        0.12 MB/sec
Concurrency:		       99.77
Successful transactions:      221731
Failed transactions:	           0
Longest transaction:	        0.23
Shortest transaction:	        0.00

```
