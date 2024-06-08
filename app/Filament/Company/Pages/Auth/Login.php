<?php

namespace App\Filament\Company\Pages\Auth;

use DanHarrin\LivewireRateLimiting\Exceptions\TooManyRequestsException;
use Filament\Facades\Filament;
use Filament\Forms\Components\TextInput;
use Filament\Http\Responses\Auth\Contracts\LoginResponse;
use Filament\Models\Contracts\FilamentUser;
use Filament\Notifications\Notification;
use Filament\Pages\Auth\Login as BaseLogin;

class Login extends BaseLogin
{
    protected function getForms(): array
    {
        return [
            'form' => $this->form(
                $this->makeForm()
                    ->schema([
                        $this->getEmailFormComponent(),
                        $this->getPasswordFormComponent(),
//                        ...$this->getNewFields(),
                        $this->getRememberFormComponent(),
                    ])
                    ->statePath('data'),
            ),
        ];
    }

    protected function getNewFields(): array
    {
        return [
            TextInput::make('hash')
                ->label(trans('clinic.hash'))
                ->password()
                ->revealable(filament()->arePasswordsRevealable())
                ->required(),
        ];
    }

    public function authenticate(): ?LoginResponse
    {
        parent::authenticate();

        $user = Filament::auth()->user();

        session(['company_id' => $$user->company_id]);

        return app(LoginResponse::class);
    }
}
