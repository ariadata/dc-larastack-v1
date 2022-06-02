<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')->hourly();
    }
	
	/**
     * Define the application's command Short schedules.
     * https://github.com/spatie/laravel-short-schedule
     *
     * @param  \Spatie\ShortSchedule\ShortSchedule $shortSchedule
     * @return void
     */
	protected function shortSchedule(\Spatie\ShortSchedule\ShortSchedule $shortSchedule)
    {
		// $shortSchedule->command('short-command')->everySeconds(2);
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
