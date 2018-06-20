# nstest benches

```text
             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --bench --noresolv
        version: 1.8.0 20/06/2018

        IPV4                      1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (1.1.1.1)            10      21      10      10      45      10      -10     10      25      18          16.90 ms
  google (8.8.8.8)                14      35      9       14      14      9       -15     14      39      13          17.60 ms
  level3 (209.244.0.3)            16      23      16      15      164     17      16      25      24      22          33.80 ms
  freedns (37.235.1.174)          38      50      30      31      n/a     44      -32     53      46      31          39.44 ms
  opendns (208.67.222.222)        16      17      16      24      252     16      -16     28      18      18          42.10 ms
  verisign  (64.6.64.6)           57      250     19      17      26      20      -25     163     24      157         75.80 ms
  norton (199.85.126.10)          19      185     19      17      483     30      18      19      19      19          82.80 ms
  dns_watch (84.200.69.80)        31      53      49      29      516     37      -29     38      42      37          86.10 ms
  adguard (176.103.130.130)       67      106     106     64      122     65      -67     120     111     123         95.10 ms
  yandex (77.88.8.8)              100     124     102     56      115     83      -166    95      89      89         101.90 ms
  neustar (156.154.70.1)          18      446     18      18      476     22      -20     18      159     18         121.30 ms
  comodo (8.26.56.26)             63      440     48      20      278     70      -29     117     185     21         127.10 ms
  quad9 (9.9.9.9)                 17      80      30      16      994     16      -18     23      151     16         136.10 ms
  freenom (80.80.80.80)           25      57      35      23      779     25      -24     61      326     32         138.70 ms
  uncensoredDNS (91.239.100.100)  44      98      59      33      n/a     52      -33     66      268     873        169.55 ms
  cleanbrowsing (185.228.168.168) n/a     604     172     86      233     89      -121    179     99      112        188.33 ms
  dyn_oracle (216.146.35.35)      176     171     90      88      307     n/a     -95     547     242     191        211.88 ms
  alternate_dns (23.253.163.53)   110     131     99      99      926     101     -102    204     280     101        215.30 ms

  tested domains ('base' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 26 s	 (20/06/2018 12:51 +0200)

        IPV6                             1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (2606:4700:4700::1001)      10      10      10      10      10      10      -10     10      10      10          10.00 ms
  verisign  (2620:74:1b::1:1)            20      17      18      18      17      20      -20     17      18      18          18.30 ms
  google (2001:4860:4860::8888)          15      29      14      16      36      21      -15     14      28      23          21.10 ms
  dns_watch (2001:1608:10:25::1c04:b12f) 22      25      n/a     22      22      n/a     -23     22      22      22          22.50 ms
  uncensoredDNS (2001:67c:28a4::)        40      40      40      40      40      40      -40     40      40      40          40.00 ms
  quad9 (2620:fe::fe)                    17      50      31      16      254     17      -19     21      19      20          46.40 ms
  neustar (2610:a1:1018::1)              44      448     23      22      488     23      26      22      45      24         116.50 ms
  yandex (2a02:6b8::feed:0ff)            86      61      99      51      603     80      -163    88      244     244        171.90 ms
  adguard (2a00:5a60::ad1:0ff)           212     389     235     88      578     208     -216    313     265     237        274.10 ms

  tested domains ('base' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 37 s	 (20/06/2018 12:51 +0200)

        IPV4                      1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (1.1.1.1)            10      9       10      10      10      10      -10     9       18      10          10.60 ms
  google (8.8.8.8)                9       14      14      17      14      9       -14     14      39      14          15.80 ms
  neustar (156.154.70.1)          18      18      18      18      18      18      -18     18      18      18          18.00 ms
  verisign  (64.6.64.6)           18      36      17      17      19      17      -16     17      17      17          19.10 ms
  level3 (209.244.0.3)            64      16      16      17      16      15      16      16      33      26          23.50 ms
  norton (199.85.126.10)          18      19      18      18      19      18      18      22      118     18          28.60 ms
  dns_watch (84.200.69.80)        29      29      29      29      29      29      -28     38      35      29          30.40 ms
  uncensoredDNS (91.239.100.100)  33      34      33      34      33      34      -33     34      34      33          33.50 ms
  opendns (208.67.222.222)        18      17      16      16      244     16      -16     28      18      16          40.50 ms
  comodo (8.26.56.26)             63      21      21      21      20      37      -31     151     215     37          61.70 ms
  adguard (176.103.130.130)       64      63      64      64      65      63      -63     66      129     64          70.50 ms
  freedns (37.235.1.174)          34      33      32      31      319     31      -172    53      152     47          90.40 ms
  quad9 (9.9.9.9)                 16      43      30      15      406     18      -17     21      378     18          96.20 ms
  cleanbrowsing (185.228.168.168) 87      86      83      83      86      92      -86     186     112     84          98.50 ms
  freenom (80.80.80.80)           25      25      40      23      785     25      -25     28      25      32         103.30 ms
  alternate_dns (23.253.163.53)   98      99      98      99      99      99      -98     201     153     98         114.20 ms
  yandex (77.88.8.8)              191     65      100     56      319     54      -61     95      54      175        117.00 ms
  dyn_oracle (216.146.35.35)      202     86      86      93      91      89      -94     165     201     219        132.60 ms

  tested domains ('alt' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 15 s	 (20/06/2018 12:51 +0200)

        IPV6                             1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (2606:4700:4700::1001)      10      10      10      10      14      11      -12     12      11      13          11.30 ms
  google (2001:4860:4860::8888)          14      15      14      15      14      22      -14     18      35      14          17.50 ms
  dns_watch (2001:1608:10:25::1c04:b12f) 22      22      23      22      22      22      -22     22      22      22          22.10 ms
  neustar (2610:a1:1018::1)              23      24      24      23      24      24      24      23      23      23          23.50 ms
  verisign  (2620:74:1b::1:1)            17      18      19      18      17      18      -17     158     26      17          32.50 ms
  quad9 (2620:fe::fe)                    16      63      16      16      41      17      -16     17      247     19          46.80 ms
  uncensoredDNS (2001:67c:28a4::)        40      40      40      40      40      40      -40     73      209     40          60.20 ms
  yandex (2a02:6b8::feed:0ff)            60      92      101     49      53      88      -55     96      81      83          75.80 ms
  adguard (2a00:5a60::ad1:0ff)           100     89      86      86      84      90      -88     90      88      90          89.10 ms

  tested domains ('alt' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 20 s	 (20/06/2018 12:52 +0200)

        IPV4                      1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (1.1.1.1)            10      9       10      10      10      9       -10     9       10      9            9.60 ms
  google (8.8.8.8)                14      14      9       9       38      9       -14     25      29      14          17.50 ms
  neustar (156.154.70.1)          18      18      18      18      18      18      -18     18      18      18          18.00 ms
  norton (199.85.126.10)          18      18      18      18      18      18      20      18      18      19          18.30 ms
  opendns (208.67.222.222)        16      24      17      26      27      16      -17     28      17      16          20.40 ms
  dns_watch (84.200.69.80)        29      30      29      29      29      29      -29     29      29      28          29.00 ms
  uncensoredDNS (91.239.100.100)  34      33      33      33      33      34      -33     34      33      34          33.40 ms
  level3 (209.244.0.3)            15      23      16      15      221     16      18      27      15      15          38.10 ms
  verisign  (64.6.64.6)           16      17      17      17      17      16      -18     164     87      18          38.70 ms
  quad9 (9.9.9.9)                 17      15      16      15      16      16      -19     20      258     16          40.80 ms
  freedns (37.235.1.174)          31      31      54      31      298     31      -30     53      45      31          63.50 ms
  adguard (176.103.130.130)       82      63      64      64      63      64      -64     110     64      63          70.10 ms
  cleanbrowsing (185.228.168.168) 84      90      86      84      87      94      -88     90      90      86          87.90 ms
  alternate_dns (23.253.163.53)   99      99      100     99      99      99      -99     99      99      99          99.10 ms
  freenom (80.80.80.80)           26      60      40      23      137     28      -24     37      338     321        103.40 ms
  comodo (8.26.56.26)             56      527     20      21      196     21      -33     46      147     61         112.80 ms
  dyn_oracle (216.146.35.35)      92      86      90      93      319     97      -95     87      226     93         127.80 ms
  yandex (77.88.8.8)              117     73      102     57      353     84      -59     97      88      286        131.60 ms

  tested domains ('easy' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 14 s	 (20/06/2018 12:52 +0200)

        IPV6                             1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (2606:4700:4700::1001)      10      10      10      10      10      12      -10     10      18      10          11.00 ms
  quad9 (2620:fe::fe)                    17      16      30      16      16      16      -16     17      16      16          17.60 ms
  google (2001:4860:4860::8888)          14      14      14      14      24      14      -14     14      44      23          18.90 ms
  dns_watch (2001:1608:10:25::1c04:b12f) 22      22      22      22      22      23      -22     36      37      22          25.00 ms
  verisign  (2620:74:1b::1:1)            19      18      18      18      154     18      -17     18      19      25          32.40 ms
  uncensoredDNS (2001:67c:28a4::)        40      40      40      40      40      40      -40     40      40      40          40.00 ms
  yandex (2a02:6b8::feed:0ff)            53      49      102     52      53      85      -55     93      111     117         77.00 ms
  neustar (2610:a1:1018::1)              24      46      24      24      504     24      24      23      181     22          89.60 ms
  adguard (2a00:5a60::ad1:0ff)           85      89      86      93      90      86      -86     185     95      88          98.30 ms

  tested domains ('easy' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 20 s	 (20/06/2018 12:52 +0200)

        IPV4                      1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (1.1.1.1)            10      9       10      9       10      10      -10     10      10      10           9.80 ms
  google (8.8.8.8)                13      15      9       9       26      9       -14     24      29      14          16.20 ms
  neustar (156.154.70.1)          18      18      18      18      18      18      -18     18      18      18          18.00 ms
  norton (199.85.126.10)          18      18      18      18      18      18      18      18      18      18          18.00 ms
  level3 (209.244.0.3)            16      16      16      16      16      16      67      16      17      16          21.20 ms
  dns_watch (84.200.69.80)        29      29      29      29      29      29      -29     28      29      29          28.90 ms
  opendns (208.67.222.222)        16      26      16      24      101     17      -16     21      32      18          28.70 ms
  verisign  (64.6.64.6)           17      17      17      16      16      17      -17     162     19      17          31.50 ms
  quad9 (9.9.9.9)                 17      37      30      16      16      18      -15     19      16      282         46.60 ms
  comodo (8.26.56.26)             47      21      20      20      175     21      -21     117     47      21          51.00 ms
  uncensoredDNS (91.239.100.100)  34      34      33      33      33      34      -33     60      204     34          53.20 ms
  freedns (37.235.1.174)          32      31      31      31      31      31      -31     54      338     31          64.10 ms
  adguard (176.103.130.130)       63      65      63      64      64      64      -63     65      111     65          68.70 ms
  freenom (80.80.80.80)           33      36      37      22      137     28      -31     29      111     289         75.30 ms
  dyn_oracle (216.146.35.35)      86      89      84      92      93      89      -87     159     107     109         99.50 ms
  cleanbrowsing (185.228.168.168) 88      88      93      88      87      84      -84     164     160     89         102.50 ms
  yandex (77.88.8.8)              307     n/a     99      54      54      54      -105    96      95      54         102.00 ms
  alternate_dns (23.253.163.53)   98      99      99      99      99      99      -101    194     101     99         108.80 ms

  tested domains ('atld' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 15 s	 (20/06/2018 12:53 +0200)

        IPV6                             1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (2606:4700:4700::1001)      10      10      10      10      10      10      -10     10      19      10          10.90 ms
  quad9 (2620:fe::fe)                    17      16      16      16      35      16      -16     20      20      16          18.80 ms
  verisign  (2620:74:1b::1:1)            17      19      18      19      18      18      -18     18      18      19          18.20 ms
  google (2001:4860:4860::8888)          14      28      14      17      9       14      -47     24      37      9           21.30 ms
  dns_watch (2001:1608:10:25::1c04:b12f) 22      23      22      22      23      22      -22     22      22      22          22.20 ms
  neustar (2610:a1:1018::1)              23      23      23      23      24      24      23      23      23      23          23.20 ms
  uncensoredDNS (2001:67c:28a4::)        40      40      40      40      40      40      -40     40      40      40          40.00 ms
  adguard (2a00:5a60::ad1:0ff)           86      90      88      94      86      92      -94     86      86      100         90.20 ms
  yandex (2a02:6b8::feed:0ff)            144     94      52      53      498     83      -88     92      119     53         127.60 ms

  tested domains ('atld' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 20 s	 (20/06/2018 12:53 +0200)

```

