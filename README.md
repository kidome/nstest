# nstest: test of DNS servers


![version: v1.0](https://img.shields.io/badge/version-1.0%20-blue.svg?longCache=true&style=for-the-badge)
![bash langage](https://img.shields.io/badge/bash-version4-brightgreen.svg)
![status](https://img.shields.io/badge/status-release-green.svg)
![license LPRAB / WTFPL](https://img.shields.io/badge/license-LPRAB%20%2F%20WTFPL-blue.svg)


This script test several open DNS servers and/or servers in `resolv.conf` or another file.   

It's written using bash only for speed, except for `dig` (required) and `sort` (not required but useful for the sort)

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
	version: v1.0 26/05/2018

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

  dns servers: ...
  test domains: ...

  more info: https://framaclic.org/h/doc-nstest

```

## download

```shell
git clone https://framagit.org/sdeb/nstest.git
 # or
git clone git@framagit.org:sdeb/nstest.git
 # or
curl -0 https://framaclic.org/h/nstest
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
* atld: 
  * register.bbs | opennic.chan | opennic.cyb | nic.fur | rojaciwan.ku | register.neo | reg.null | opennic.oz | uptime.party | vtje.ti 
* easy: 
  * amazon.com | facebook.com | github.com | gmail.com | google.com | reddit.com | twitter.com | whatsapp.com | wikipedia.org | youtube.com 


## license

[LPRAB / WTFPL](https://framagit.org/sdeb/nstest/blob/master/LICENSE.md)



## examples of report

```text
             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --noresolv --bench
	version: v1.0 26/05/2018

                                  1:org   2:eu    3:fr    4:com   5:info  6:org   7:libre 8:net   9:io    10:sh       Average
  google (8.8.8.8)                8       13      8       15      24      13      -13     18      46      14          17.20 ms
  neustar (156.154.70.3)          17      17      17      17      17      17      -17     17      18      17          17.10 ms
  norton (199.85.126.20)          19      19      17      17      19      17      18      19      18      18          18.10 ms
  opendns (208.67.222.123)        76      24      15      27      37      15      -16     20      24      150         40.40 ms
  level3 (4.2.2.1)                15      29      15      15      305     15      23      15      21      25          47.80 ms
  quad9 (9.9.9.9)                 35      43      31      23      32      24      -26     26      31      282         55.30 ms
  freenom (80.80.80.80)           26      63      36      23      28      27      -24     29      29      284         56.90 ms
  cloudflare (1.1.1.1)            9       20      9       9       967     9       -9      9       41      324        140.60 ms
  comodo (8.26.56.26)             59      800     26      39      279     64      -27     53      45      53         144.50 ms
  cleanbrowsing (185.228.168.168) 193     172     85      85      112     106     -94     220     107     312        148.60 ms
  adguard (176.103.130.132)       279     109     409     61      440     77      -76     67      125     90         173.30 ms
  yandex (77.88.8.7)              325     117     93      51      517     358     -54     88      112     513        222.80 ms

  tested domains:
  1:debian.org 2:eurid.eu 3:free.fr 4:google.com 5:info.info 6:kernel.org 7:be.libre 8:ovh.net 9:packager.io 10:transfer.sh 

  execution time: 13 s	 (26/05/2018 13:33 +0200)

             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --noresolv --bench
	version: v1.0 26/05/2018

                                  1:biz   2:bzh   3:coop  4:info  5:io    6:jobs  7:mobi  8:tel   9:tv    10:xyz      Average
  neustar (156.154.70.3)          17      17      17      17      17      17      17      17      18      17          17.10 ms
  norton (199.85.126.20)          18      18      18      18      18      18      18      17      18      18          17.90 ms
  google (8.8.8.8)                8       35      32      8       22      42      13      31      26      21          23.80 ms
  cloudflare (1.1.1.1)            68      15      157     9       9       21      283     21      9       10          60.20 ms
  level3 (4.2.2.1)                17      69      154     22      17      35      311     30      32      17          70.40 ms
  opendns (208.67.222.123)        45      17      191     20      17      28      241     24      94      153         83.00 ms
  quad9 (9.9.9.9)                 32      26      72      30      268     46      484     27      41      39         106.50 ms
  freenom (80.80.80.80)           93      126     40      36      42      279     526     48      25      34         124.90 ms
  comodo (8.26.56.26)             225     72      534     48      39      50      456     82      114     39         165.90 ms
  cleanbrowsing (185.228.168.168) 137     96      423     231     102     97      111     108     216     379        190.00 ms
  yandex (77.88.8.7)              86      53      267     209     370     162     673     104     86      110        212.00 ms
  adguard (176.103.130.132)       211     123     505     365     111     257     195     125     304     129        232.50 ms

  tested domains:
  1:whois.biz 2:pik.bzh 3:www.coop 4:lafibre.info 5:github.io 6:bmwgroup.jobs 7:dotmobi.mobi 8:do.tel 9:france.tv 10:gen.xyz 

  execution time: 16 s	 (26/05/2018 13:34 +0200)

             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --noresolv --bench
	version: v1.0 26/05/2018

                                  1:bbs   2:chan  3:cyb   4:fur   5:ku    6:neo   7:null  8:oz    9:party 10:ti       Average
  google (8.8.8.8)                -13     -14     -13     -14     -14     -14     -13     -13     -32     -13         15.30 ms
  neustar (156.154.70.3)          -17     -17     -17     -17     -17     -17     -17     -17     -17     -18         17.10 ms
  norton (199.85.126.20)          18      18      17      18      18      18      18      18      -18     20          18.10 ms
  quad9 (9.9.9.9)                 -23     -32     -24     -23     -25     -23     -23     -25     -36     -25         25.90 ms
  cloudflare (1.1.1.1)            -9      -114    -9      -9      -10     -9      -9      -9      -86     -9          27.30 ms
  opendns (208.67.222.123)        -15     -16     -15     -15     -16     -16     -15     -16     -160    -15         29.90 ms
  freenom (80.80.80.80)           -24     -24     -39     -24     -41     -24     -45     -24     -130    -112        48.70 ms
  yandex (77.88.8.7)              -53     -53     -53     -53     -83     -52     n/a     -53     -262    -53         71.50 ms
  comodo (8.26.56.26)             -60     -201    -49     -67     -136    -65     -36     -51     -219    -52         93.60 ms
  cleanbrowsing (185.228.168.168) -97     -94     -87     -86     -94     -90     -87     -94     -120    -98         94.70 ms
  adguard (176.103.130.132)       -73     -108    -107    -79     -108    -113    -109    -115    -133    -115       106.00 ms
  level3 (4.2.2.1)                652     23      154     23      18      67      -23     68      -23     68         111.90 ms

  tested domains:
  1:register.bbs 2:opennic.chan 3:opennic.cyb 4:nic.fur 5:rojaciwan.ku 6:register.neo 7:reg.null 8:opennic.oz 9:uptime.party 10:vtje.ti 

  execution time: 9953 ms	 (26/05/2018 13:34 +0200)

             _            _   
   _ __  ___| |_ ___  ___| |_ 
  | '_ \/ __| __/ _ \/ __| __|
  | | | \__ \ ||  __/\__ \ |_ 
  |_| |_|___/\__\___||___/\__| --noresolv --bench
	version: v1.0 26/05/2018

                                  1:com   2:com   3:com   4:com   5:com   6:com   7:com   8:com   9:org   10:com      Average
  cloudflare (1.1.1.1)            9       9       9       9       9       9       9       9       9       9            9.00 ms
  google (8.8.8.8)                26      8       13      15      15      8       8       8       13      14          12.80 ms
  level3 (4.2.2.1)                15      15      14      15      15      15      15      15      15      15          14.90 ms
  neustar (156.154.70.3)          17      17      17      17      17      17      17      17      17      17          17.00 ms
  norton (199.85.126.20)          17      17      17      17      17      17      17      17      17      20          17.30 ms
  quad9 (9.9.9.9)                 23      22      24      23      23      23      23      24      23      23          23.10 ms
  comodo (8.26.56.26)             23      23      21      23      21      41      22      28      20      19          24.10 ms
  freenom (80.80.80.80)           23      23      26      35      23      23      23      50      23      23          27.20 ms
  opendns (208.67.222.123)        15      16      148     27      15      15      15      17      15      23          30.60 ms
  yandex (77.88.8.7)              91      51      51      51      51      80      51      81      51      51          60.90 ms
  adguard (176.103.130.132)       67      62      263     63      62      106     61      78      62      62          88.60 ms
  cleanbrowsing (185.228.168.168) 87      85      92      90      92      -83     85      96      90      106         90.60 ms

  tested domains:
  1:amazon.com 2:facebook.com 3:github.com 4:gmail.com 5:google.com 6:reddit.com 7:twitter.com 8:whatsapp.com 9:wikipedia.org 10:youtube.com 

  execution time: 6495 ms	 (26/05/2018 13:35 +0200)
```


## tld alternative

some servers, outside OpenNic, resolve alternative domain names, today: level3 && norton 

* [OpenNIC](): .bbs, .chan, .dyn, .fur, .geek, .gopher, .indy, .libre, .neo, .null, .o, .oss, .oz, .parody, .pirate
* [Emercoin](https://emercoin.com/en/tech-solutions?page=49#services): .bazar, .coin, .amc, .lib, 
* [FurNIC](http://www.nic.fur/): .fur
* [Namecoin](https://namecoin.org/): .bit
* [New Nations](): .ku, .te, .ti, .uu
