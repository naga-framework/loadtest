```bash
siege -c100 http://127.0.0.1:8001/test -b -t30s
** SIEGE 3.0.5
** Preparing 100 concurrent users for battle.
The server is now under siege...
Lifting the server siege...      done.

Transactions:		      192979 hits
Availability:		      100.00 %
Elapsed time:		       29.95 secs
Data transferred:	       43.42 MB
Response time:		        0.02 secs
Transaction rate:	     6443.37 trans/sec
Throughput:		        1.45 MB/sec
Concurrency:		       99.64
Successful transactions:      192979
Failed transactions:	           0
Longest transaction:	        0.33
Shortest transaction:	        0.00
 
FILE: /var/log/siege.log
You can disable this annoying message by editing
the .siegerc file in your home directory; change
the directive 'show-logfile' to false.
```
