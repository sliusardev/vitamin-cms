<?php

namespace App\Filament\Pages;

use App\Models\CmsRecordTranslation;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CmsTranslationMapper extends Page  implements HasForms
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';

    protected static string $view = 'filament.pages.cms-translation-mapper';

    public ?array $data = [];

    public array $locales;

    public string $model_type;

    public $record;

    public $records;
    /**
     * @var Builder[]|Collection
     */
    public array|Collection $allTranslations;
    protected static bool $shouldRegisterNavigation = false;
    private mixed $modelClassName;

    public function mount(): void
    {
        $this->locales = cmsLocales();
        $this->modelClassName = request()->model_type;
        $this->model_type = "App\Models\\".$this->modelClassName;
        $this->record = $this->model_type::query()
            ->where('id', request()->record)
            ->with('translation')
            ->first();

        $this->records = $this->getAllRecords();
        $this->addLocaleProperties();

        $this->form->fill([$this->record->locale => $this->record->id]);

        if(!empty($this->record->translation)) {
            $this->hash = $this->record->translation->hash;
            $this->allTranslations = $this->record->translations();
            $this->formFillRecords();
        }
    }

    public function getAllRecords()
    {
        $records =  $this->model_type::query()->where('locale', '!=', $this->record->lang);

        if($this->model_type == 'App\Models\Post') {
            $records = $records->where('type', $this->record->type);
        }

        return $records->get();
    }

    public function formFillRecords(): void
    {
        $records = [];

        foreach ($this->allTranslations as $item) {
            $records[$item->locale] = $item->model_id;
        }

        $this->form->fill($records);
    }

    private function addLocaleProperties(): void
    {
        foreach ($this->locales as $locale => $name) {
            $this->$locale = '';
        }
    }

    public function prepareSelectors(): array
    {
        $formSelectors = [];

        foreach ($this->locales as $locale => $name) {
            $records = $this->records?->where('locale', $locale)->pluck('title', 'id');

            if(!$records) continue;

            $formSelectors[] = Select::make($locale)
                ->label($name)
                ->options($records)
                ->disabled($this->record->locale == $locale)
                ->native(false)
                ->searchable();

        }

        return $formSelectors;
    }

    public function removeAllOldRelations($ids): void
    {
        CmsRecordTranslation::query()
            ->where('model_type', $this->model_type)
            ->whereIn('model_id', $ids)
            ->delete();
    }

    public function createRelations($languages): void
    {
        $hash = Str::uuid();
        foreach ($languages as $lang => $model_id) {
            if(!$model_id) {
                continue;
            }
            CmsRecordTranslation::query()->updateOrCreate(
                [
                    'model_type' => $this->model_type,
                    'model_id' => $model_id,
                    'locale' => $lang,
                ],
                [
                    'hash' => $hash,
                ]
            );
        }
    }

    public function submit(): void
    {
        $languages = $this->form->getState();

        $languages[$this->record->locale] = $this->record->id;

        $this->removeAllOldRelations($languages);
        $this->createRelations($languages);

        Notification::make()
            ->title('Saved successfully')
            ->icon('heroicon-o-sparkles')
            ->iconColor('success')
            ->send();

        $this->redirect(url()->previous());
    }

    public function form(Form $form): Form
    {
        return $form->schema([
            Section::make('Map Translations')->schema($this->prepareSelectors())
        ])->statePath('data');

    }
    
}
