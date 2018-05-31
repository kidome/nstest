# ipupdate

![version: v1.0](https://img.shields.io/badge/version-1.0%20-blue.svg?longCache=true&style=for-the-badge)
![bash langage](https://img.shields.io/badge/bash-version4-brightgreen.svg)
![status](https://img.shields.io/badge/status-release-green.svg)
![license LPRAB / WTFPL](https://img.shields.io/badge/license-LPRAB%20%2F%20WTFPL-blue.svg)


## client DNS dynamique, ipv4, ipv6

* services DNS dynamiques possibles, en parallèle: duckdns / dynu / freemyip / nh / noip   
  (autre service possible,en développant juste la fonction update_service-spécifique)
* comparaison ip zone dns / ip v4 publique 
* comparaison ip zone dns / ip v6
* les ip publiques s'appuient sur une quinzaine de serveurs de test avec, selon disponibilité, 4 commandes possibles (host, dig, wget, curl). Les serveurs sont interrogés successivement jusqu'à trouver l'adresse ip. le premier serveur utilisé est aléatoire
* l'inscription réelle dans les zones dns est vérifiée. C'est fiable, plus rapidement visible et évite des publications inutiles si le résolveur dns côté client est un peu lent
* contrôle toutes les 5 mn, avec update si changement à publier
* publication minimale tous les 14 jours pour maintenir le compte actif
* gestion erreur critique (selon service), avec ralentissement, sur le seul service en erreur, à une mise à jour horaire jusqu'à correction erreur
* monitoring possible des adresses ipv4 & ipv6 et état connexion (seuls les changements sont inscrits)
* envoi mail possible lors des mise à jours, à un ou plusieurs destinataire
* installation automatisée du script possible mais non obligatoire
* mise à jour automatisée du script possible (lancement manuel, installé ou en place)


## attention, sécurité fichier conf

* le fichier contient des informations sensibles (mot de passe/token) et ne doit donc pas être visible par tous
* hypothèse est faite que seul *root* à le niveau de confiance pour voir/éditer le fichier conf.
* par mesure de sécuritén, les droits read/write, rw devront donc être assignés à lui seul via `chmod 600` par exemple, ce que fait l'installation du script


## requis

* bash 4
* curl
* iproute2 (commande ip)
* coretutils


## chargement

```shell
https://framagit.org/sdeb/ipupdate.git
 # or
git@framagit.org:sdeb/ipupdate.git
 # or
curl -L -o ipupdate.run https://framaclic.org/h/ipupdate-run
 # ou 
wget -nv -O ipupdate.run https://framaclic.org/h/ipupdate-run

 # si besoin: 
chmod +x ipupdate.run

./ipupdate.run
cd ipupdate-release

cp ipupdate.conf.sample ipupdate.conf
```

* éditer le fichier `ipupdate.conf`
* une fois fini, le script peut être 
  * laissé en place (avec la conf à côté du scrip), utile pour tester
  * avec la conf, déplacé dans un autre endroit
     le lancement périodique devra être configuré manuellement
  * installé `ipupdate -i`
    * le script est déplacé dans `/opt/bin`
    * la conf est déplacée dans `/etc`
    * une tâche est inscrite dans `/etc/crontab` pour une exécution toutes les 5 minutes


## help

```text
   _                       _       _ 
  (_)_ __  _   _ _ __   __| | __ _| |_ ___   
  | | '_ \| | | | '_ \ / _' |/ _' | __/ _ \  
  | | |_) | |_| | |_) | (_| | (_| | ||  __/  
  |_| .__/ \__,_| .__/ \__,_|\__,_|\__\___|  -h
    |_|         |_|   v1.0.0 31/05/2018      

  usage :  ipupdate [options]

    sans option  : tous les services configurés sont vérifiés et une éventuelle nouvelle 
                   adresse IP est publiée si changement (root requis)
        --debug  : affichage mode verbeux (publication, session smtp)
        --dev    : utilisation branche dev pour mise à jour ou n° de version 
        --service <service> : réduit les actions sur un seul <service> de DNS dynamique
    -c, --clear  : efface l'ip dans la zone DNS (ou mise en mode hors-ligne) (root requis)
                   (voir à désinstaller ou désactiver l'exécution périodique)
    -f, --force  : force les mises à jours des DNS dynamiques (root requis)
                    -f --service <example> forcera uniquement le service <example>
    -h, --help   : cette aide
    -i, --install: installation (root requis)
    -r, --remove : désinstallation (root requis)
    -u, --upgrade: provoque le chargement et le remplacement du script en place (root requis)
    -v, --version: version du script en ligne et en place 

  script dir    : /home/pi/
  conf file     : /home/pi/ipupdate.conf
  logs file     : /var/log/ipupdate.log
  tracking file : /var/log/track-ipupdate

  active protocols : ipv4 ipv6 
  services dynDns possibles: duckdns / dynu / freemyip / hn / noip
  services dynDns actifs (ip inscrites dans la zone du service dns dynamique:
    toto.duckdns.org (duckdns)  : 99.111.255.44   2001:db8:0:0:1::1
    toto.ddns.net (noip)        : 99.111.255.44
    toto.dynu.net (dynu)        : 99.111.255.44   2001:db8:0:0:1::1
    toto.hn.org (hn)            : 99.111.255.44
    toto.freemyip.com (freemyip): 99.111.255.44

  plus d'infos: https://framaclic.org/h/doc-ipupdate

```

informations complémentaires:
 
* emplacement du script et du fichier de configuration
* services dynDns possibles
* services dynDns utilisées avec les ip correspondantes inscrites dans les zones faisant autorité


## exemples

`ipupdate` pour tous les services de DNS dynamique actifs, pour tous les protocoles activés et par service, met à jour l'ipv4 publique ou l'ipv6 si changement par rapport à celles déclarées dans les dns. Cette commande est celle destinée a être appelée régulièrement pour mettre à jour l'ip, en standard quand installé: toutes les 5 mn, dans le crontab.

`ipupdate -f --debug` force la publication des adresses ip auprès de tous les services de DNS dynamique activés, avec un affichage de la session smtp éventuelle et un log de la séquence de publication.

`ipupdate --service dynu` force la publication des adresses ip auprès de _dynu_ (service de DNS dynamique), en mode standard

`ipupdate -h`  aide succincte avec infos de configurations 

`ipupdate -c --service duckdns` efface l'enregistrement, ou active le mode offline auprès de _duckdns_. le service de DNS dynamique doit supporter cette fonctionnalité, et le lancement périodique du script arrêté (désinstallation ou désinsciption crontab, )

`ipupdate -c` efface l'enregistrement, ou active le mode offline pour tous les services possibles.

`ipupdate -i` installation

`ipupdate -v` affichage versions, en place et en ligne

`ipupdate -u` upgrade, mise à jour (`ipupdate -u --dev` pour utiliser la version de la branche dev, version instable)

`ipupdate -c` effacement des services actifs si cette fonctionnalité est gérée

`ipupdate -r` remove, désinstallation


## installation

le script n'a pas obligatoirement besoin d'être installé et peut être utilisé/mis à jour à n'importe quel emplacement. Dans ce cas, l'inscription dans un crontab ou comme service doit être faite manuellement.

avec l'option `ipupdate -i`:

* root requis
* le script est installé dans `/opt/bin`
* le fichier `ipupdate.conf` est copié dans `/etc/`. Il **doit être présent** à côté du script pour l'installation
* un lien est crée dans `/usr/bin`
* les logs sont préparés dans `/var/log`, d'éventuels fichiers logs présents dans le répertoire courant y seront copiés 
* l'inscription est faite dans le fichier `/etc/crontab` (si présent)
* à l'installation, la périodicité est de 5 mn, qui pourra être modifiée manuellement


## configuration

* charger un fichier `conf.sample` sur le git,  le renommer en `ipupdate.conf` et le modifier.
* chaque option est documentée dans ce fichier
* il sera utilisé par le script dans le répertoire courant du script (script non installé), ou dans le répertoire `/etc/` (script installé)
* `ipupdate.conf` **est requis** lors de l'installation, et sera **déplacé** dans `/etc/`, avec des droits limités **600** (seulement root peut lire ce fichier)
* un fichier `/etc/ipupdate.conf` sera surchargé par un éventuel fichier `ipupdate.conf` se trouvant dans le répertoire courant du script. Utile pour tester avant une deuxième installation par exemple


## surveillance, logs

taille par défaut:

* ipupdate.log : 20 ko
* track-ipupdate : 10 ko

une fois la taille atteinte, ces fichiers sont renommés en <fichier>.1 avant un nouveau remplissage de <fichier> (une seule rotation)

`/var/log/ipupdate.log`:   
Si installé (droits root), ou si accessible en écriture, les évènements propres au script sont placés ici. En cas d'inaccessibilité, les logs sont placés, si possible, dans le répertoire courant du scriot.


`/var/log/track-ipupdate`:   
Si le monitoring est activé (fichier `ipupdate.conf`, `tracking="true"`), si installé (droits root), ou si accessible en écriture, les évènements propres au script sont placés ici. En cas d'inaccessibilité, les logs sont placés, si possible, dans le répertoire courant du scriot.

Seuls les changements d'ip (ipv4 publique et/ou ipv6 globale), sont inscrits dans ce fichier, avec l'état de la connexion internet (ok/KO), l'ipv4 privé et la date locale

exemple:   

```text
99.111.255.44   2001:db8:0:0:1::1  ok  192.168.1.53    24/05/2018 17:00 +0000
                2001:db8:0:0:1::1  KO  192.168.1.53    29/05/2018 11:38 +0000
                                   KO  192.168.1.53    29/05/2018 12:03 +0000
                                   ok  192.168.1.53    29/05/2018 16:47 +0000
99.111.255.44   2001:db8:0:0:1::1  ok  192.168.1.53    29/05/2018 16:50 +0000
```


## mise à jour 

* root requis si installé
* la mise à jour du script n'est pas automatique, elle doit être lancée manuellement, et le script en place est systématiquement remplacé par la version en ligne (pas de contrôle de version)
* les versions du script en place et en ligne peuvent être connues avec `ipupdate -v`


## désinstallation

* root requis
* effacement script et fichier conf
* effacement lien `/usr:bin`
* désinscription dans crontab (si présent)


## mails

si l'envoi de mails est configuré, voir `ipupdate.conf` et activé `envoi_mail="true"`, lors d'une publication,  si **changement** ip réelle par rapport à l'ip dans la zone du serveur de noms ayant autorité:

```text
 ipv4: 99.111.255.44					# ipv4 constatée
 ipv6: 2001:db8:0:0:1::1				# ipv6 constatée
 
  30/05/2018 11:55:02 +0000				# date locale d'envoi avec événement spécial (ou date de boot si moins de 10mn):
										# boot 30/05/2018 12:09 +0000
 
 duckdns (toto.duckdns.org)				# service & domaine traité
 -------
   update: ipv4 ipv6					# ipv4 & ipv6 mises à jour
 
 
 noip (toto.ddns.net)			# erreur "critique", pas de ré-essai avant 1 heure. après résolution du souci:
 -------						# effacer le fichier témoin (/tmp/ipupdate_noip_ip_pub) ou forcer pour tester:
								# ipupdate -f --service <service>
   critical error: check dynamic Dns account, erase file /tmp/ipupdate_noip_ip_pub and test.  
   noip:  badauth Error: failed authentication, check all parameters (authentication, hostname...) 
 
 
 dynu (toto.dynu.net) 
 -------
 										# aucune opération effectuée
 
 hn (toto.hn.org) 
 -------
   hn: 202 Error: server error.			# erreur non critique, ré-essai à la prochaine période (5mn)

 
 freemyip (toto.freemyip.com) 
 -------
   update: ipv4							# ipv4 mise à jour (pas d'ipv6 possible ou nécessaire)
  

 ipupdate v1.0.0
```


## essais services gratuits

* super
  * **dynu.com**:
     * domaines & sous domaines
     * ipv6
     * toutes les fonctionnalités de gestion de zone DNS 
     * mot de passe spécififique pour l'update (indépendant du compte)
     * url hors-ligne
     * ttl réglable
  * freemyip:
     * simple, zero inscription
     * un seul domaine (freemyip.com)
     * pas d'authentification: token, si sous-domaine dispo, obtention du token, rien d'autre à faire ou de possible
     * ipv4 only
     * pas de gestion de compte
     * pas d'effacement de record

* moyen
  * duckdns
     * ipv6 (AAAA)
     * 5 sous-domaines sous i seul domaine (duckdns.org)
     * pas de configuration possible, peu de fonctionnalités
     * publication avec token
     * facebook, reddit, google+, twitter requis
  * hn: rustique, peu de fonctionnalité, ipv4 only, temps de mise à jour zone dns un peu lent parfois?
  * noip: commercial, obligation maintenir compte tous les 30 jours par validation mail, pas d'effacement record

* recalés
  * dnsdynamic: à l'abandon
  * dtdns: temps de mise à jour zone dns TRÈS long


## license

* [LPRAB / WTFPL](https://framagit.org/kyodev/kyopages/blob/master/scripts/LICENSE.md)
