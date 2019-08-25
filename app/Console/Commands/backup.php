<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Chumper\Zipper\Zipper;
use Carbon\Carbon;
use Google\Client\Google_Client;
use Spatie\DbDumper\Databases\MySql;
use Spatie\DbDumper\Databases\PostgreSql;
use File;

class backup extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'backup {--create} {--sql} {--all} {--drive} {--to=} {--clear=}';

    //meta data
    protected $client_id = '930804014884-daoq98u0gfpgj9u9hj1toadquq9360c7.apps.googleusercontent.com';
    protected $client_secret = 'ckSnGO9XemNBflz0IbBer6yg';

    //define filename
    protected function file_name() {

        return  base_path('backups/Backup-'.strtolower(str_replace(' ', '-', env('APP_NAME', 'laravel'))).'-'.str_replace(':', '-', str_replace(' ', '-', Carbon::now())).'.zip');
    }
    // define sql db backup
    protected function file_db() {

        return  base_path('backups/sql/Backup-'.strtolower(str_replace(' ', '-', env('APP_NAME', 'laravel'))).'-'.str_replace(':', '-', str_replace(' ', '-', Carbon::now())).'.sql');
    }

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This handle for backup';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
    * This handle for clearing backups
    **/
    public function clear($option) {

        if($option == 'all') {
            $this->info('Deleting all backup...');
            $files = scandir(base_path('backups'));
            foreach ($files as $file) {
                if($file !== '.' && $file !== '..') {
                    try {
                        unlink(base_path('backups/'.$file));

                    } catch(Exception $e) {

                        $this->err($e);
                    }
                }
            }
        } else {
            $this->info('Deleting all '.$option);
            try {
                unlink(base_path('backups/'.$option));
            } catch(Exception $e) {
                $this->err($e);
            }
        }
        $this->info('Deleted success');
    }

    /**
    * This handle for creating zip backup
    *
    */
    public function backup() {

        $files  = scandir(base_path());
        $zipper =  new Zipper();

        $filtered_file =  array_filter($files, function($file) {
            if($file !== 'backups' && $file !== '.git' && $file !== 'backup' && $file !== 'vendor' &&  $file !== '.' && $file !== '..') {
               return true;
            } else {
                return false;
            }
        });

        $progress = $this->output->createProgressBar(count($filtered_file));

        $this->info('Creating zip '.$this->file_name());
        //$this->info(var_dump($files));
        //define zippper
        $zip  =  $zipper->make($this->file_name());
        //eaching file to zip
        foreach ($filtered_file as $file) {
            $progress->advance();

            if(filetype(base_path($file)) == 'file') {
                $this->info('Adding file '.$file);
                $zip->add($file);

            } elseif(filetype(base_path($file)) == 'dir') {
                $this->info('Adding directory '.$file);
                $zip->folder($file)->add($file);
            }
        }
        //$zip->folder('config')->add('config');
        $zip->close();
        $progress->finish();
        $this->info('');
        //$this->info($name);
        $this->info('Creating zip success');
    }

    // dumping database

    public function dump() {
        if(!File::isDirectory(base_path('backups/sql'))) {
            $this->info('Creating sql backup directory');
            try {
               File::makeDirectory(base_path('backups/sql'));
            } catch(Exception $e) {
                $this->err($e);
            }
        }


        if(env('DB_CONNECTION') == 'mysql') {
            $this->info('Dumping mysql database');
            try {
                $dump = Mysql::create()
                ->setHost(env('DB_HOST'))
                ->setPort(env('DB_PORT'))
                ->setDbName(env('DB_DATABASE'))
                ->setUserName(env('DB_USERNAME'))
                ->setPassword(env('DB_PASSWORD'))
                ->dumpToFile($this->file_db());
                $this->info('Dumping success');

            } catch(Exception $e) {

                $this->err($e);
            }

         } elseif(env('DB_CONNECTION') == 'PostgreSQL') {

            try {
                $dump = PostgreSq::create()
                ->setHost(env('DB_HOST'))
                ->setPort(env('DB_PORT'))
                ->setDbName(env('DB_DATABASE'))
                ->setUserName(env('DB_USERNAME'))
                ->setPassword(env('DB_PASSWORD'))
                ->dumpToFile($this->file_db());
                $this->info('Dumping success');

            } catch(Exception $e) {

                $this->err($e);
            }
         }

    }

    /**
    * Storing file to gogle drive
    **/

    public function storeDrive() {
        $file =  base_path('backups/Backup-laravel-2019-08-25-143110.zip');
        $this->info($file);
    }



    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //preparing
         if(!File::isDirectory(base_path('backups'))) {
            try {
               File::makeDirectory(base_path('backups'));
            } catch(Exception $e) {
                $this->err($e);
            }
        }
        //rund condition
        if($this->option('clear')) {

            $this->clear($this->option('clear'));
        }
        // creating call
        if($this->option('create') || $this->option('all')) {
            $this->backup();
        }
        if($this->option('drive')) {
            //$this->storeDrive();
        }
        if($this->option('sql') || $this->option('all')) {
            $this->dump();
        }
        return false;
    }
}
