<?php

namespace App\Actions\Filament;

use Filament\Facades\Filament;
use Filament\Tables\Actions\Action;

class ActionCmsTranslationMapper
{
    public static function make()
    {
        $panelName = Filament::getId();

        return Action::make(trans('dashboard.translate'))
            ->action(fn () => '')
            ->icon('heroicon-o-language')
            ->hidden(fn($record) => !$record->locale)
            ->url(function ($record) use ($panelName) {
                return route('filament.'.$panelName.'.pages.cms-translation-mapper', [
                    'record' => $record->id,
                    'model_type' => class_basename($record),
                ]);
            })
            ->openUrlInNewTab();
    }
}