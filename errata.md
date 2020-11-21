# Errata voor *Configuratie van een internetserver*

---

**Pagina 104** : Default ACL.

Het instellen van de *default ACL* onder FreeBSD werkt anders dan onder Linux.

Onder FreeBSD bestaat een *ACL entry* altijd uit slechts 3 velden: <code>user/group/other:naam:rechten</code>.

Voor het instellen van *default ACL* onder FreeBSD wordt de <code>-d</code> parameter voor het <code>setfacl</code> commando gebruikt. Echter, voordat de *default ACL* voor een specifieke gebruiker of groep ingesteld kunnen worden, moeten eerst de algemene *default ACL* gedefinieerd worden.

```
freebsd# setfacl -d -m u::rwx,g::r-x,o::--- /srv/www/www.example.com/docs
freebsd# setfacl -d -m g:helpdesk:rwx /srv/www/www.example.com/docs
```

---

**Pagina 153** : Apache modules zoeken op FreeBSD.

![Nee](afbeeldingen/nee.png) <code>freebsd# pkg **src** mod_</code>

![Ja](afbeeldingen/ja.png) <code>freebsd# pkg **search** mod_</code>

---

**Pagina 171** : De directory <code>alias</code> voor een virtual host of server.

![Nee](afbeeldingen/nee.png) onder Apache heet dat een *alias* en Nginx noemt het een *location*

![Ja](afbeeldingen/ja.png) Apache en Nginx noemen zo'n verwijzing een *alias*

> De alias wordt voor Nginx gedefinieerd in een *location* context; zie pagina 277: hoofdstuk *Webserver - deel 2*, paragraaf *Alias*.

---

**Pagina 172** : De default ACL onder FreeBSD.

![Nee](afbeeldingen/nee.png)\
<code># setfacl -m default:user:www-groen:rx ./groen.example.com</code>

![Ja](afbeeldingen/ja.png)\
<code>bsd# setfacl -d -m user::rwx,group::rx,o::- ./groen.example.com</code>\
<code>bsd# setfacl -d -m user:www-groen:rx ./groen.example.com</code>\
\
<code>linux# setfacl -m default:user:www-groen:rx ./groen.example.com</code>

> De *default ACL* worden onder FreeBSD anders gedefinieerd dan onder Linux; zie errata voor pagina 104.

---

**Pagina 172** : De default ACL onder FreeBSD.

![Nee](afbeeldingen/nee.png)\
<code>freebsd# setfacl -m user:www:rx .</code>\
<code>freebsd# setfacl -d -m user:www:rx .</code>

![Ja](afbeeldingen/ja.png)\
<code>freebsd# setfacl -m user:www:rx .</code>\
<code><strong>freebsd# setfacl -d -m user::rwx,group::rwx,other::\-\-\- .</strong></code>\
<code>freebsd# setfacl -d -m user:www:rx .</code>

> Voordat de *default ACL* voor specifieke gebruikers en groepen gedefinieerd kunnen worden, moeten eerst de algemene *default ACL* gedefinieerd worden; zie errata voor pagina 104.

---

**Pagina 173** : De default ACL onder FreeBSD.

![Nee](afbeeldingen/nee.png)\
<code># setfacl -m d:u:www-groen:rwx groen.example.com/tmp</code>

![Ja](afbeeldingen/ja.png)\
<code>bsd# setfacl -d -m user::rwx,group::rx,o::- groen.example.com/tmp</code>\
<code>bsd# setfacl -d -m user:www-groen:rwx groen.example.com/tmp</code>\
\
<code>linux# setfacl -m d:u:www-groen:rwx groen.example.com/tmp</code>

> De *default ACL* worden onder FreeBSD anders gedefinieerd dan onder Linux; zie errata voor pagina 104.

---

**Pagina 219** : De configuratiebestanden van phpLDAPadmin.

![Nee](afbeeldingen/nee.png) De configuratiebestanden [&hellip;] <code>/etc/phpldapadmin</code>.

![Ja](afbeeldingen/ja.png) De configuratiebestanden [&hellip;] <code>/etc/phpldapadmin</code> (<code>/usr/local/www/phpldapadmin/config</code> op FreeBSD).

---

**Pagina 220** : Het uitschakelen van TLS versleuteling voor phpLDAPadmin.

![Nee](afbeeldingen/nee.png) Het certificaat zal later gebruikt worden om de verbinding met e-mailclients te versleutelen, wanneer zij gebruik maken van het gedeelde adresboek.

![Ja](afbeeldingen/ja.png) Het certificaat zal gebruikt worden voor de versleuteing van het verkeer tussen desktop toepassingen, zoals Apache Directory Studio, en de server. Het TLS certificaat van db.example.com verzorgt de versleuteling van het verkeer tussen de gebruiker en phpLDAPadmin.
