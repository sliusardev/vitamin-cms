<?php

namespace App\Filament\Company\Pages\Auth;

use App\Enums\RoleEnum;
use App\Models\Company;
use Filament\Forms\Components\TextInput;
use Filament\Http\Responses\Auth\Contracts\RegistrationResponse;
use Filament\Pages\Auth\Register as BaseRegister;
use Illuminate\Support\Str;

class Register extends BaseRegister
{
    protected function getForms(): array
    {
        return [
            'form' => $this->form(
                $this->makeForm()
                    ->schema([
                        ...$this->getNewFields(),
                        $this->getNameFormComponent(),
                        $this->getEmailFormComponent(),
                        $this->getPasswordFormComponent(),
                        $this->getPasswordConfirmationFormComponent(),
                    ])
                    ->statePath('data'),
            ),
        ];
    }

    protected function getNewFields(): array
    {
        return [
            TextInput::make('company_name')
                ->label(trans('clinic.company_name'))
                ->required(),
            TextInput::make('hash')
                ->label(trans('clinic.hash'))
                ->default(Str::random(15))
                ->disabled(),
        ];
    }

    public function register(): ?RegistrationResponse
    {
        parent::register();

        $user = auth()->user();

        $company = Company::query()->create([
            'name' => $this->data['company_name'],
            'hash' => $this->data['hash']
        ]);

        session(['company_id' => $company->id]);

        $user->company_id = $company->id;
        $user->save();

        $user->assignRole(RoleEnum::COMPANY_ADMIN);

        return app(RegistrationResponse::class);
    }
}
