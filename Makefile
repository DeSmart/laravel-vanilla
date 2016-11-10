dev-deps:
	composer install --prefer-dist

test: dev-deps
	php ./vendor/bin/phpunit

npm-deps:
	which yarn > /dev/null || npm i -g yarn
	yarn

assets: npm-deps
	npm run prod

# vim: set noexpandtab tabstop=4
