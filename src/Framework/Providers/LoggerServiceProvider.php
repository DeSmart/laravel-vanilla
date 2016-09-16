<?php

namespace Vanilla\Framework\Providers;

use Illuminate\Support\ServiceProvider;

class LoggerServiceProvider extends ServiceProvider
{
    public function boot()
    {
        /** @var \Monolog\Logger $monolog */
//        $monolog = $this->app['log']->getMonolog();
//        $monolog->setHandlers([]);
//
//        $this->app['log']->useFiles('php://stdout');
    }

    public function register()
    {
    }
}