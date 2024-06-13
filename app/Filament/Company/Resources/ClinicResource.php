<?php

namespace App\Filament\Company\Resources;

use App\Filament\Company\Resources\ClinicResource\Pages;
use App\Filament\Company\Resources\ClinicResource\RelationManagers;
use App\Models\Clinic;
use App\Services\CustomFieldService;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Components\Tabs\Tab;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Str;

class ClinicResource extends Resource
{
    protected static ?string $model = Clinic::class;

    protected static ?string $navigationIcon = 'heroicon-s-building-office-2';

    public static function getEloquentQuery(): Builder
    {
        $query = parent::getEloquentQuery();

        return $query->where('company_id', session('company_id'));
    }

    public static function getNavigationLabel(): string
    {
        return trans('clinic.clinics');
    }

    public function getTitle(): string | Htmlable
    {
        return trans('clinic.clinic');
    }

    public static function getPluralLabel(): ?string
    {
        return trans('clinic.clinics');
    }

    public static function getModelLabel(): string
    {
        return trans('clinic.clinic');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Tabs::make('Setting Tabs')
                    ->tabs([
                        Tab::make('Global')
                            ->schema([
                                TextInput::make('name')
                                    ->label(trans('clinic.clinic_name'))
                                    ->required()
                                    ->lazy()
                                    ->afterStateUpdated(fn (string $context, $state, callable $set) => $context ? $set('slug', Str::slug($state)) : null)
                                    ->columnSpanFull(),

                                TextInput::make('slug')
                                    ->label(trans('dashboard.slug'))
                                    ->required()
                                    ->unique(self::getModel(), 'slug', ignoreRecord: true)
                                    ->columnSpanFull(),

                                TextInput::make('email')
                                    ->label(trans('clinic.clinic_email'))
                                    ->email(),

                                TextInput::make('phone')
                                    ->label(trans('clinic.clinic_phone')),

                                TextInput::make('address')
                                    ->label(trans('clinic.clinic_address'))
                                    ->columnSpanFull(),

                                FileUpload::make('logo')
                                    ->label(trans('clinic.clinic_logo'))
                                    ->directory('company')
                                    ->image()
                                    ->columnSpanFull(),

                                TextInput::make('hash')
                                    ->label(trans('clinic.hash'))
                                    ->default(Str::random(15))
                                    ->disabledOn('edit')
                                    ->columnSpanFull(),

                                Toggle::make('is_enabled')
                                    ->label(trans('dashboard.enabled'))
                                    ->default(true),

                            ])->columns(2),

                        Tab::make('SEO')
                            ->schema(CustomFieldService::fields('seo_fields')),
                    ])->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')
                    ->sortable(),

                TextColumn::make('name')
                    ->label(trans('clinic.clinic_name'))
                    ->searchable()
                    ->sortable(),

                TextColumn::make('email')
                    ->sortable(),

                TextColumn::make('phone')
                    ->sortable(),

                TextColumn::make('created_at')
                    ->label(trans('dashboard.created'))
                    ->dateTime('d.m.Y H:i')
                    ->sortable(),
            ])
            ->filters([
                Filter::make('only_enabled')
                    ->label(trans('dashboard.only_enabled'))
                    ->query(fn (Builder $query): Builder => $query->where('is_enabled', true))
                    ->toggle(),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                ActionGroup::make([
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
                ])

            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListClinics::route('/'),
            'create' => Pages\CreateClinic::route('/create'),
            'edit' => Pages\EditClinic::route('/{record}/edit'),
        ];
    }
}
