# docker-telegram-cli

lcaparros/telegram-cli docker image allow you to get a telegram-cli instance fast and with the minimum settings requirements. This repository will content some addons that improve telegram-cli with some new features.

## How to get it

```
$ docker pull lcaparros/telegram-cli
$ docker run -itd --name telegram-cli lcaparros/telegram-cli
```

## How to run telegram-cli

To run telegram-cli just type the next commands in the console:

```
$ docker start telegram-cli
$ docker exec -it telegram-cli tlg
```

## How to run telegram cli from a web cli

In this case we will use **web** tag.

```
$ docker pull lcaparros/telegram-cli:web
$ docker run -d --name telegram-cli-web -p 4200:4200 -e SHELLINABOX_ALLOW_SUDO=1 -e SHELLINABOX_USER=user -e SHELLINABOX_PASSWORD=pass lcaparros/telegram-cli:web
```

Then just connect from your favourite web browser to `localhost:4200`

The next environment variables can be provided in order to take a concrete action:

- **SHELLINABOX_USER** - Create a new user with the **SHELLINABOX_USER** username and group
- **SHELLINABOX_PASSWORD** - The password for the new created user
- **SHELLINABOX_ALLOW_SUDO** - Specify if the new user is incuded in sudoers

Feel free to modify and create whatever scenario you need with the provided tools and features.

## Troubleshooting

If you get an error containing the next message:<sup>[2](#myfootnote2)</sup>

```
> telegram-cli: tgl/queries.c:470: tglq_query_result: Assertion `0' failed.
```

Stop and remove the telegram-cli container and run it again.
<br />
<br />
<br />
<br />
<br />
<hr />

<a name="myfootnote1">1</a>: If you want to map a local folder (/Users/lcaparros/telegram-cli in this example) to the telegram-cli download folder, user the run command below:

```
$ docker run -itd --name telegram-cli -v /Users/lcaparros/telegram-cli:/root/.telegram-cli lcaparros/telegram-cli
```
<a name="myfootnote2">2</a>: If a local folder was mapped it's necessary to remove the content of this directory.