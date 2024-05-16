<?php

namespace App\Filament\Resources\MenuResource\RelationManagers;

use App\Models\MenuItem;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class MenuItemsRelationManager extends RelationManager
{
    protected static string $relationship = 'menu_items';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make()->schema([
                    TextInput::make('title')
                        ->label(trans('dashboard.title'))
                        ->required(),

                    TextInput::make('link')
                        ->label(trans('dashboard.link')),

                    Select::make('parent_id')
                        ->label(trans('dashboard.parent'))
                        ->options(MenuItem::all()->pluck('title', 'id'))
                        ->searchable(),

                    TextInput::make('order')
                        ->label(trans('dashboard.order'))
                        ->integer(true)
                        ->default(0),

                    Toggle::make('is_enabled')
                        ->label(trans('dashboard.enabled'))
                        ->default(true),
                ])
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('title')
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('title')
                    ->label(trans('dashboard.title'))
                    ->sortable()
                    ->searchable(),

                TextColumn::make('link')
                    ->label(trans('dashboard.link')),

                TextColumn::make('parent.title')
                    ->label(trans('dashboard.parent'))
                    ->sortable(),
                TextColumn::make('order')
                    ->label(trans('dashboard.order'))
                    ->sortable(),
                ToggleColumn::make('is_enabled')
                    ->label(trans('dashboard.enabled')),
            ])
            ->filters([
                Filter::make('only_enabled')
                    ->label(trans('dashboard.only_enabled'))
                    ->query(fn (Builder $query): Builder => $query->where('is_enabled', true))
                    ->toggle(),

                Filter::make('only_main')
//                    ->label(trans('dashboard.only_enabled'))
                    ->query(fn (Builder $query): Builder => $query->whereNull('parent_id'))
                    ->toggle(),
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
