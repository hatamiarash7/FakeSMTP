# Fake SMTP server
Is a wrapper around the FakeSMTP java app running on alpine linux with openjdk 8's JRE ( based on https://github.com/Nilhcem/FakeSMTP )

# Start with docker:
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
