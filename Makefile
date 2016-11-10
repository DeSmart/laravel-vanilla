dev-deps:
	composer install --prefer-dist

test: dev-deps
	php ./vendor/bin/phpunit
