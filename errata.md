# Errata voor *Configuratie van een internetserver*

Legenda:

![Nee](afbeeldingen/nee.png) : oorspronkelijke tekst

![Ja](afbeeldingen/ja.png) : gecorrigeerde tekst

---

**Algemeen**

Gelieve voor vragen en opmerkingen over de (tekstuele) vormgeving en de oefeningen direct contact op te nemen met <a href="mailto:service@boomberoepsonderwijs.nl">Boom Beroepsonderwijs</a>.
Deze zijn verzorgd door de uitgever, en ik heb hier weinig tot geen invloed op.

---

**Achterflap**

![Nee](afbeeldingen/nee.png)\
Omdat het boek voornamelijk gaat over de gebruikte applicaties en niet zozeer over het onderliggende besturingssysteem, <strong>zal waar nodig</strong> voorbeelden worden gegeven voor FreeBSD, <strong>Ubuntu</strong> en CentOS

![Ja](afbeeldingen/ja.png)\
Omdat het boek voornamelijk gaat over de gebruikte applicaties en niet zozeer over het onderliggende besturingssysteem, <strong>zullen <del>waar nodig</del></strong> voorbeelden worden gegeven voor FreeBSD, <strong>Debian</strong> en CentOS

---

**Pagina 18**

Het laatste item van de getoonde lijst bestaat uit slechts 1 alinea.

De zin die begint met "<em>Om 'botsingen' te voorkomen</em>" en de zinnen die daarop volgen, maken geen deel uit van de lijst.

---

**Pagina 62** : Herstarten van de service *netif*.

![Nee](afbeeldingen/nee.png)
<pre>freebsd# service netif restart</pre>

![Ja](afbeeldingen/ja.png)
<pre>freebsd# service netif restart<strong> && service routing restart</strong></pre>

> Het herstarten van de netwerkinterface verwijdert alle routes uit de routing table; het herstarten van de *routing* service creëert ze opnieuw. Deze twee diensten moeten in een enkel commando worden herstart.

> Als de *routing* service niet wordt herstart na het herstarten van de *netif* service, wordt de server onbereikbaar, en moet dan gereboot worden. Dit geldt uiteraard alleen wanneer de server van afstand (bijv. via SSH) beheerd wordt.

---

**Pagina 68**

Het is niet duidelijk waar de lijst eindigt en waar de lopende tekst weer begint.

Het laatste lijstitem eindigt voor de zin die begint met "<em>Hieronder volgt een eenvoudige maar effectieve aanzet [&hellip;]</em>".

---

**Pagina 68/69** : De *pf* configuratie.

![Nee](afbeeldingen/nee.png)
<pre><strong># Tabel voor automatisch geblokkeerde IP-adressen.
table f2b persist { }</strong>

[&hellip;]

<strong># Blokkeer expliciet geblokkeerde IP-adressen.
block drop quick from &lt;f2b&gt; to any</strong></pre>

![Ja](afbeeldingen/ja.png)
<pre><strong><del># Tabel voor automatisch geblokkeerde IP-adressen.
table f2b persist { }</del></strong>

[&hellip;]
antispoof for $interface

<strong>anchor "f2b/*"</strong>

# Standaard beleid.
[&hellip;]

<strong><del># Blokkeer expliciet geblokkeerde IP-adressen.
block drop quick from &lt;f2b&gt; to any</del></strong></pre>

> De meest recente versies van Fail2ban maken gebruik van een *anchor* om automatisch de benodigde *tables* en *rules* te creëren. Deze *anchor* wordt ingevoegd tussen de *antispoof* regel en de *block in all* regel; de regels die verwijzen naar de table *f2b* dienen verwijderd te worden.

---

**Pagina 71**

Het is niet duidelijk waar de lijst eindigt en waar de lopende tekst weer begint.

Het laatste lijstitem eindigt voor de zin die begint met "<em>Hieronder volgt een eenvoudige maar effectieve aanzet [&hellip;]</em>".

---

**Pagina 83** : De skeleton directory op FreeBSD.

![Nee](afbeeldingen/nee.png)\
[&hellip;] worden hernoemd bij het kopiëren: *dot.profile* wordt ***.pro-file***, [&hellip;]

![Ja](afbeeldingen/ja.png)\
[&hellip;] worden hernoemd bij het kopiëren: *dot.profile* wordt ***.profile***, [&hellip;]

> Een fout in de vormgeving maakt dat de tekst hier suggereert dat het bestand *.profile* een streepje in de naam zou kunnen hebben; dat is niet het geval.

---

**Pagina 97**

