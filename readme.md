# Vanilla Laravel

### Setup

```
git clone git@github.com:DeSmart/laravel-vanilla.git .
```

Set proper paths to folders and shared volumes in the following files:

- `docker/php7/Dockerfile` (WORKDIR)
- `docker/nginx/vhost.conf` (server root)
- `docker-compose.local.yml` (mounted volumes for both 'www' and 'api' services)

Proceed with the following commands:

```
. dev.sh
dc up -d
chmod -R 0777 bootstrap/ storage/ (on host machine)
cp .env.example .env
dc run api composer install --prefer-dist
dc run api php artisan key:generate
dc run api php vendor/bin/codecept bootstrap
rm -rf .git
```

### Setting up Gitlab CI

1. Goto variables setting page (https://git.desmart.com/PROJECT/PATH/variables)
2. Add entry for `APP_KEY` (it will be used for staging environments, and during test builds)
   * this entry should contain full output of `artisan key:generate --show` command  
     alternatively run this command - it will generate full key:

   ```
   docker run --rm desmart/laravel-appkey
   ```
3. Edit `.gitlab-ci.yml` file and update `variables.PROJECT_NAME` value to match yours project name

CI, by default, will:

* run unit tests on every push
  * test command is defined in `Makefile`, it will be ran on `php` container 
* generate and push to registry docker images for `php` and `www` service.
  * images will be built for branches: `develop`, `master`, `release/*` and stable (tagged) versions
* depending on branch a new staging version will be deployed:
  * `develop` -> test version (url: test.PROJECT_NAME.staging.desmart.com)
  * `release/*` -> beta version (url: beta.PROJECT_NAME.staging.desmart.com)

### Suggested packages

In order to speed up development, check out these packages as you might find them useful:
- [desmart/adr](https://github.com/DeSmart/adr) - ADR pattern implementation
- [desmart/jwt-auth](https://github.com/DeSmart/jwt-auth) - Simple JWT implementation fo rapid user authentication

**Below you will find a project `readme.md` template.**

---

# Project Name

Some introduction text here.

---

### Setup
This project requires **Docker** to run. If you don't have Docker installed, please visit https://www.docker.com/ and follow the instructions regarding installation. Once you have Docker installed, proceed with the instructions below.

1. Clone the project from GitLab:
```
git clone git@git.desmart:foo/bar.git .
```

2. Run `composer install`.
3. Do all sorts of crazy stuff to get the project up and running.

---

### Deployment

##### Test
1. `ssh project-name`
2. `cd /var/www/project`
3. `phing build`
4. eat popcorn

##### Beta
1. `ssh project-name`
2. `cd /var/www/project`
3. `phing build`
4. eat popcorn

##### Production
1. `ssh project-name`
2. `cd /var/www/project`
3. `phing build`
4. eat popcorn

---

### Environment
- PHP: 7.0
- MySql: 5.6

---

### Developers
- **Back-end / API** - John Doe, john.doe@desmart.com, mobile +48 555 666 777
- **iOS / Android** - John Doe, john.doe@desmart.com, mobile +48 555 666 777
- **QA** - John Doe, john.doe@desmart.com, mobile +48 555 666 777

---

### Client
- **Product Owner** - John Doe, john.doe@desmart.com, mobile +48 555 666 777
- **Graphic Designer** - John Doe, john.doe@desmart.com, mobile +48 555 666 777

---

### Resources
- **Issue tracker** - https://pivotaltracker.com/n/projects/123
- **Prototype** - https://uxpin.com/foobar
- **Docs** - https://drive.google.com/foobar

---

### Tests
In order to run tests use the following commands:

##### PHPUnit
- run `vendor/bin/phpunit --verbose`

##### PHPSpec
- run `vendor/bin/phpspec run --verbose`

---

### Instances

##### Test
- **API**: http://foo.desmart.com
- **Front-end**: http://bar.desmart.com

##### Beta
- **API**: http://foo.desmart.com
- **Front-end**: http://bar.desmart.com

##### Production
- **API**: http://foo.desmart.com
- **Front-end**: http://bar.desmart.com

---

### Introducing new developer

List of actions needed to be taken when introducing a new developer to the project (e.g. one developer is leaving for holidays and wants to pass his know-how to a new person).

- install and configure the project
- give SSH access
- show pictures of cats
