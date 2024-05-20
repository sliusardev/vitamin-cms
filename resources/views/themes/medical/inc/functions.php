<?php

use App\Services\CustomFieldService;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\TextInput;

CustomFieldService::setCustomFields('doctors', [
    Repeater::make('doctors')->schema([
        TextInput::make('Name')->required(),
        TextInput::make('Role')->required(),
        FileUpload::make('thumb')
            ->label(trans('dashboard.thumb'))
            ->directory('images')
            ->imageEditor()
            ->image()
            ->columnSpanFull(),
    ])->columns(2)
]);