Deze pagina bevat 2 lijsten, met daartussen een lopende tekst. Helaas is de scheiding tussen deze elementen onduidelijk.

De zin "<em>Met deze uitleg kunnen uit bovenstaande directory-listing de volgende conclusies getrokken worden:</em>" vormt de scheiding tussen de lijsten.

---

**Pagina 104**

Deze pagina bevat 2 lijsten, met daartussen een lopende tekst. Helaas is de scheiding tussen deze elementen onduidelijk.

De zin "<em>Een paar voorbeelden van ACL-entry's:</em>" vormt de scheiding tussen de lijsten.

---

**Pagina 104** : Default ACL.

Het instellen van de *default ACL* onder FreeBSD werkt anders dan onder Linux.

Onder FreeBSD bestaat een *ACL entry* altijd uit slechts 3 velden: <code>user/group/other:naam:rechten</code>.

Voor het instellen van *default ACL* onder FreeBSD wordt de <code>-d</code> parameter voor het <code>setfacl</code> commando gebruikt. Echter, voordat de *default ACL* voor een specifieke gebruiker of groep ingesteld kunnen worden, moeten eerst de algemene *default ACL* gedefinieerd worden.

```
freebsd# setfacl -d -m user::rwx,group::r-x,other::--- /srv/www/www.example.com/docs
freebsd# setfacl -d -m group:helpdesk:rwx /srv/www/www.example.com/docs
```

---

**Pagina 141/142** : *Inloggen met een sleutel* onder *Unix*.

> Bij het bewerken van de tekst is de laatste alinea van deze paragraaf verloren gegaan. Deze alinea luidt als volgt:

De toepassing <code>ssh-agent</code>, die samen met de SSH-client is geïnstalleerd, kan gebruikt worden om de sleutel(s) in het geheugen te houden, zodat de gebruiker het wachtwoord slechts een enkele keer hoeft in te geven. Meer informatie over deze toepassing in <code>ssh-agent(1)</code>.

---

**Pagina 153** : Apache modules zoeken op FreeBSD.

![Nee](afbeeldingen/nee.png)
<pre>freebsd# pkg <strong>src</strong> mod_</pre>

![Ja](afbeeldingen/ja.png)
<pre>freebsd# pkg <strong>search</strong> mod_</pre>

---

**Pagina 162**

Deze pagina bevat 2 lijsten, met daartussen een lopende tekst. Helaas is de scheiding tussen deze elementen onduidelijk.

De eerste lijst bevat 4 items:

- <code>main</code>
- <code>http</code>
- <code>server</code>
- <code>location</code>

Dan volgt een lopende tekst; deze begint met "<em>Aanvullende configuratiebestanden kunnen ingevoegd worden [&hellip;]</em>".

De tweede lijst begint met de volgende items, en loopt dan door op de volgende pagina:

- <code>load_module "/pad/naar/modules/module.so";</code>
- <code>worker_processes auto;</code>

---

**Pagina 164**

De laatste alinea van paragraaf 9.3 en het voorbeeldcommando daaronder maken geen deel uit van het lijstitem daarboven.

---

**Pagina 165** : Inschakelen van PHP-FPM onder FreeBSD.

![Nee](afbeeldingen/nee.png)
<pre>freebsd# service <strong>enable php-fpm</strong></pre>

![Ja](afbeeldingen/ja.png)
<pre>freebsd# service <strong>php-fpm enable</strong></pre>

---

**Pagina 171** : De directory <code>alias</code> voor een virtual host of server.

![Nee](afbeeldingen/nee.png)\
onder Apache heet dat een *alias* en Nginx noemt het een *location*

![Ja](afbeeldingen/ja.png)\
Apache en Nginx noemen zo'n verwijzing een *alias*

> De alias wordt voor Nginx gedefinieerd in een *location* context; zie pagina 277: hoofdstuk *Webserver - deel 2*, paragraaf *Alias*.

---

**Pagina 172** : De *default ACL* onder FreeBSD.

![Nee](afbeeldingen/nee.png)
<pre># setfacl -m default:user:www-groen:rx ./groen.example.com</pre>

![Ja](afbeeldingen/ja.png)
<pre><strong>bsd# setfacl -d -m user::rwx,group::rx,o::- ./groen.example.com
bsd# setfacl -d -m user:www-groen:rx ./groen.example.com
linux</strong># setfacl -m default:user:www-groen:rx ./groen.example.com</pre>

> De *default ACL* worden onder FreeBSD anders gedefinieerd dan onder Linux; zie errata voor pagina 104.

---

**Pagina 172** : De *default ACL* onder FreeBSD.

