<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLocationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        
	/**
	 * Location related tables
	 *
	 * locations
	 * location_user
	 */

	 /**
	  * Locations table
	  */

	 Schema::create('locations',function(Blueprint $table){
	 $table->increments('id');
	 $table->string('location_slug')->unique();
	 $table->string('location_area');
	 $table->string('location_city');
	 $table->boolean('active')->default(1);
	 $table->timestamps();
	 });

	 /**
	  * User_Location relationship table
	  */

	 Schema::create('location_user', function (Blueprint $table) {
            $table->increments('id');
	    $table->integer('user_id')->unsigned();
	    $table->integer('location_id')->unsigned();
	    $table->boolean('home')->default(0);
	    $table->timestamps();
        });

	


    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('locations');
	Schema::drop('location_user');
    }
}
