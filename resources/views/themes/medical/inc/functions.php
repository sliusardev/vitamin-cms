<?php

use App\Services\CustomFieldService;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
CustomFieldService::setCustomFields('about', [
    RichEditor::make('custom_fields.education')
        ->columnSpan('full'),
]);