<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class SameSiteMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $response = $next($request);
        

        $cookies = $response->headers->getCookies();

        foreach ($cookies as $cookie) {
            if ($cookie->getSameSite() === null) {
                Cookie::queue(
                    Cookie::make(
                        $cookie->getName(),
                        $cookie->getValue(),
                        $cookie->getExpires(),
                        $cookie->getPath(),
                        $cookie->getDomain(),
                        $cookie->isSecure(),
                        $cookie->isHttpOnly(),
                        true, 
                        $cookie->isRaw(),
                        $cookie->getSameSite() 
                    )
                );
            }
        }

        return $next($request);
    }
}
