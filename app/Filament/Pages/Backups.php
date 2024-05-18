<?php

namespace App\Filament\Pages;

use Illuminate\Contracts\Support\Htmlable;
use ShuvroRoy\FilamentSpatieLaravelBackup\Pages\Backups as BackupParen;

class Backups extends BackupParen
{
    protected static ?string $navigationGroup = 'System';

    protected static ?int $navigationSort = 7;
    public function getHeading(): string | Htmlable
    {
        return __('backup.pages.backups.heading');
    }

    public static function getNavigationGroup(): string
    {
        return trans('dashboard.system');
    }

    public static function getNavigationLabel(): string
    {
        return trans('backup.pages.backups.navigation.label');
    }
}