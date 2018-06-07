# nstest


![version: 1.6.3](https://img.shields.io/badge/version-1.6.3-blue.svg?longCache=true&style=for-the-badge)
![bash langage](https://img.shields.io/badge/bash-4-brightgreen.svg?longCache=true&style=for-the-badge)
![license LPRAB / WTFPL](https://img.shields.io/badge/license-LPRAB%20%2F%20WTFPL-blue.svg?longCache=true&style=for-the-badge)


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

```text
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

[voir bench.md](bench.md)


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


![compteur](https://framaclic.org/h/nestest-gif)
