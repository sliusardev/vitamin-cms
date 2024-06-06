<?php

namespace App\Filament\Company\Pages\Auth;

use App\Models\Company;
use Filament\Forms\Components\TextInput;
use Filament\Http\Responses\Auth\Contracts\RegistrationResponse;
use Filament\Pages\Auth\Register as BaseRegister;
use Filament\Forms\Components\Component;
class Register extends BaseRegister
{
    protected function getForms(): array
    {
        return [
            'form' => $this->form(
                $this->makeForm()
                    ->schema([
                        ...$this->getRegistrationFields(),
                        $this->getNameFormComponent(),
                        $this->getEmailFormComponent(),
                        $this->getPasswordFormComponent(),
                        $this->getPasswordConfirmationFormComponent(),
                    ])
                    ->statePath('data'),
            ),
        ];
    }

    protected function getRegistrationFields(): array
    {
        return [
            TextInput::make('company_name')->required(),
        ];
    }

    public function register(): ?RegistrationResponse
    {
        parent::register();

        $user = auth()->user();
        $companyName = $this->data['company_name'];

        $company = Company::query()->create(['name' => $companyName]);

        session()->put('company_name', $company->name);

        $user->company_id = $company->id;
        $user->save();

        return app(RegistrationResponse::class);
    }
}
