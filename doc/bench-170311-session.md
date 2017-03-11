```bash
using client/server on same computer, 
AMD E1-2100 APU with Radeon(TM) HD Graphics
FREQ 800MHz
L2 cache 1024 KB
Ubuntu 16.04 LTS

siege -c100 http://127.0.0.1:8001/ -b -t30s
** SIEGE 3.0.8
** Preparing 100 concurrent users for battle.
The server is now under siege...
Lifting the server siege...      done.

Transactions:		       23354 hits
Availability:		      100.00 %
Elapsed time:		       29.24 secs
Data transferred:	        5.23 MB
Response time:		        0.12 secs
Transaction rate:	      798.70 trans/sec
Throughput:		        0.18 MB/sec
Concurrency:		       99.50
Successful transactions:       23354
Failed transactions:	           0
Longest transaction:	        0.50
Shortest transaction:	        0.05
 
FILE: /var/log/siege.log
You can disable this annoying message by editing
the .siegerc file in your home directory; change
the directive 'show-logfile' to false.
```