Remark: the list *atld* is formed with alternative tld, so it can be _normal_ to get short response times, when the DNS does not support these TLDs (domain not found).


## old benches

```text
             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --bench --noresolv -4
	version: v1.3 31/05/2018
```

```text
                                  1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  norton (199.85.126.10)          18      18      17      17      18      18      18      17      18      17          17.60 ms
  freedns (37.235.1.174)          32      n/a     n/a     n/a     n/a     n/a     -30     53      52      30          19.70 ms
  google (8.8.8.8)                8       52      8       14      23      13      -14     13      43      21          20.90 ms
  neustar (156.154.70.1)          51      17      17      17      18      17      -17     18      17      17          20.60 ms
  opendns (208.67.222.222)        17      30      15      23      24      15      -15     20      24      17          20.00 ms
  quad9 (9.9.9.9)                 24      32      38      23      40      25      -23     27      32      26          29.00 ms
  level3 (209.244.0.3)            15      22      16      15      219     19      15      23      24      16          38.40 ms
  verisign  (64.6.64.6)           49      32      17      16      164     19      -18     25      32      33          40.50 ms
  comodo (8.26.56.26)             115     n/a     20      22      180     53      -21     108     67      32          61.80 ms
  freenom (80.80.80.80)           26      44      44      31      142     28      -24     178     27      193         73.70 ms
  adguard (176.103.130.130)       72      99      54      54      100     56      -61     58      162     104         82.00 ms
  cloudflare (1.1.1.1)            9       18      9       9       569     9       -9      15      23      349        101.90 ms
  dns_watch (84.200.69.80)        11      27      27      11      563     11      -12     n/a     30      318        101.00 ms
  yandex (77.88.8.8)              140     124     51      51      109     80      -53     90      326     80         110.40 ms
  dyn_oracle (216.146.35.35)      99      160     94      100     109     93      -90     162     112     113        113.20 ms
  cleanbrowsing (185.228.168.168) 205     165     94      93      105     92      -92     161     99      120        122.60 ms
  alternate_dns (23.253.163.53)   307     207     107     107     212     109     -106    204     110     108        157.70 ms
  uncensoredDNS (91.239.100.100)  100     43      29      29      186     845     -28     54      525     106        194.50 ms

  tested domains ('base' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 24 s	 (31/05/2018 17:44 +0200)

```

