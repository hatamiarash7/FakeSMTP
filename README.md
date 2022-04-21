# Fake SMTP server

[![Publish](https://github.com/hatamiarash7/FakeSMTP/actions/workflows/publish.yml/badge.svg)](https://github.com/hatamiarash7/FakeSMTP/actions/workflows/publish.yml) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/hatamiarash7/fake-smtp/latest)

Is a wrapper around the FakeSMTP java app running on alpine linux with openjdk 11's JRE ( based on <https://github.com/Nilhcem/FakeSMTP> )

## Start with docker

This will start an instance that puts the emails in `/tmp/fakemail` and listens on port `1025`

```bash
docker run -d --name fakesmtp -p 1025:25 -v /tmp/fakemail:/output hatamiarash7/fake-smtp:master
```

## Docker Compose

This will start an instance that listens on port `1025` and saves the emails in the `email` folder in the project

```yaml
version: "3.9"

services:
  fakesmtp:
    image: hatamiarash7/fake-smtp:latest
    ports:
      - 1025:25
    volumes:
      - /tmp/fakemail:/output
```

## Simple test

To test the SMTP service, follow these steps:

On a client computer running Windows Server or Windows 10 **( with telnet client installed )**, type
`Telnet` at a command prompt, and then press ENTER.

At the telnet prompt, type `set LocalEcho`, press ENTER, and then type `open <machinename> 25`, and then press ENTER.

The output resembles the following:

> 220 computername.microsoft.com ESMTP Server (Microsoft Exchange Internet Mail Service 5.5.2651.58) ready

---

Type `hello me`, and then press ENTER.

The output resembles the following:

> 250 OK

---

Type `mail from:email@domain.com`, and then press ENTER.

The output resembles the following:

> 250 OK - mail from <email@domain.com>

---

Type `rcpt to:youremail@yourdomain.com`, and then press ENTER.

The output resembles the following:

> 250 OK - Recipient <youremail@yourdomain.com>

---

Type `Data`, and then press ENTER.

The output resembles the following:

> 354 Send data. End with CRLF.CRLF

---

Type `Subject:This is a test`, and then press ENTER two times.
Type `Testing`, and then press ENTER.
Press ENTER, type a period (.), and then press ENTER.

The output resembles the following:

> 250 OK

---

Type `quit`, and then press ENTER.

The output resembles the following:

> 221 Closing Port / Mail queued for delivery

---

## Support

[![Donate with Bitcoin](https://en.cryptobadges.io/badge/micro/3GhT2ABRuHuXGNzP6DH5KvLZRTXCBKkx2y)](https://en.cryptobadges.io/donate/3GhT2ABRuHuXGNzP6DH5KvLZRTXCBKkx2y) [![Donate with Ethereum](https://en.cryptobadges.io/badge/micro/0x4832fd8e2cfade141dc4873cc00cf77de604edde)](https://en.cryptobadges.io/donate/0x4832fd8e2cfade141dc4873cc00cf77de604edde)

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/D1D1WGU9)

<div><a href="https://payping.ir/@hatamiarash7"><img src="https://cdn.payping.ir/statics/Payping-logo/Trust/blue.svg" height="128" width="128"></a></div>

## Contributing

1. Fork it !
2. Create your feature branch : `git checkout -b my-new-feature`
3. Commit your changes : `git commit -am 'Add some feature'`
4. Push to the branch : `git push origin my-new-feature`
5. Submit a pull request 😃

## Issues

Each project may have many problems. Contributing to the better development of this project by reporting them.
