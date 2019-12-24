# Fake SMTP server
Is a wrapper around the FakeSMTP java app running on alpine linux with openjdk 8's JRE ( based on https://github.com/Nilhcem/FakeSMTP )

## Start with docker:
This will start an instance that puts the emails in `/tmp/fakemail` and listens on port `1025`

```bash
docker run -d --name fakesmtp -p 1025:25 -v /tmp/fakemail:/var/mail hatamiarash7/fake-smtp
```

## docker compose:
This will start an instance that listens on port `1025` and saves the emails in the `email` folder in the project

```
version: "3"

services:
  fakesmtp:
    image: hatamiarash7/fake-smtp
    ports:
      - 1025:25
    volumes:
      - ./email:/var/mail
```

## Simple test :

To test the SMTP service, follow these steps: 

On a client computer running Windows Server or Windows 10 (with telnet client installed), type
Telnet at a command prompt, and then press ENTER.
At the telnet prompt, type set LocalEcho, press ENTER, and then type open <machinename> 25, and then press ENTER.

The output resembles the following:

220 computername.microsoft.com ESMTP Server (Microsoft Exchange Internet Mail Service 5.5.2651.58) ready

---

Type ```hello me```, and then press ENTER.

The output resembles the following:

250 OK

---

Type ```mail from:email@domain.com```, and then press ENTER. 

The output resembles the following:

250 OK - mail from <email@domain.com>

---

Type ```rcpt to:youremail@yourdomain.com```, and then press ENTER.

The output resembles the following:

250 OK - Recipient <youremail@yourdomain.com>

---

Type ```Data```, and then press ENTER.

The output resembles the following:

354 Send data.  End with CRLF.CRLF

---

Type ```Subject:This is a test```, and then press ENTER two times.
Type ```Testing```, and then press ENTER.
Press ENTER, type a period (.), and then press ENTER.

The output resembles the following:

250 OK

---

Type ```quit```, and then press ENTER.

The output resembles the following:

221 Closing Port / Mail queued for delivery