```text
                                  1:biz   2:bzh   3:coop  4:info  5:io    6:jobs  7:mobi  8:tel   9:tv    10:xyz      Average
  google (8.8.8.8)                14      35      13      14      21      34      181     29      25      22          38.80 ms
  norton (199.85.126.10)          18      18      18      18      17      18      249     17      17      18          40.80 ms
  cloudflare (1.1.1.1)            22      14      163     9       19      44      192     22      9       10          50.40 ms
  opendns (208.67.222.222)        40      18      167     20      148     28      25      56      148     17          66.70 ms
  freedns (37.235.1.174)          58      51      60      68      45      61      229     57      44      60          73.30 ms
  quad9 (9.9.9.9)                 23      27      58      23      24      35      193     52      26      269         73.00 ms
  dns_watch (84.200.69.80)        24      128     19      322     19      27      173     14      96      14          83.60 ms
  neustar (156.154.70.1)          26      391     197     17      17      46      259     19      19      17         100.80 ms
  freenom (80.80.80.80)           82      35      317     38      31      207     28      59      29      194        102.00 ms
  level3 (209.244.0.3)            47      71      145     23      20      180     349     29      155     20         103.90 ms
  alternate_dns (23.253.163.53)   187     111     n/a     205     108     128     162     119     155     160        133.50 ms
  verisign  (64.6.64.6)           92      29      275     156     26      180     378     132     94      158        152.00 ms
  yandex (77.88.8.8)              90      62      112     115     87      88      633     106     171     165        162.90 ms
  dyn_oracle (216.146.35.35)      106     173     235     242     103     167     359     110     163     156        181.40 ms
  adguard (176.103.130.130)       210     108     213     163     105     191     178     217     254     236        187.50 ms
  comodo (8.26.56.26)             842     83      343     47      67      82      298     90      114     75         204.10 ms
  cleanbrowsing (185.228.168.168) 284     111     228     394     99      203     292     104     261     229        220.50 ms
  uncensoredDNS (91.239.100.100)  330     67      534     149     361     486     214     185     51      733        311.00 ms

  tested domains ('alt' list):
  1:whois.biz 2:pik.bzh 3:www.coop 4:lafibre.info 5:github.io 6:bmwgroup.jobs 7:dotmobi.mobi 8:do.tel 9:france.tv 10:gen.xyz 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 28 s	 (31/05/2018 17:34 +0200)

```