![Nee](afbeeldingen/nee.png)
<pre>freebsd# setfacl -m user:www:rx .
freebsd# setfacl -d -m user:www:rx .</pre>

![Ja](afbeeldingen/ja.png)
<pre>freebsd# setfacl -m user:www:rx .
<strong>freebsd# setfacl -d -m user::rwx,group::rwx,other::\-\-\- .</strong>
freebsd# setfacl -d -m user:www:rx .</pre>

> Voordat de *default ACL* voor specifieke gebruikers en groepen gedefinieerd kunnen worden, moeten eerst de algemene *default ACL* gedefinieerd worden; zie errata voor pagina 104.

---

**Pagina 173** : De *default ACL* onder FreeBSD.

![Nee](afbeeldingen/nee.png)
<pre># setfacl -m d:u:www-groen:rwx groen.example.com/tmp</pre>

![Ja](afbeeldingen/ja.png)
<pre><strong>bsd# setfacl -d -m user::rwx,group::rx,o::- groen.example.com/tmp
bsd# setfacl -d -m user:www-groen:rwx groen.example.com/tmp
linux</strong># setfacl -m d:u:www-groen:rwx groen.example.com/tmp</pre>

> De *default ACL* worden onder FreeBSD anders gedefinieerd dan onder Linux; zie errata voor pagina 104.

---

**Pagina 176/177** : Nginx configuratie; logbestanden.

![Nee](afbeeldingen/nee.png)
<pre>access_log /var/log/www-groen.log
error_log /var/log/www-groen.error</pre>

![Ja](afbeeldingen/ja.png)
<pre>access_log /var/log/www-groen.log<strong>;</strong>
error_log /var/log/www-groen.error<strong>;</strong></pre>

> Configuratie-instructies voor Nginx eindigen altijd op een puntkomma.

> &rarr; 3x

---

**Pagina 176/177** : Nginx configuratie; *location* context.

![Nee](afbeeldingen/nee.png)
<pre>location / {
  [&hellip;]
}
<strong>location ~ \.php$ {
  [&hellip;]
}</strong></pre>

![Ja](afbeeldingen/ja.png)
<pre>location / {
  [&hellip;]
  <strong>location ~ \.php$ {
    [&hellip;]
  }</strong>
}</pre>

> De tweede *location* context, voor PHP-bestanden, hoort in de eerste *location* context.

> &rarr; 3x

---

**Pagina 194** : ACL voor de directory's.

![Nee](afbeeldingen/nee.png)
<pre>freebsd# setfacl -m user:www:rx .
<strong>freebsd# setfacl -m default:user:www:rx .</strong>
[&hellip;]
# setfacl -m user:www-db:rx .
<strong># setfacl -m default:user:www-db:rx .</strong>
# mkdir ./{alias,bin,cgi-bin,conf,htdocs,tmp}
# setfacl -m user:www-db:rwx ./tmp
<strong># setfacl -m default:user:www-db:rwx ./tmp</strong>
# echo "<p>db.example.com</p>" > ./htdocs/index.html
</pre>

![Ja](afbeeldingen/ja.png)
<pre>freebsd# setfacl -m user:www:rx .
<strong>freebsd# setfacl -d -m user::rwx,group::rwx,other::---
freebsd# setfacl -d -m user:www:rx .</strong>
[&hellip;]
# setfacl -m user:www-db:rx .

<strong>bsd# setfacl -d -m user::rwx,group::rwx,other::---
bsd# setfacl -d -m user:www-db:rx .

linux# setfacl -m default:user:www-db:rx .</strong>

# mkdir ./{alias,bin,cgi-bin,conf,htdocs,tmp}
# setfacl -m user:www-db:rwx ./tmp

<strong>bsd# setfacl -d -m user::r-x,group::r-x,other::--- ./tmp
bsd# setfacl -d -m user:www-db:rwx ./tmp

linux# setfacl -m default:user:www-db:rwx ./tmp</strong>

# echo "&lt;p&gt;db.example.com&lt;/p&gt;" &gt; ./htdocs/index.html
</pre>

> De *default ACL* worden onder FreeBSD anders gedefinieerd dan onder Linux; zie errata voor pagina 104.

---

**Pagina 195/196** : Nginx virtual server configuratie.

![Nee](afbeeldingen/nee.png)
<pre><strong>http {</strong>
  server {
    [&hellip;]
  }
  server {
    [&hellip;]
  }
<strong>}</strong></pre>

![Ja](afbeeldingen/ja.png)
<pre>server {
  [&hellip;]
}
server {
  [&hellip;]
}</pre>

