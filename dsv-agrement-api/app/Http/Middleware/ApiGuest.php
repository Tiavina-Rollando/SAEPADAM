<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ApiGuest
{
    
    private $app_origine_authorized = ["angular-front"];

    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (!is_null($request->header('from')) && in_array($request->header('from'), $this->app_origine_authorized)) {
            $request->merge(["_application_request_origine" => strtolower($request->header('from'))]);
            return $next($request);
        } else {
            $request->merge(["_application_request_origine" => strtolower(env('APP_NAME'))]);
            return $next($request);
            // abort(403, "Application origine not detected");
        }
    }
}