```text
                                  1:com   2:com   3:com   4:com   5:com   6:com   7:com   8:com   9:org   10:com      Average
  cloudflare (1.1.1.1)            9       9       9       9       9       9       9       8       9       9            8.90 ms
  dns_watch (84.200.69.80)        11      11      12      11      12      12      12      18      11      11          12.10 ms
  google (8.8.8.8)                8       8       22      14      15      13      8       13      19      14          13.40 ms
  level3 (209.244.0.3)            15      15      15      14      17      14      17      15      15      15          15.20 ms
  neustar (156.154.70.1)          17      17      17      17      17      17      17      17      17      17          17.00 ms
  norton (199.85.126.10)          18      17      18      17      17      19      18      17      17      17          17.50 ms
  comodo (8.26.56.26)             20      20      20      19      22      27      25      21      20      20          21.40 ms
  quad9 (9.9.9.9)                 23      23      24      23      23      23      23      24      23      23          23.20 ms
  opendns (208.67.222.222)        15      15      17      22      21      15      15      16      99      23          25.80 ms
  verisign  (64.6.64.6)           18      16      18      18      17      16      16      24      121     16          28.00 ms
  freenom (80.80.80.80)           23      23      25      23      23      31      23      24      110     23          32.80 ms
  freedns (37.235.1.174)          30      30      30      30      30      30      30      43      30      51          33.40 ms
  uncensoredDNS (91.239.100.100)  43      28      31      42      29      42      29      62      174     29          50.90 ms
  adguard (176.103.130.130)       107     54      55      54      54      100     54      54      60      55          64.70 ms
  yandex (77.88.8.8)              86      51      79      51      51      51      51      117     80      51          66.80 ms
  cleanbrowsing (185.228.168.168) 90      92      86      85      94      -92     90      83      85      92          88.90 ms
  dyn_oracle (216.146.35.35)      89      83      83      88      91      91      92      98      129     85          92.90 ms
  alternate_dns (23.253.163.53)   106     106     106     106     106     106     106     106     106     106        106.00 ms

  tested domains ('easy' list):
  1:amazon.com 2:facebook.com 3:github.com 4:gmail.com 5:google.com 6:reddit.com 7:twitter.com 8:whatsapp.com 9:wikipedia.org 10:youtube.com 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 11 s	 (31/05/2018 17:35 +0200)

```

