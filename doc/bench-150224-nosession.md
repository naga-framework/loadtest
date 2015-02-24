```bash
siege -c100 http://127.0.0.1:8001/test -b -t30s
** SIEGE 3.0.5
** Preparing 100 concurrent users for battle.
The server is now under siege...
Lifting the server siege...      done.

Transactions:		      297295 hits
Availability:		      100.00 %
Elapsed time:		       29.94 secs
Data transferred:	       66.61 MB
Response time:		        0.01 secs
Transaction rate:	     9929.69 trans/sec
Throughput:		        2.22 MB/sec
Concurrency:		       99.70
Successful transactions:      297295
Failed transactions:	           0
Longest transaction:	        0.12
Shortest transaction:	        0.00
 
FILE: /var/log/siege.log
You can disable this annoying message by editing
the .siegerc file in your home directory; change
the directive 'show-logfile' to false.
\[error] Unable to write to file: Permission denied
```
