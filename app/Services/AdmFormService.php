<?php

namespace App\Services;

use App\Enums\AdmMailStatusEnum;
use App\Mail\AdmFormEmail;
use App\Models\AdmForm;
use App\Models\AdmFormItem;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class AdmFormService
{
    public static function sendEmailForItem($item): void
    {
        $email = env('MAIL_FROM_ADDRESS');
        $status = AdmMailStatusEnum::ERROR_SENT->value;

        try {
            $mailData = [
                'form' => $item->admForm->toArray(),
                'payload' => $item->payload,
            ];

            Mail::to($email)->send(new AdmFormEmail($mailData));

            $status = AdmMailStatusEnum::SENT->value;
        }catch (\Exception $e) {
            Log::error($e->getMessage());
        } finally {
            self::updateItemStatus($item->id, $status);
        }
    }

    public static function updateItemStatus(int $itemId, string $status): bool
    {
        return AdmFormItem::query()->where('id', $itemId)->update([
            'status' => $status
        ]);
    }

    public static function byHash(string $hash)
    {
        return AdmForm::query()
            ->where('link_hash', $hash)
            ->with('admFormItems')
            ->first();
    }

    public static function bySlug(string $slug)
    {
        return AdmForm::query()
            ->where('slug', $slug)
            ->with('admFormItems')
            ->first();
    }

    public static function checkRecaptcha3($gRecaptchaResponse, $ip)
    {
        $checkRecaptchaResponse = Http::asForm()
            ->post('https://www.google.com/recaptcha/api/siteverify', [
                'secret' => env('RECAPTCHA_SECRET_KEY'),
                'response' => $gRecaptchaResponse,
                'remoteip' => $ip,
            ]);

        $result = $checkRecaptchaResponse->json();

        return $result['success'];
    }

    public static function actionBySlug(string $slug): string
    {
        $form = self::bySlug($slug);
        return route('adm-form', $form->link_hash ?? '');
    }
}
