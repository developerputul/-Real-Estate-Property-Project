<?php

namespace App\Providers;

use App\Models\SmtpSetting;
use Illuminate\Support\ServiceProvider;
use Config;
use Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (\Schema::hasTable('smtp_settings')){

            $smtpsetting = SmtpSetting::first();
            if ($smtpsetting){
                $data = [

                    'driver'    => $smtpsetting->mailer,
                    'host'      => $smtpsetting->host,
                    'port'      => $smtpsetting->port,
                    'username'  => $smtpsetting->username,
                    'password'  => $smtpsetting->password,
                    'encryption'  => $smtpsetting->encryption,
                    'from' => [
                        'address' => $smtpsetting->from_address,
                        'name'  => 'EasyLearning'
                    ]
                ];
                Config::set('mail',$data);

            }


        }// End if
    }
}
