# nstest


![version: v1.6](https://img.shields.io/badge/version-1.6%20-blue.svg?longCache=true&style=for-the-badge)
![bash langage](https://img.shields.io/badge/bash-version4-brightgreen.svg)
![status](https://img.shields.io/badge/status-release-green.svg)
![license LPRAB / WTFPL](https://img.shields.io/badge/license-LPRAB%20%2F%20WTFPL-blue.svg)


This script tests several open DNS servers and/or servers which names must be present in `resolv.conf` or in another file.   

It's written in bash only for speed, except for `dig` (required) and `sort` (not required but useful for the sort)

The results are sorted on average times. 

`dig` is delivered in dnsutils package (`apt install dnsutils` on debian).   
`drill` (package ldns) can be used, but is not advisable, no management of timeout, except if I don't know how to read a manual. 

It can be exported the report on a pastebin for easy exchange.


## usage

```text
             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| -h
        version: 1.6 02/06/2018

  usage:  nstest [options]        ( options and arguments must be SEPARATED by one space )

    -4, -6, -46   : protocols to use: ipv4, ipv6, ipv4 & ipv6. by default, the protocol(s) used in the net layer 
        --bench   : run with all lists of domains to test
        --dev     : use dev branch for update or for version number
        --drill   : drill is forced if existing, otherwise dig has priority 
    -e, --export  : export on a pastebin
    -c, --compress: no extended report, only time averages
    -d, --domains : choice between 3 test domain lists: base (defaut), alt, atld, or easy 
    -f, --file    : the ip in <file> are tested, replace /etc/resolv.conf. format: ip[ # name] per line
        --nodns   : only the nameservers in /etc/resolv.conf or in <file> are tested, no other dns servers used 
        --noresolv: the file /etc/resolv.conf is not read, implied with --file
        --nosort  : no sorted report on average column
        --opt     : print list of dns servers and domains used for tests
    -h, --help    : this help
    -s, --sort    : sort on domain number
    -u, --upgrade : load and replace the script in place
    -v, --version : version of the script online and in place

  examples:
      ./ntest                    : full report, with nameservers in /etc/resolv.conf and few open DNS servers
      ./ntest --nodns --compress : report with only averages with only nameservers in /etc/resolv.conf
      ./ntest -e  --noresolv     : export on a pastebin, to exchange a test
      ./ntest --noresolv -d easy : full report, with domains to test easy, performances are better (responses in cache DNS)
      ./ntest -h  -d alt         : this help, with domain list alt(ernative)
      ./ntest --opt              : displays all parameters
      ./ntest --sort 5           : sort on domain number 5
      ./ntest --bench --noresolv : bench for all open DNS, protocols configured in the net layer 
      ./ntest --bench --nodns    : bench for names's servers in resolv.conf, protocols configured in the net layer 

  more info: https://framaclic.org/h/doc-nstest

```

## download

```shell
git clone https://framagit.org/sdeb/nstest.git
 # or
git clone git@framagit.org:sdeb/nstest.git
 # or
curl -OL https://framaclic.org/h/nstest
 # or
wget -nv -O nstest https://framaclic.org/h/nstest

 # if necessary: 
chmod +x nstest
```

## DNS servers and domains tested

````text
  ipv4:
    adguard ( 176.103.130.130 )            alternate_dns ( 23.253.163.53 )    
    cleanbrowsing ( 185.228.168.168 )      cloudflare ( 1.1.1.1 )             
    comodo ( 8.26.56.26 )                  dns_watch ( 84.200.69.80 )         
    dyn_oracle ( 216.146.35.35 )           freedns ( 37.235.1.174 )           
    freenom ( 80.80.80.80 )                google ( 8.8.8.8 )                 
    level3 ( 209.244.0.3 )                 neustar ( 156.154.70.1 )           
    norton ( 199.85.126.10 )               opendns ( 208.67.222.222 )         
    quad9 ( 9.9.9.9 )                      uncensoredDNS ( 91.239.100.100 )   
    verisign  ( 64.6.64.6 )                yandex ( 77.88.8.8 )               

  ipv6:
    adguard ( 2a00:5a60::ad1:0ff )                cloudflare ( 2606:4700:4700::1001 )       
    dns_watch ( 2001:1608:10:25::1c04:b12f )      google ( 2001:4860:4860::8888 )           
    neustar ( 2610:a1:1018::1 )                   quad9 ( 2620:fe::fe )                     
    uncensoredDNS ( 2001:67c:28a4:: )             verisign  ( 2620:74:1b::1:1 )             
    yandex ( 2a02:6b8::feed:0ff )             
```

Depending on the domains, the response times may differ significantly

```text
  base list:
    debian.org     eurid.eu       free.fr        google.com     info.info      
    kernel.org     be.libre       ovh.net        packager.io    transfer.sh    
  alt list:
    whois.biz     pik.bzh       www.coop      lafibre.info  github.io     
    bmwgroup.jobs dotmobi.mobi  do.tel        france.tv     gen.xyz       
  easy list:
    amazon.com     facebook.com   github.com     gmail.com      google.com     
    reddit.com     twitter.com    whatsapp.com   wikipedia.org  youtube.com    
  atld list:
    register.bbs     opennic.chan     opennic.cyb      nic.fur          rojaciwan.ku     
    register.neo     reg.null         opennic.oz       uptime.party     vtje.ti         
```


## license

[LPRAB / WTFPL](https://framagit.org/sdeb/nstest/blob/master/LICENSE.md)



## bench

```text
             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --bench --noresolv
        version: 1.6 02/06/2018

        IPV4                      1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (1.1.1.1)            9       18      9       9       31      9       -9      9       22      10          13.50 ms
  google (8.8.8.8)                13      13      8       15      24      13      -15     8       44      13          16.60 ms
  neustar (156.154.70.1)          17      17      17      18      17      17      -17     17      17      24          17.80 ms
  norton (199.85.126.10)          17      17      17      17      17      19      17      17      17      18          17.30 ms
  level3 (209.244.0.3)            68      29      16      15      163     16      68      22      24      24          44.50 ms
  verisign  (64.6.64.6)           18      23      18      17      151     24      -17     176     27      26          49.70 ms
  quad9 (9.9.9.9)                 24      31      37      23      39      25      -23     27      32      261         52.20 ms
  opendns (208.67.222.222)        24      23      15      25      395     15      -16     19      25      17          57.40 ms
  dns_watch (84.200.69.80)        12      24      27      11      496     19      -12     19      26      19          66.50 ms
  freedns (37.235.1.174)          32      48      30      30      298     45      -30     52      52      45          66.20 ms
  freenom (80.80.80.80)           26      181     37      27      138     25      -31     30      27      342         86.40 ms
  adguard (176.103.130.130)       97      113     92      58      125     115     -106    121     132     107        106.60 ms
  comodo (8.26.56.26)             57      453     23      27      268     58      -34     48      80      59         110.70 ms
  yandex (77.88.8.8)              86      89      52      51      110     51      -229    89      83      269        110.90 ms
  cleanbrowsing (185.228.168.168) 95      171     83      85      99      100     -89     157     99      242        122.00 ms
  dyn_oracle (216.146.35.35)      190     165     87      109     172     163     -85     156     175     87         138.90 ms
  alternate_dns (23.253.163.53)   100     198     97      97      954     100     -98     299     102     104        214.90 ms
  uncensoredDNS (91.239.100.100)  54      43      28      28      73      827     -28     53      826     405        236.50 ms

  tested domains ('base' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 19 s	 (02/06/2018 15:36 +0200)

        IPV6                             1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (2606:4700:4700::1001)      10      9       9       9       9       10      -9      9       9       9            9.20 ms
  verisign  (2620:74:1b::1:1)            16      16      27      18      18      18      -17     19      17      17          18.30 ms
  google (2001:4860:4860::8888)          14      14      13      15      25      21      -13     14      41      32          20.20 ms
  dns_watch (2001:1608:10:25::1c04:b12f) n/a     22      22      22      22      22      n/a     22      22      n/a         22.00 ms
  neustar (2610:a1:1018::1)              26      24      23      24      23      23      22      23      23      23          23.40 ms
  uncensoredDNS (2001:67c:28a4::)        39      40      39      39      40      40      -39     40      39      39          39.40 ms
  yandex (2a02:6b8::feed:0ff)            85      122     94      52      237     202     -50     93      110     78         112.30 ms
  quad9 (2620:fe::fe)                    32      34      15      15      924     17      -17     19      25      276        137.40 ms
  adguard (2a00:5a60::ad1:0ff)           218     572     85      89      685     221     -204    310     396     206        298.60 ms

  tested domains ('base' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 31 s	 (02/06/2018 15:36 +0200)

        IPV4                      1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (1.1.1.1)            9       9       9       9       9       9       -9      9       9       9            9.00 ms
  dns_watch (84.200.69.80)        11      11      11      11      11      11      -11     11      11      11          11.00 ms
  google (8.8.8.8)                13      13      8       13      20      8       -14     17      36      9           15.10 ms
  verisign  (64.6.64.6)           15      15      16      16      16      16      -16     16      17      16          15.90 ms
  neustar (156.154.70.1)          17      18      17      17      17      17      -17     17      17      17          17.10 ms
  norton (199.85.126.10)          18      18      18      17      17      17      17      18      18      17          17.50 ms
  opendns (208.67.222.222)        17      23      16      22      25      15      -15     20      26      17          19.60 ms
  uncensoredDNS (91.239.100.100)  28      28      29      28      29      29      -28     29      29      29          28.60 ms
  freenom (80.80.80.80)           25      60      38      23      25      28      -24     29      43      32          32.70 ms
  level3 (209.244.0.3)            38      14      14      17      278     16      15      25      15      15          44.70 ms
  quad9 (9.9.9.9)                 40      50      38      23      23      23      -23     38      23      260         54.10 ms
  freedns (37.235.1.174)          31      48      30      30      210     30      -30     53      57      45          56.40 ms
  comodo (8.26.56.26)             21      24      24      21      320     55      -21     21      46      21          57.40 ms
  adguard (176.103.130.130)       55      52      55      54      60      71      -58     54      102     98          65.90 ms
  cleanbrowsing (185.228.168.168) 85      98      83      85      87      96      -85     87      92      87          88.50 ms
  alternate_dns (23.253.163.53)   98      97      97      98      97      98      -97     98      101     98          97.90 ms
  yandex (77.88.8.8)              116     89      130     51      268     82      n/a     89      113     122        117.77 ms
  dyn_oracle (216.146.35.35)      180     167     87      98      343     95      -86     88      102     100        134.60 ms

  tested domains ('alt' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 13 s	 (02/06/2018 15:37 +0200)

        IPV6                             1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (2606:4700:4700::1001)      9       9       9       9       9       9       -9      9       26      9           10.70 ms
  quad9 (2620:fe::fe)                    16      24      30      15      34      15      -16     16      15      15          19.60 ms
  google (2001:4860:4860::8888)          14      13      13      14      35      21      -14     14      44      22          20.40 ms
  neustar (2610:a1:1018::1)              23      23      24      23      23      26      24      22      24      26          23.80 ms
  dns_watch (2001:1608:10:25::1c04:b12f) 22      22      22      22      n/a     22      -22     31      45      22          25.55 ms
  verisign  (2620:74:1b::1:1)            17      17      17      18      19      18      -19     178     27      17          34.70 ms
  uncensoredDNS (2001:67c:28a4::)        39      39      39      39      40      39      -39     64      56      39          43.30 ms
  adguard (2a00:5a60::ad1:0ff)           85      83      83      87      91      88      -83     89      91      85          86.50 ms
  yandex (2a02:6b8::feed:0ff)            300     121     52      50      264     85      -54     50      109     264        134.90 ms

  tested domains ('alt' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 20 s	 (02/06/2018 15:37 +0200)

        IPV4                      1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (1.1.1.1)            9       9       9       9       9       9       -9      9       9       16           9.70 ms
  dns_watch (84.200.69.80)        11      11      11      11      11      11      -11     11      11      11          11.00 ms
  verisign  (64.6.64.6)           16      16      16      15      15      17      -15     15      16      16          15.70 ms
  level3 (209.244.0.3)            21      15      15      15      21      17      15      17      22      15          17.30 ms
  neustar (156.154.70.1)          17      17      17      17      17      17      -17     17      17      22          17.50 ms
  norton (199.85.126.10)          17      17      17      17      17      18      17      17      17      17          17.10 ms
  google (8.8.8.8)                8       30      8       14      25      8       -66     13      43      14          22.90 ms
  quad9 (9.9.9.9)                 23      23      23      23      23      24      -23     30      34      27          25.30 ms
  uncensoredDNS (91.239.100.100)  29      28      28      28      29      29      -28     29      29      29          28.60 ms
  opendns (208.67.222.222)        15      23      15      23      161     16      -15     20      24      17          32.90 ms
  freenom (80.80.80.80)           27      52      37      23      32      26      -24     29      26      113         38.90 ms
  freedns (37.235.1.174)          31      54      30      30      136     43      -30     53      55      45          50.70 ms
  comodo (8.26.56.26)             226     21      37      23      46      20      -23     32      45      41          51.40 ms
  adguard (176.103.130.130)       60      64      54      53      55      63      n/a     102     52      53          61.77 ms
  alternate_dns (23.253.163.53)   98      98      98      97      97      98      -98     98      98      98          97.80 ms
  yandex (77.88.8.8)              120     122     95      51      230     78      -90     91      85      83         104.50 ms
  cleanbrowsing (185.228.168.168) 86      85      83      89      87      85      -87     158     259     85         110.40 ms
  dyn_oracle (216.146.35.35)      83      89      83      92      92      89      -84     156     190     175        113.30 ms

  tested domains ('easy' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 13 s	 (02/06/2018 15:38 +0200)

        IPV6                             1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (2606:4700:4700::1001)      9       9       9       9       9       9       -9      9       9       9            9.00 ms
  google (2001:4860:4860::8888)          14      14      13      14      13      14      -14     13      38      13          16.00 ms
  quad9 (2620:fe::fe)                    15      24      30      15      15      15      -15     18      16      15          17.80 ms
  verisign  (2620:74:1b::1:1)            18      18      18      18      17      17      -16     18      18      17          17.50 ms
  dns_watch (2001:1608:10:25::1c04:b12f) 22      22      22      22      22      22      -22     23      n/a     23          22.22 ms
  neustar (2610:a1:1018::1)              23      23      23      23      27      25      22      23      26      23          23.80 ms
  uncensoredDNS (2001:67c:28a4::)        39      39      40      39      40      40      -39     40      39      39          39.40 ms
  adguard (2a00:5a60::ad1:0ff)           91      92      85      90      87      85      -91     159     123     89          99.20 ms
  yandex (2a02:6b8::feed:0ff)            90      88      50      49      358     87      -218    92      83      52         116.70 ms

  tested domains ('easy' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 19 s	 (02/06/2018 15:38 +0200)

        IPV4                      1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (1.1.1.1)            9       9       20      9       9       9       -9      9       24      9           11.60 ms
  google (8.8.8.8)                13      13      8       8       13      8       -14     8       31      13          12.90 ms
  dns_watch (84.200.69.80)        11      11      11      11      14      11      -11     20      29      11          14.00 ms
  level3 (209.244.0.3)            14      22      15      15      15      15      15      23      16      16          16.60 ms
  norton (199.85.126.10)          17      18      17      17      17      17      18      18      17      18          17.40 ms
  verisign  (64.6.64.6)           15      16      16      16      15      16      -16     25      26      16          17.70 ms
  neustar (156.154.70.1)          26      17      17      17      18      17      -17     17      17      17          18.00 ms
  freedns (37.235.1.174)          30      30      30      30      30      30      -31     53      31      45          34.00 ms
  comodo (8.26.56.26)             21      25      23      29      26      32      -21     118     45      49          38.90 ms
  uncensoredDNS (91.239.100.100)  29      28      29      29      29      29      -29     117     45      29          39.30 ms
  opendns (208.67.222.222)        15      23      15      23      236     15      -15     20      24      17          40.30 ms
  quad9 (9.9.9.9)                 23      23      23      23      22      24      -23     28      32      298         51.90 ms
  adguard (176.103.130.130)       52      53      53      53      52      53      -53     52      99      62          58.20 ms
  cleanbrowsing (185.228.168.168) 87      89      83      83      85      85      -87     87      85      85          85.60 ms
  dyn_oracle (216.146.35.35)      91      83      87      93      85      85      -87     157     84      85          93.70 ms
  freenom (80.80.80.80)           26      44      35      23      779     27      -25     29      46      35         106.90 ms
  alternate_dns (23.253.163.53)   98      98      98      98      97      98      -98     194     102     98         107.90 ms
  yandex (77.88.8.8)              242     51      95      51      427     51      -80     51      122     80         125.00 ms

  tested domains ('atld' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 13 s	 (02/06/2018 15:38 +0200)

        IPV6                             1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  cloudflare (2606:4700:4700::1001)      10      9       9       10      9       9       -9      9       9       9            9.20 ms
  quad9 (2620:fe::fe)                    15      15      18      15      16      15      -17     19      24      15          16.90 ms
  google (2001:4860:4860::8888)          14      14      13      8       14      14      -15     14      42      30          17.80 ms
  verisign  (2620:74:1b::1:1)            17      16      18      17      18      18      -17     17      18      18          17.40 ms
  dns_watch (2001:1608:10:25::1c04:b12f) 23      22      22      22      23      22      n/a     22      22      23          22.33 ms
  neustar (2610:a1:1018::1)              24      22      23      26      24      24      22      23      23      24          23.50 ms
  uncensoredDNS (2001:67c:28a4::)        39      39      39      39      47      44      -39     40      41      40          40.70 ms
  adguard (2a00:5a60::ad1:0ff)           91      85      94      85      92      85      -85     83      92      86          87.80 ms
  yandex (2a02:6b8::feed:0ff)            111     90      94      49      200     51      n/a     87      82      81          93.88 ms

  tested domains ('atld' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 
      n/a indicates an inaccessible server, dash (-) indicates a domain not found 

  execution time: 20 s	 (02/06/2018 15:39 +0200)

```
Remark: the list *atld* is formed with alternative tld, so it can be _normal_ to get short response times, when the DNS does not support these TLDs (domain not found).


## old bench

```text
             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --bench --noresolv -4
	version: v1.3 31/05/2018

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

             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --bench --noresolv -4
	version: v1.3 31/05/2018

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

             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --bench --noresolv -4
	version: v1.3 31/05/2018

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

             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --bench --noresolv -4
	version: v1.3 31/05/2018

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

## tld alternative

some servers, outside OpenNic, resolve alternative domain names, today: level3 && norton 

* [OpenNIC](https://www.opennic.org/): .bbs, .chan, .dyn, .fur, .geek, .gopher, .indy, .libre, .neo, .null, .o, .oss, .oz, .parody, .pirate
* [Emercoin](https://emercoin.com/en/tech-solutions?page=49#services): .bazar, .coin, .amc, .lib, 
* [FurNIC](http://www.nic.fur/): .fur
* [Namecoin](https://namecoin.org/): .bit
* [New Nations](http://new-nations.net/en/): .ku, .te, .ti, .uu


## sources

[framagit (gitlab) (framasoft service)](https://framagit.org/sdeb/nstest/blob/master/README.md#nstest)


## license

* [LPRAB / WTFPL](https://framagit.org/sdeb/nstest/blob/master/LICENSE.md)
