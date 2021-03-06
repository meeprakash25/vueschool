<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
//use Mint\Service\Repositories\InitRepository;
use App\Repositories\Configuration\ConfigurationRepository;

class ScriptMint
{
    protected $config;

    public function __construct(
        ConfigurationRepository $config
    ) {
        $this->config = $config;
    }

    /**
     * Used to set default configuration
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (!\Storage::exists('.app_installed')) {
            return $next($request);
        }

        $this->config->setDefault();

        return $next($request);
    }
}
