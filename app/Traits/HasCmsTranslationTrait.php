<?php

namespace App\Traits;

use App\Models\CmsRecordTranslation;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Builder;

trait HasCmsTranslationTrait
{
    protected static ?string $translationModel = CmsRecordTranslation::class;
    public function scopeLang(Builder $query): void
    {
        $query->where('locale', app()->getLocale());
    }
    public function translation(): HasOne
    {
        return $this->hasOne(self::$translationModel, 'model_id', 'id')->where('model_type', get_called_class());
    }

    public function translations(): \Illuminate\Database\Eloquent\Collection|array
    {
        $translation = $this->translation()->first();

        if(!$translation) {
            return [];
        }

        return self::$translationModel::query()->where('hash', $translation->hash)->get();
    }
    public function getTranslationLocales(): string
    {
        $translations = $this->translations();

        if(!$translations) {
            return '';
        }

        $languages = $translations->where('locale', '!=', $this->locale)->pluck('locale')->all() ?? [];

        return implode(' ', $languages);
    }
}