<?php

namespace App\Http\Middleware;

use Closure;
use Filament\Facades\Filament;
use Filament\Models\Contracts\FilamentUser;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CompanyMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $guard = Filament::auth();

        /** @var Model $user */
        $user = $guard->user();

        if(!$user) {
            return $next($request);
        }

        $panel = Filament::getCurrentPanel();

        if($panel && !empty($user->company)) {
            $panel->brandName($user->company->name);
        }




        return $next($request);
    }
}
