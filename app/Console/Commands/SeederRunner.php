<?php

namespace App\Console\Commands;

use Artisan;
use Illuminate\Console\Command;

class SeederRunner extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cms:seeder-run';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command will help run seeders for testing';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    public function seeders(): array
    {
        return [
            'AdmRoleSeeder'
        ];
    }

    /**
     * Execute the console command.
     *
     */
    public function handle()
    {
        foreach ($this->seeders() as $className) {
            Artisan::call('db:seed --class='.$className);
            $this->info("✓ -- $className done");
        }

        $this->additionalProcess();

        $this->info("-- -- -- -- -- -- -- -- --");

        $this->call('optimize:clear');

        $this->info("-- -- -- -- -- -- -- -- --");

        $this->info("✓ -- DONE --");
    }

    public function additionalProcess()
    {
        Artisan::call('migrate');
    }
}
