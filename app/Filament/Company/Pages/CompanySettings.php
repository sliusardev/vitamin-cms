<?php

namespace App\Filament\Company\Pages;

use App\Models\Company;
use App\Models\User;
use App\Services\CustomFieldService;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Components\Tabs\Tab;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Facades\Artisan;
use Str;

class CompanySettings extends Page implements HasForms
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-c-clipboard-document-list';

    protected static string $view = 'filament.company.pages.company-settings';

    public ?array $data = [];

    public User $user;
    private mixed $company;

    public static function getNavigationLabel(): string
    {
        return trans('clinic.company_settings');
    }

    public function getTitle(): string | Htmlable
    {
        return trans('clinic.company_settings');
    }

    public function __construct()
    {
        $this->user = auth()->user();
        $this->company = $this->user->company;
    }

    public function mount(): void
    {
        $this->form->fill($this->company->toArray());
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Tabs::make('Setting Tabs')
                    ->tabs([
                        Tab::make('Global')
                            ->schema([
                                TextInput::make('name')
                                    ->label(trans('clinic.company_name'))
                                    ->required()
                                    ->lazy()
                                    ->afterStateUpdated(fn (string $context, $state, callable $set) => $context ? $set('slug', Str::slug($state)) : null)
                                    ->columnSpanFull(),

                                TextInput::make('email')
                                    ->label(trans('clinic.company_email'))
                                    ->email(),

                                TextInput::make('phone')
                                    ->label(trans('clinic.company_phone'))
                                    ->tel(),

                                TextInput::make('address')
                                    ->label(trans('clinic.company_address'))
                                    ->columnSpanFull(),

                                FileUpload::make('logo')
                                    ->label(trans('clinic.company_logo'))
                                    ->directory('company')
                                    ->image()
                                ->columnSpanFull(),

                                TextInput::make('hash')
                                    ->label(trans('clinic.hash'))
                                    ->default(Str::random(15))
                                    ->disabledOn('edit')
                                    ->columnSpanFull(),

                            ])->columns(2),

                        Tab::make('SEO')
                            ->schema(CustomFieldService::fields('seo_fields')),
                    ]),
            ])
            ->statePath('data');
    }

    public function submit(): void
    {
        $result = $this->form->getState();

        Company::query()->where('id', $this->company->id)->update($result);

        Artisan::call('optimize:clear');

        Notification::make()
            ->title('Saved successfully')
            ->icon('heroicon-o-sparkles')
            ->iconColor('success')
            ->send();
    }
}
