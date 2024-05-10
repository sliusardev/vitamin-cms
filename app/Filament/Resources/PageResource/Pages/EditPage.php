<?php

namespace App\Filament\Resources\PageResource\Pages;

use App\Filament\Resources\PageResource;
use Filament\Actions;
use Filament\Actions\Action;
use Filament\Resources\Pages\EditRecord;

class EditPage extends EditRecord
{
    protected static string $resource = PageResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
            Action::make('see_on_site')
                ->label(trans('dashboard.see_on_site'))
                ->icon('heroicon-o-eye')
                ->color('primary')
                ->action(function ($record) {
                    $this->redirect($record->link());
                })
        ];
    }
}
