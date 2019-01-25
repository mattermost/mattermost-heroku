[[ ${FILE_SETTINGS__DRIVER_NAME} != "local" ]] || echo "WARNING! Files are being are being stored on disk and will be wiped periodically. This means anything you upload to Mattemost will disappear. For non-preview instances, please use Amazon S3 or install a production setup https://www.mattermost.org/installation/"

export FILE_SETTINGS__DRIVER_NAME=${FILE_SETTINGS__DRIVER_NAME:="local"}
export FILE_SETTINGS__AMAZON_S3_ACCESS_KEY_ID=${FILE_SETTINGS__AMAZON_S3_ACCESS_KEY_ID:=""}
export FILE_SETTINGS__AMAZON_S3_SECRET_ACCESS_KEY=${FILE_SETTINGS__AMAZON_S3_SECRET_ACCESS_KEY:=""}
export FILE_SETTINGS__AMAZON_S3_BUCKET=${FILE_SETTINGS__AMAZON_S3_BUCKET:=""}
export FILE_SETTINGS__AMAZON_S3_REGION=${FILE_SETTINGS__AMAZON_S3_REGION:=""}

lib/envsubst < config/config-heroku-template.json > config/config-heroku.json

bin/platform -config=config/config-heroku.json
