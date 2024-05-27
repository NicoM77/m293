### Lernziel: Grundlagen des HTTP-Protokolls

#### 1. Erläuterung der Abkürzung HTTP und dessen Zweck

**HTTP** steht für **Hypertext Transfer Protocol**. Es wurde entwickelt, um die Kommunikation zwischen Web-Clients (z.B. Web-Browsern) und Web-Servern zu ermöglichen. HTTP definiert, wie Nachrichten formatiert und übertragen werden sollen und wie Web-Server und -Browser auf verschiedene Befehle reagieren sollen.

#### 2. Bestandteile einer URL

Eine URL (Uniform Resource Locator) besteht aus mehreren Komponenten:
![](https://gitlab.com/ch-tbz-it/Stud/m293g/m293/-/raw/main/T3_Protokoll/x_gitressources/URL.png)

- **Protokoll:** Gibt an, welches Protokoll verwendet wird (z.B. `http`, `https`).
- **Host:** Der Domain-Name oder die IP-Adresse des Servers (z.B. `www.example.com`).
- **Port:** Der Port auf dem Server, der angesprochen wird (standardmäßig 80 für HTTP und 443 für HTTPS).
- **Pfad:** Der Pfad zur Ressource auf dem Server (z.B. `/index.html`).
- **Abfrageparameter:** Schlüssel-Wert-Paare, die zusätzliche Daten enthalten (z.B. `?id=123`).
- **Fragment:** Ein Verweis auf eine spezifische Stelle innerhalb einer Ressource (z.B. `#section2`).

Beispiel-URL: `https://www.example.com:443/path/to/resource?id=123#section2`

#### 3. Seiten-Aufruf mit Request und Response

![](https://gitlab.com/ch-tbz-it/Stud/m293g/m293/-/raw/main/T3_Protokoll/x_gitressources/RequestResponseExample.png)
- **Request:** Ein Client sendet eine Anfrage an den Server, die bestimmte Informationen oder Aktionen anfordert.
- **Response:** Der Server verarbeitet die Anfrage und sendet eine Antwort zurück, die den angeforderten Inhalt oder den Status der Anfrage enthält.

#### 4. Bestandteile einer HTTP-Anfrage

Eine HTTP-Anfrage besteht aus:

- **Request-Line:** Enthält die Methode (z.B. GET, POST), die URL und die HTTP-Version (z.B. `GET /index.html HTTP/1.1`).
- **Header:** Schlüssel-Wert-Paare, die zusätzliche Informationen über die Anfrage liefern (z.B. `Host: www.example.com`).
- **Nachrichtentext (Body):** Optional, enthält Daten für die Anfrage, insbesondere bei POST-Anfragen.

#### 5. Bestandteile einer HTTP-Antwort

Eine HTTP-Antwort besteht aus:

- **Status-Line:** Enthält die HTTP-Version, den Statuscode und die Statusmeldung (z.B. `HTTP/1.1 200 OK`).
- **Header:** Schlüssel-Wert-Paare, die zusätzliche Informationen über die Antwort liefern (z.B. `Content-Type: text/html`).
- **Nachrichtentext (Body):** Enthält die eigentlichen Daten der Antwort, wie die HTML-Seite, ein Bild oder eine Datei.

#### 6. Übertragungs-Methoden und Unterschied zwischen GET und POST

**Fünf verschiedene HTTP-Übertragungs-Methoden:**

1. **GET:** Fordert eine Ressource an. Die Parameter werden in der URL übermittelt. Es ist eine Leseoperation, ohne Nebenwirkungen.
2. **POST:** Sendet Daten an den Server, um eine neue Ressource zu erstellen oder eine bestehende zu verändern. Die Daten werden im Nachrichtentext übermittelt.
3. **PUT:** Aktualisiert eine Ressource vollständig. Die Daten werden im Nachrichtentext übermittelt.
4. **DELETE:** Löscht eine Ressource.
5. **HEAD:** Ähnlich wie GET, jedoch wird nur der Header ohne den Nachrichtentext angefordert.

**Unterschied zwischen GET und POST:**

- **GET:** Parameter werden in der URL übermittelt, sichtbar und limitiert in der Länge. Es ist idempotent, was bedeutet, dass mehrfaches Ausführen die gleiche Wirkung hat wie ein einmaliges.
- **POST:** Parameter werden im Nachrichtentext übermittelt, nicht in der URL sichtbar und größere Datenmengen können übertragen werden. Es ist nicht idempotent.

#### 7. Standard-Ports eines Webservers

- **HTTP:** Standard-Port 80
- **HTTPS:** Standard-Port 443

#### 8. Wichtigste Status Codes

- **[200 OK:](https://http.cat/200)** Die Anfrage war erfolgreich.
- **[301 Moved Permanently:](https://http.cat/301)** Die angeforderte Ressource wurde dauerhaft verschoben.
- **[302 Found:](https://http.cat/302)** Die angeforderte Ressource wurde vorübergehend verschoben.
- **[400 Bad Request:](https://http.cat/400)** Die Anfrage war fehlerhaft.
- **[401 Unauthorized:](https://http.cat/401)** Authentifizierung ist erforderlich und fehlgeschlagen oder noch nicht bereitgestellt.
- **[403 Forbidden:](https://http.cat/403)** Der Server versteht die Anfrage, verweigert jedoch die Ausführung.
- **[404 Not Found:](https://http.cat/404)** Die angeforderte Ressource wurde nicht gefunden.
- **[500 Internal Server Error:](https://http.cat/500)** Ein unerwarteter Serverfehler ist aufgetreten.

#### 9. Content-Type von Requests und Responses evaluieren und setzen

Der **Content-Type** Header gibt an, welcher Medientyp die Ressource hat. Dies ist wichtig, damit der Client weiß, wie er die Daten interpretieren soll.

Beispiele für Content-Types:

- **text/html:** HTML-Dokumente
- **application/json:** JSON-Daten
- **text/plain:** Reiner Text
- **image/png:** PNG-Bild

**Evaluierung und Setzen:**

- Bei einem **Request** sollte der Content-Type gesetzt werden, um dem Server mitzuteilen, welches Format die gesendeten Daten haben (z.B. `Content-Type: application/json` bei einer JSON-API).
- Bei einer **Response** setzt der Server den Content-Type, damit der Client die Daten korrekt verarbeiten kann (z.B. `Content-Type: text/html` für eine HTML-Seite).

Dieses Wissen ist grundlegend für das Verständnis und die Arbeit mit Webtechnologien und ermöglicht die Erstellung und Verwaltung von Webanwendungen.