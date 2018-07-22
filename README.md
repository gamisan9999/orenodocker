# orenodocker

oreno Sandbox docker container

# requiement

- git
- docker
- ssh_config directory( ~/.ssh )
- aws_credentials directory( ~/.aws or %UserProfile%\.aws )

# getting started

## clone repository

```
$ cd ~/<working_directory>
$ git clone git@github.com:gamisan9999/orenodocker.git
$ cd orenodocker
```

## build container & run sandbox container

```
$ docker-compose build
$ docker-compose run mysandbox /bin/zsh
```

enjoy!!!!!!!

# appendix

## cutomize orenocontainer

pattern...

- modify Dockerfile
- `docker-compose run mysandbox /bin/zsh` after `docker export` to `docker import`

