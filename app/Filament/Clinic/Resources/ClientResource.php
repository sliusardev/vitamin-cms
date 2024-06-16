<?php

namespace App\Filament\Clinic\Resources;

use App\Filament\Clinic\Resources\ClientResource\Pages;
use App\Filament\Clinic\Resources\ClientResource\RelationManagers;
use App\Models\Client;
use Filament\Facades\Filament;
use Filament\Forms;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class ClientResource extends Resource
{
    protected static ?string $model = Client::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-plus';

    public static function getNavigationLabel(): string
    {
        return trans('clinic.clients');
    }

    public static function getPluralLabel(): ?string
    {
        return trans('clinic.clients');
    }

    public static function getModelLabel(): string
    {
        return trans('clinic.client');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make()
                    ->schema([
                        TextInput::make('first_name')
                            ->label(trans('clinic.first_name'))
                            ->required(),

                        TextInput::make('last_name')
                            ->label(trans('clinic.last_name')),

                        TextInput::make('phone')
                            ->label(trans('clinic.phone')),

                        TextInput::make('email')
                            ->label(trans('clinic.email'))
                            ->email(),

                        TextInput::make('address')
                            ->label(trans('clinic.address'))
                            ->columnSpanFull(),

                        TextInput::make('city')
                            ->label(trans('clinic.city')),

                        TextInput::make('hash')
                            ->label(trans('clinic.hash'))
                            ->default(Str::random(8))
                            ->required(),

                    ])->columns(2)
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')
                    ->sortable(),

                TextColumn::make('first_name')
                    ->label(trans('clinic.first_name'))
                    ->searchable()
                    ->sortable(),

                TextColumn::make('last_name')
                    ->label(trans('clinic.last_name'))
                    ->searchable()
                    ->sortable(),

                TextColumn::make('created_at')
                    ->label(trans('dashboard.created'))
                    ->dateTime('d.m.Y H:i')
                    ->sortable(),
            ])
            ->filters([
                Tables\Filters\TrashedFilter::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    Tables\Actions\ForceDeleteBulkAction::make(),
                    Tables\Actions\RestoreBulkAction::make(),
                ]),
            ])->defaultSort('created_at', 'desc');
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
            'index' => Pages\ListClients::route('/'),
            'create' => Pages\CreateClient::route('/create'),
            'edit' => Pages\EditClient::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->withoutGlobalScopes([
                SoftDeletingScope::class,
            ]);
    }
}
