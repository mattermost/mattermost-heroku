# Deploy Mattermost Team or Enterprise Edition to Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

Updated version of Mattermost to deploy in HEROKU. 

Many thanks to [tommyvn](https://github.com/tommyvn) for creating the Mattermost-Heroku integration on which this is based. 

## Deployment to dokku

Dokku is a docker-based alternative to heroku.

Create an application manually and set some defaults:

```bash
app="my-app" # set to your apps' name

dokku apps:create $app
# check app.json for a sane default
dokku config:set $app MATTERMOST_DOWNLOAD_URI=https://releases.mattermost.com/7.3.0/mattermost-7.3.0-linux-amd64.tar.gz
# set the variable to disable dropping privileges, see https://github.com/gliderlabs/herokuish/blob/master/README.md#using-herokuish
dokku config:set $app HEROKUISH_SETUIDGUID=false
```

Create and link a database:

```bash
app="my-app" # set to your apps' name

dokku postgres:create $app
dokku postgres:link $app $app
```

Push this repository to your dokku app:

```bash
app="my-app" # set to your apps' name

git remote add dokku "dokku@my-dokku-instance:$app"
git push dokku master
```

That's it - dokku will output the URL to your Mattermost instance in the log output :)

On first request, you will be asked to set-up the instance.

### Configuration

Check `app.json` and `config/config-heroku-template.json` for available configuration.

You can apply a specific setting by using `dokku config:set $app MY_SETTING=FOO`.