> Aangezien de configuraties voor de virtual servers worden ingevoegd in de *http* context (zie pagina 164, hoofdstuk *Webserver - deel&nbsp;1*, paragraaf *Nginx*, *Configuratie*), hoort de *http* context niet in deze configuratie; deze configuratie bevat alleen 2 *server* contexts.

---

**Pagina 196** : Nginx virtual server configuratie.

![Nee](afbeeldingen/nee.png)
<pre>location / {
  [&hellip;]
}
<strong>location ~ \.php$ {
  [&hellip;]
}</strong></pre>

![Ja](afbeeldingen/ja.png)
<pre>location / {
  [&hellip;]
  <strong>location ~ \.php$ {
    [&hellip;]
  }</strong>
}</pre>

> De derde *location* context, voor PHP-bestanden, hoort in de tweede *location* context.

---

**Pagina 201** : Nginx configuratie phpMyAdmin.

![Nee](afbeeldingen/nee.png)
<pre>location /mariadb {
  alias /usr/local/www/phpMyAdmin;
}</pre>

![Ja](afbeeldingen/ja.png)
<pre>location /mariadb {
  alias /usr/local/www/phpMyAdmin;
  <strong>location ~ \.php$ {
    fastcgi_pass 127.0.0.1:9001;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $request_filename;
    include fastcgi_params;
  }</strong>
}</pre>

> De instructies voor PHP-FPM zijn hier verloren gegaan.

---

**Pagina 206** : Nginx configuratie phpPgAdmin.

![Nee](afbeeldingen/nee.png)
<pre>location /postgres {
  alias /usr/local/www/phpPgAdmin;
}</pre>

![Ja](afbeeldingen/ja.png)
<pre>location /postgres {
  alias /usr/local/www/phpPgAdmin;
  <strong>location ~ \.php$ {
    fastcgi_pass 127.0.0.1:9001;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $request_filename;
    include fastcgi_params;
  }</strong>
}</pre>

> De instructies voor PHP-FPM zijn hier verloren gegaan.

---

**Pagina 219** : Nginx configuratie phpLDAPadmin.

![Nee](afbeeldingen/nee.png)
<pre>location /ldap {
  alias /usr/local/www/phpldapadmin/htdocs;
}</pre>

![Ja](afbeeldingen/ja.png)
<pre>location /ldap {
  alias /usr/local/www/phpldapadmin/htdocs;
  <strong>location ~ \.php$ {
    fastcgi_pass 127.0.0.1:9001;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $request_filename;
    include fastcgi_params;
  }</strong>
}</pre>

> De instructies voor PHP-FPM zijn hier verloren gegaan.

---

**Pagina 219** : De configuratiebestanden van phpLDAPadmin.

![Nee](afbeeldingen/nee.png)\
De configuratiebestanden [&hellip;] <code>/etc/phpldapadmin</code>.

![Ja](afbeeldingen/ja.png)\
De configuratiebestanden [&hellip;] <code>/etc/phpldapadmin</code> **(<code>/usr/local/www/phpldapadmin/config</code> op FreeBSD)**.

---

**Pagina 220** : Het uitschakelen van TLS versleuteling voor phpLDAPadmin.

![Nee](afbeeldingen/nee.png)\
Het certificaat zal later gebruikt worden om de verbinding met e-mailclients te versleutelen, wanneer zij gebruik maken van het gedeelde adresboek.

![Ja](afbeeldingen/ja.png)\
Het certificaat zal gebruikt worden voor de versleuteing van het verkeer tussen desktop toepassingen, zoals Apache Directory Studio, en de server. Het TLS certificaat van *db.example.com* verzorgt de versleuteling van het verkeer tussen de gebruiker en phpLDAPadmin.

---

**Pagina 243** : De configuratie van de authenticatie-socket.

![Nee](afbeeldingen/nee.png)
<pre># nano conf.d/10-mai<strong>n.cf</strong></pre>

![Ja](afbeeldingen/ja.png)
<pre># nano conf.d/10-mai<strong>l.conf</strong></pre>

---

**Pagina 247** : Het Postfix configuratiebestand *master.cf*.

![Nee](afbeeldingen/nee.png)\
In het bestand <code>master.**conf**</code> [&hellip;]

![Ja](afbeeldingen/ja.png)\
In het bestand <code>master.**cf**</code> [&hellip;]

> Dit bestand heet *master.cf*, zoals een paar regels eerder aangegeven.

---

**Pagina 255**: De eerste alinea over *DNSBL*.

