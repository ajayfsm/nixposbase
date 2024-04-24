<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class HelperProvider extends ServiceProvider
{

	// Include the names of helper files here without the PHP extension
	// Use app/Http/Helpers directory to include the files
	// e.g. 'aclhelper' refers to app/Http/Helpers/aclhelper.php
	protected $helpers = ['aclhelper'];


    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
	
        
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        foreach($this->helpers as $helper){
	 $helper_path = app_path()."/Http/Helpers/".$helper.".php";

	 //Check to see if the helper file exists;if it exists include it
	 if(\File::isFile($helper_path)){
		require_once $helper_path;

	 }
	 }//End of ForEach
    }
}
