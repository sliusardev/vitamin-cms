<?php

namespace App\Enums;

enum RoleEnum: string
{
    case USER = 'user';
    case ADMIN = 'admin';
    case WRITER = 'writer';
    case MODERATOR = 'moderator';

    case COMPANY_ADMIN = 'company_admin';
    case DOCTOR = 'doctor';
    case PATIENT = 'patient';

    /**
     * @return array
     */
    public static function allValues(): array
    {
        return [
            self::USER->value,
            self::ADMIN->value,
            self::WRITER->value,
            self::MODERATOR->value,
            self::COMPANY_ADMIN->value,
            self::DOCTOR->value,
            self::PATIENT->value,
        ];
    }

    /**
     * @return array
     */
    public static function companyRoles(): array
    {
        return [
            self::COMPANY_ADMIN->value,
            self::DOCTOR->value,
            self::PATIENT->value,
        ];
    }

    /**
     * @return array
     */
    public static function dashboardAllowedRoles(): array
    {
        return [
            self::ADMIN->value,
            self::WRITER->value,
            self::MODERATOR->value,
        ];
    }

    /**
     * @return array
     */
    public static function usersPermissions(): array
    {
        return [
            self::ADMIN->value,
            self::MODERATOR->value,
        ];
    }
}
