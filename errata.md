# Errata voor *Configuratie van een internetserver*

---

**Pagina 18**

Het laatste item van de getoonde lijst bestaat uit slechts 1 alinea.

De zin die begint met "<em>Om 'botsingen' te voorkomen</em>" en de zinnen die daarop volgen, maken geen deel uit van de lijst.

---

**Pagina 68**

Het is niet duidelijk waar de lijst eindigt en waar de lopende tekst weer begint.

Het laatste lijstitem eindigt voor de zin die begint met "<em>Hieronder volgt een eenvoudige maar effectieve aanzet [&hellip;]</em>".

---

**Pagina 71**

Het is niet duidelijk waar de lijst eindigt en waar de lopende tekst weer begint.

Het laatste lijstitem eindigt voor de zin die begint met "<em>Hieronder volgt een eenvoudige maar effectieve aanzet [&hellip;]</em>".

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

**Pagina 153** : Apache modules zoeken op FreeBSD.

![Nee](afbeeldingen/nee.png) <code>freebsd# pkg **src** mod_</code>

![Ja](afbeeldingen/ja.png) <code>freebsd# pkg **search** mod_</code>

---

**Pagina 162**

Deze pagina bevat 2 lijsten, met daartussen een lopende tekst. Helaas is de scheiding tussen deze elementen onduidelijk.

De eerste lijst bevat 4 elementen:

- <code>main</code>
- <code>http</code>
- <code>server</code>
- <code>location</code>

Dan volgt een lopende tekst; deze begint met "<em>Aanvullende configuratiebestanden kunnen ingevoegd worden [&hellip;]</em>".

De tweede lijst begint met de volgende elementen, en loopt dan door op de volgende pagina:

- <code>load_module "/pad/naar/modules/module.so";</code>
- <code>worker_processes auto;</code>

---

**Pagina 164**

De laatste alinea van paragraaf 9.3 en het voorbeeldcommando daaronder maken geen deel uit van het lijstitem daarboven.

---

**Pagina 165** : Inschakelen van PHP-FPM onder FreeBSD.

![Nee](afbeeldingen/nee.png) <code>freebsd# service **enable php-fpm**</code>

![Ja](afbeeldingen/ja.png) <code>freebsd# service **php-fpm enable**</code>

---

**Pagina 171** : De directory <code>alias</code> voor een virtual host of server.

![Nee](afbeeldingen/nee.png) onder Apache heet dat een *alias* en Nginx noemt het een *location*

![Ja](afbeeldingen/ja.png) Apache en Nginx noemen zo'n verwijzing een *alias*

> De alias wordt voor Nginx gedefinieerd in een *location* context; zie pagina 277: hoofdstuk *Webserver - deel 2*, paragraaf *Alias*.

---

**Pagina 172** : De *default ACL* onder FreeBSD.

![Nee](afbeeldingen/nee.png)\
<code># setfacl -m default:user:www-groen:rx ./groen.example.com</code>

![Ja](afbeeldingen/ja.png)\
<code>**bsd# setfacl -d -m user::rwx,group::rx,o::- ./groen.example.com**</code>\
<code>**bsd# setfacl -d -m user:www-groen:rx ./groen.example.com**</code>\
<code>**linux**# setfacl -m default:user:www-groen:rx ./groen.example.com</code>

> De *default ACL* worden onder FreeBSD anders gedefinieerd dan onder Linux; zie errata voor pagina 104.

---

**Pagina 172** : De *default ACL* onder FreeBSD.

![Nee](afbeeldingen/nee.png)\
<code>freebsd# setfacl -m user:www:rx .</code>\
<code>freebsd# setfacl -d -m user:www:rx .</code>

![Ja](afbeeldingen/ja.png)\
<code>freebsd# setfacl -m user:www:rx .</code>\
<code>**freebsd# setfacl -d -m user::rwx,group::rwx,other::\-\-\- .</strong>**</code>\
<code>freebsd# setfacl -d -m user:www:rx .</code>

> Voordat de *default ACL* voor specifieke gebruikers en groepen gedefinieerd kunnen worden, moeten eerst de algemene *default ACL* gedefinieerd worden; zie errata voor pagina 104.

---

**Pagina 173** : De *default ACL* onder FreeBSD.

![Nee](afbeeldingen/nee.png)\
<code># setfacl -m d:u:www-groen:rwx groen.example.com/tmp</code>

![Ja](afbeeldingen/ja.png)\
<code>**bsd# setfacl -d -m user::rwx,group::rx,o::- groen.example.com/tmp**</code>\
<code>**bsd# setfacl -d -m user:www-groen:rwx groen.example.com/tmp**</code>\
<code>**linux**# setfacl -m d:u:www-groen:rwx groen.example.com/tmp</code>

> De *default ACL* worden onder FreeBSD anders gedefinieerd dan onder Linux; zie errata voor pagina 104.

---

**Pagina 219** : De configuratiebestanden van phpLDAPadmin.

![Nee](afbeeldingen/nee.png) De configuratiebestanden [&hellip;] <code>/etc/phpldapadmin</code>.

![Ja](afbeeldingen/ja.png) De configuratiebestanden [&hellip;] <code>/etc/phpldapadmin</code> **(<code>/usr/local/www/phpldapadmin/config</code> op FreeBSD)**.

---

**Pagina 220** : Het uitschakelen van TLS versleuteling voor phpLDAPadmin.

![Nee](afbeeldingen/nee.png) Het certificaat zal later gebruikt worden om de verbinding met e-mailclients te versleutelen, wanneer zij gebruik maken van het gedeelde adresboek.

![Ja](afbeeldingen/ja.png) Het certificaat zal gebruikt worden voor de versleuteing van het verkeer tussen desktop toepassingen, zoals Apache Directory Studio, en de server. Het TLS certificaat van *db.example.com* verzorgt de versleuteling van het verkeer tussen de gebruiker en phpLDAPadmin.

---

**Pagina 273**

Het is niet duidelijk waar de lijst op deze pagina ophoudt.

De lopende tekst die volgt op het laatste lijstitem begint met "<em>Eén niet eerder behandelde parameter wordt toegevoegd aan de webserverconfiguratie: [&hellip;]</em>".

---

**Pagina 305/306**

De tekst die begint op pagina 306 maakt geen deel uit van het laatste item van de lijst op pagina 305.
