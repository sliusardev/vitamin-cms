<?php

namespace App\Filament\Resources\PostResource\Pages;

use App\Filament\Resources\PostResource;
use Filament\Actions;
use Filament\Actions\Action;
use Filament\Resources\Pages\EditRecord;

class EditPost extends EditRecord
{
    protected static string $resource = PostResource::class;

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