```text
                                  1:bbs   2:chan  3:cyb   4:fur   5:ku    6:neo   7:null  8:oz    9:party 10:ti       Average
  google (8.8.8.8)                -14     -13     -14     -13     -14     -14     -14     -17     -32     -13         15.80 ms
  cloudflare (1.1.1.1)            -9      -9      -9      -9      -9      -9      -10     -9      -82     -9          16.40 ms
  norton (199.85.126.10)          28      27      20      18      19      18      18      18      -21     18          20.50 ms
  opendns (208.67.222.222)        -15     -17     -15     -16     -15     -15     -15     -15     -94     -15         23.20 ms
  quad9 (9.9.9.9)                 -23     -24     -25     -24     -26     -25     -23     -23     -35     -29         25.70 ms
  level3 (209.244.0.3)            24      18      18      115     19      18      -17     26      -20     89          36.40 ms
  dns_watch (84.200.69.80)        -41     -12     -12     -12     -27     -121    -12     -122    -26     -13         39.80 ms
  freenom (80.80.80.80)           -24     -41     -31     -109    -39     -31     -41     -25     -43     -25         40.90 ms
  uncensoredDNS (91.239.100.100)  -28     -28     -28     -28     -28     -28     -29     -28     -178    -28         43.10 ms
  verisign  (64.6.64.6)           -94     -24     -18     -18     -25     -19     -155    -88     -38     -17         49.60 ms
  neustar (156.154.70.1)          -37     -118    -19     -43     -130    -27     -17     -96     -180    -90         75.70 ms
  cleanbrowsing (185.228.168.168) -91     -106    -94     -101    -101    -105    -88     -87     -107    -89         96.90 ms
  adguard (176.103.130.130)       -80     -101    -97     -199    -61     -106    -103    n/a     -125    -107        97.90 ms
  comodo (8.26.56.26)             -56     -153    -166    -53     -45     -112    -46     -94     -103    -161        98.90 ms
  yandex (77.88.8.8)              -171    -171    -172    -54     -53     -80     -53     -53     -119    -60         98.60 ms
  alternate_dns (23.253.163.53)   -108    -108    -108    -108    -109    -108    -109    -108    -137    n/a        100.30 ms
  dyn_oracle (216.146.35.35)      -105    -97     -100    -186    -130    -95     -101    -109    -108    -103       113.40 ms
  freedns (37.235.1.174)          n/a     -176    -176    -235    -255    n/a     -177    n/a     -146    n/a        116.50 ms

  tested domains ('atld' list):
  1:register.bbs 2:opennic.chan 3:opennic.cyb 4:nic.fur 5:rojaciwan.ku 6:register.neo 7:reg.null 8:opennic.oz 9:uptime.party 10:vtje.ti 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 21 s	 (31/05/2018 17:35 +0200)
```
