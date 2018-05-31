# nstest


![version: v1.2](https://img.shields.io/badge/version-1.2%20-blue.svg?longCache=true&style=for-the-badge)
![bash langage](https://img.shields.io/badge/bash-version4-brightgreen.svg)
![status](https://img.shields.io/badge/status-release-green.svg)
![license LPRAB / WTFPL](https://img.shields.io/badge/license-LPRAB%20%2F%20WTFPL-blue.svg)


This script tests several open DNS servers and/or servers which names must be present in `resolv.conf` or in another file.   

It's written in bash only for speed, except for `dig` (required) and `sort` (not required but useful for the sort)

The results are sorted on average times. 

`dig` is delivered in dnsutils package (`apt install dnsutils` on debian).   
`drill` (package ldns) is not advisable, no management of timeout, except if I don't know how to read a manual. 

It can be exported the report on a pastebin for easy exchange.


## usage

```text
             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| -h
	version: v1.2 28/05/2018

  nstest [options]

        --bench    : run with all lists of domains to test
        --drill    : drill is forced if existing, otherwise dig has priority 
    -e, --export   : export on a pastebin
    -c, --compress : no extended report, only time averages
    -d, --domains  : choice between 3 test domain lists: base (defaut), alt, atld, or easy 
    -f, --file     : the ip in <file> are tested, replace /etc/resolv.conf. format: ip[ # name] per line
        --nodns    : only the nameservers in /etc/resolv.conf or in <file> are tested, no other dns servers used 
        --noresolv : the file /etc/resolv.conf is not read, implied with --file
        --nosort   : no sorted report on average column
        --opt      : print list of dns servers and domains for tests
    -h, --help     : this help

  a time, with a minus before, means that the tested domain is not found 

  examples:
      ./ntest : full report, with nameservers in /etc/resolv.conf and few open DNS servers
      ./ntest --nodns --compress : report with only averages with only nameservers in /etc/resolv.conf
      ./ntest -e  --noresolv : export on a pastebin, to exchange a test
      ./ntest --noresolv -d easy : full report, with domains to test easy, performances are better (responses in cache DNS)
      ./ntest -h  -d alt : this help, with domain list alt(ernative)

  dns servers: 
      ...
  test domains ('base' list): 
      debian.org | eurid.eu | free.fr | google.com | info.info | kernel.org | be.libre | ovh.net | packager.io | transfer.sh 

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

adguard ( 176.103.130.132 )   
cleanbrowsing ( 185.228.168.168 )   
cloudflare ( 1.1.1.1 )   
comodo ( 8.26.56.26 )   
freenom ( 80.80.80.80 )   
google ( 8.8.8.8 )   
level3 ( 4.2.2.1 )   
neustar ( 156.154.70.3 )   
norton ( 199.85.126.20 )   
opendns ( 208.67.222.123 )   
quad9 ( 9.9.9.9 )   
yandex ( 77.88.8.7 )   


Depending on the domains, the response times may differ significantly

* base: 
  * debian.org | eurid.eu | free.fr | google.com | info.info | kernel.org | be.libre | ovh.net | packager.io | transfer.sh 
* alt: 
  * whois.biz | pik.bzh | www.coop | lafibre.info | github.io | bmwgroup.jobs | dotmobi.mobi | do.tel | france.tv | gen.xyz 
* easy: 
  * amazon.com | facebook.com | github.com | gmail.com | google.com | reddit.com | twitter.com | whatsapp.com | wikipedia.org | youtube.com 
* atld: 
  * register.bbs | opennic.chan | opennic.cyb | nic.fur | rojaciwan.ku | register.neo | reg.null | opennic.oz | uptime.party | vtje.ti 


## license

[LPRAB / WTFPL](https://framagit.org/sdeb/nstest/blob/master/LICENSE.md)



## examples of report

```text
             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --noresolv --bench
	version: v1.2 28/05/2018

                                  1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  google (8.8.8.8)                8       14      8       15      24      8       -13     13      40      13          15.60 ms
  quad9 (9.9.9.9)                 26      51      38      24      40      23      -25     27      34      24          31.20 ms
  opendns (208.67.222.123)        15      23      15      27      99      16      -15     20      25      150         40.50 ms
  freenom (80.80.80.80)           26      62      37      23      168     28      -24     116     28      142         65.40 ms
  neustar (156.154.70.3)          20      456     17      17      276     31      -19     17      35      17          90.50 ms
  norton (199.85.126.20)          20      464     17      17      271     19      19      20      40      21          90.80 ms
  cloudflare (1.1.1.1)            9       18      9       9       580     9       -9      9       24      323         99.90 ms
  level3 (4.2.2.1)                15      29      15      15      278     16      358     22      249     15         101.20 ms
  comodo (8.26.56.26)             56      477     23      20      451     60      -57     49      129     37         135.90 ms
  yandex (77.88.8.7)              188     132     123     51      385     110     -172    86      110     82         143.90 ms
  cleanbrowsing (185.228.168.168) 107     267     88      90      268     99      -95     222     115     119        147.00 ms
  adguard (176.103.130.132)       65      168     84      62      538     77      -112    447     587     113        225.30 ms

  tested domains ('base' list):
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 

  execution time: 14 s	 (28/05/2018 12:25 +0200)

             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --noresolv --bench
	version: v1.2 28/05/2018

                                  1:biz   2:bzh   3:coop  4:info  5:io    6:jobs  7:mobi  8:tel   9:tv    10:xyz      Average
  google (8.8.8.8)                31      33      29      13      13      24      42      28      26      14          25.30 ms
  norton (199.85.126.20)          37      59      155     24      24      50      29      17      23      24          44.20 ms
  cloudflare (1.1.1.1)            36      15      158     9       9       206     n/a     12      9       25          47.90 ms
  quad9 (9.9.9.9)                 23      28      59      32      24      53      411     48      26      39          74.30 ms
  opendns (208.67.222.123)        44      19      185     16      17      28      658     25      94      17         110.30 ms
  level3 (4.2.2.1)                47      18      458     15      16      133     376     25      158     17         126.30 ms
  freenom (80.80.80.80)           84      125     177     38      31      207     297     38      149     163        130.90 ms
  neustar (156.154.70.3)          17      775     17      17      17      44      324     42      29      143        142.50 ms
  comodo (8.26.56.26)             281     68      691     48      53      99      164     78      32      32         154.60 ms
  cleanbrowsing (185.228.168.168) 159     419     341     325     109     97      284     97      175     301        230.70 ms
  yandex (77.88.8.7)              156     111     387     275     147     102     783     70      171     136        233.80 ms
  adguard (176.103.130.132)       142     118     466     170     494     312     n/a     160     274     494        263.00 ms

  tested domains ('alt' list):
  1:whois.biz 2:pik.bzh 3:www.coop 4:lafibre.info 5:github.io 6:bmwgroup.jobs 7:dotmobi.mobi 8:do.tel 9:france.tv 10:gen.xyz 

  execution time: 21 s	 (28/05/2018 12:26 +0200)

             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --noresolv --bench
	version: v1.2 28/05/2018

                                  1:com   2:com   3:com   4:com   5:com   6:com   7:com   8:com   9:org   10:com      Average
  cloudflare (1.1.1.1)            9       9       9       9       9       9       9       9       9       9            9.00 ms
  level3 (4.2.2.1)                15      15      15      15      15      15      15      16      15      15          15.10 ms
  neustar (156.154.70.3)          17      17      17      17      17      17      17      17      17      17          17.00 ms
  norton (199.85.126.20)          17      17      17      17      17      17      17      17      17      17          17.00 ms
  opendns (208.67.222.123)        16      16      16      22      26      15      15      17      26      22          19.10 ms
  google (8.8.8.8)                8       8       21      14      13      13      8       13      96      14          20.80 ms
  quad9 (9.9.9.9)                 24      23      23      22      23      23      23      23      23      23          23.00 ms
  comodo (8.26.56.26)             20      22      21      23      23      32      22      24      32      32          25.10 ms
  freenom (80.80.80.80)           30      22      23      27      23      22      23      24      104     23          32.10 ms
  adguard (176.103.130.132)       61      62      61      62      63      62      63      106     128     64          73.20 ms
  yandex (77.88.8.7)              59      51      91      51      51      112     51      87      186     52          79.10 ms
  cleanbrowsing (185.228.168.168) 85      96      102     87      85      -88     88      88      90      83          89.20 ms

  tested domains ('easy' list):
  1:amazon.com 2:facebook.com 3:github.com 4:gmail.com 5:google.com 6:reddit.com 7:twitter.com 8:whatsapp.com 9:wikipedia.org 10:youtube.com 

  execution time: 6632 ms	 (28/05/2018 12:27 +0200)

             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --noresolv --bench
	version: v1.2 28/05/2018

                                  1:bbs   2:chan  3:cyb   4:fur   5:ku    6:neo   7:null  8:oz    9:party 10:ti       Average
  cloudflare (1.1.1.1)            -9      -9      -9      -9      -9      -9      -9      -9      -86     -9          16.70 ms
  google (8.8.8.8)                -14     -22     -13     -13     -14     -13     -13     -13     -34     -13         16.20 ms
  opendns (208.67.222.123)        -16     -15     -15     -16     -15     -15     -15     -16     -87     -15         22.50 ms
  quad9 (9.9.9.9)                 -30     -27     -23     -23     -24     -25     -25     -24     -37     -23         26.10 ms
  freenom (80.80.80.80)           -24     -24     -24     -34     -33     -44     -24     -106    -116    -25         45.40 ms
  norton (199.85.126.20)          125     18      133     18      32      28      18      18      -21     44          45.50 ms
  neustar (156.154.70.3)          -27     -26     -127    -120    -47     -32     -17     -19     -171    -19         60.50 ms
  yandex (77.88.8.7)              -53     -59     -172    -80     -53     -53     -53     -80     -100    n/a         70.30 ms
  level3 (4.2.2.1)                23      153     17      152     17      153     -17     88      -23     153         79.60 ms
  comodo (8.26.56.26)             -124    -32     -59     -119    -22     -21     -52     -53     -347    -22         85.10 ms
  cleanbrowsing (185.228.168.168) -95     -98     -90     -89     -101    -92     -105    -98     -111    -93         97.20 ms
  adguard (176.103.130.132)       -104    -109    -113    -115    -112    -98     -137    -87     -153    -150       117.80 ms

  tested domains ('atld' list):
  1:register.bbs 2:opennic.chan 3:opennic.cyb 4:nic.fur 5:rojaciwan.ku 6:register.neo 7:reg.null 8:opennic.oz 9:uptime.party 10:vtje.ti 

  execution time: 10 s	 (28/05/2018 12:26 +0200)

```
Remark: the list *atld* is formed with alternative tld, so it can be _normal_ to get short response times, when the DNS does not support these TLDs (domain not found).


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