![Nee](afbeeldingen/nee.png)\
[&hellip;] stuurt het IP-adres van de afzender van de mail **(of dat** als *DNS request* naar de DNSBL; [&hellip;]

![Ja](afbeeldingen/ja.png)\
[&hellip;] stuurt het IP-adres van de afzender van de mail als *DNS request* naar de DNSBL; [&hellip;]

> Hier is een deel van een verwijderde tekst achtergebleven.

---

**Pagina 259** : Aanmaken groep *opendkim* op FreeBSD.

![Nee](afbeeldingen/nee.png)
<pre>freebsd# pw groupadd <strong>-g 127 opendkim</strong></pre>

![Ja](afbeeldingen/ja.png)
<pre>freebsd# pw groupadd <strong>opendkim -g 127</strong></pre>

> Na het subcommando (*groupadd*) moet eerst de naam van de groep gegeven worden, en dan pas de overige parameters.

---

**Pagina 260** : Configuratiebestanden voor OpenDKIM.

![Nee](afbeeldingen/nee.png)\
Om de sleutels te koppelen aan domeinen worden de bestanden *KeyTable* en ***Signing-Table*** gebruikt.

![Ja](afbeeldingen/ja.png)\
Om de sleutels te koppelen aan domeinen worden de bestanden *KeyTable* en ***SigningTable*** gebruikt.

> Een fout in de vormgeving maakt dat de tekst hier suggereert dat het bestand *SigningTable* een streepje in de naam zou kunnen hebben; dat is niet het geval.

---

**Pagina 262** : Bogofilter.

![Nee](afbeeldingen/nee.png)\
Bogofilter is een lerende, zogenaamde *Baysian* spamfilter.

![Ja](afbeeldingen/ja.png)\
Bogofilter is een lerende, zogenaamde *Bay**e**sian* spamfilter.

---

**Pagina 267** : *bogofilter-train.sh*.

![Nee](afbeeldingen/nee.png)
<pre>cat | bogofilter ${FLAG} &</pre>

![Ja](afbeeldingen/ja.png)
<pre>cat | bogofilter <strong>-d "${HOME}/bogofilter"</strong> ${FLAG} &</pre>

> Het pad naar de te gebruiken directory moet overeenkomen met het pad in *bogo-dirs.sh* en *bogofilter-mail.sh*.

---

**Pagina 273**

Het is niet duidelijk waar de lijst op deze pagina ophoudt.

De lopende tekst die volgt op het laatste lijstitem begint met "<em>Eén niet eerder behandelde parameter wordt toegevoegd aan de webserverconfiguratie: [&hellip;]</em>".

---

**Pagina 277/278** : Nginx *alias* configuratie.

![Nee](afbeeldingen/nee.png)
<pre>server {
  listen *:443;
  server_name www.example.com;</pre>

![Ja](afbeeldingen/ja.png)
<pre>server {
  listen *:443<strong> ssl</strong>;
  server_name www.example.com;</pre>

> De parameter *ssl* moet opgegeven worden voor poort 443, om TLS-versleuteling te activeren.

> 2x

---

**Pagina 284/285** : Nginx WebDAV configuratie.

![Nee](afbeeldingen/nee.png)
<pre><strong>http {</strong>
  server {
    [&hellip;]
  }
  server {
    [&hellip;]
  }
<strong>}</strong></pre>

![Ja](afbeeldingen/ja.png)
<pre>server {
  [&hellip;]
}
server {
  [&hellip;]
}</pre>

> Aangezien de configuraties voor de virtual servers worden ingevoegd in de *http* context (zie pagina 164, hoofdstuk *Webserver - deel&nbsp;1*, paragraaf *Nginx*, *Configuratie*), hoort de *http* context niet in deze configuratie; deze configuratie bevat alleen 2 *server* contexts.

---

**Pagina 290** : Nginx Radicale configuratie.

![Nee](afbeeldingen/nee.png)
<pre><strong>http {</strong>
  server {
    [&hellip;]
  }
  server {
    [&hellip;]
  }
<strong>}</strong></pre>

![Ja](afbeeldingen/ja.png)
<pre>server {
  [&hellip;]
}
server {
  [&hellip;]
}</pre>

> Aangezien de configuraties voor de virtual servers worden ingevoegd in de *http* context (zie pagina 164, hoofdstuk *Webserver - deel&nbsp;1*, paragraaf *Nginx*, *Configuratie*), hoort de *http* context niet in deze configuratie; deze configuratie bevat alleen 2 *server* contexts.

---

**Pagina 305/306**

De tekst die begint op pagina 306 maakt geen deel uit van het laatste item van de lijst op pagina 305.
