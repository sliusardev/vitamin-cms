<?php

namespace App\Console\Commands;

use App\Models\User;
use Illuminate\Console\Command;

class CmsStart extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cms:start';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->call('optimize:clear');
        $this->call('key:generate');
        $this->call('migrate');
        $this->call('migrate:refresh');
        $this->info("-- migrations done");
        $this->call('optimize:clear');

        $user = User::query()->where('email', 'admin@admin.com')->first();

        if(!$user) {
            $this->call('cache:clear');
            $this->call('db:seed');
            $this->info("-- data added to db");
        }

        $this->call('storage:link');
        $this->call('optimize:clear');
    }
}
