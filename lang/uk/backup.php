<?php

return [

    'components' => [
        'backup_destination_list' => [
            'table' => [
                'actions' => [
                    'download' => 'Завантажити',
                    'delete' => 'Видалити',
                ],

                'fields' => [
                    'path' => 'Шлях',
                    'disk' => 'Диск',
                    'date' => 'Дата',
                    'size' => 'Розмір',
                ],

                'filters' => [
                    'disk' => 'Диск',
                ],
            ],
        ],

        'backup_destination_status_list' => [
            'table' => [
                'fields' => [
                    'name' => 'Імʼя',
                    'disk' => 'Диск',
                    'healthy' => 'Справний',
                    'amount' => 'Кількість',
                    'newest' => 'Останній',
                    'used_storage' => 'Обʼєм у сховищі',
                ],
            ],
        ],
    ],

    'pages' => [
        'backups' => [
            'actions' => [
                'create_backup' => 'Створити резервну копію',
            ],

            'heading' => 'Резервні копії',

            'messages' => [
                'backup_success' => 'Створення нової резервної копії у фоновому режимі.',
                'backup_delete_success' => 'Видалення цієї резервної копії в фоновому режимі.',
            ],

            'modal' => [
                'buttons' => [
                    'only_db' => 'Тільки база',
                    'only_files' => 'Тільки файли',
                    'db_and_files' => 'База і файли',
                ],

                'label' => 'Будь ласка, виберіть опцію',
            ],

            'navigation' => [
                'group' => 'Налаштування',
                'label' => 'Резервні копії',
            ],
        ],
    ],

];