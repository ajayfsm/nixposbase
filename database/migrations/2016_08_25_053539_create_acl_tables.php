<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAclTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Create all the tables for Access Control Layer
	/**
	 * roles
	 * permissions
	 * permission_role
	 * user_role
	 * location_user
	 */

	 /**
	  * Roles Table
	  */
	 Schema::create('roles',function(Blueprint $table) {
	 	 $table->increments('id');
	 	 $table->string('role_slug',50)->unique();
	 	 $table->string('role_human')->nullable();
	 	 $table->string('role_description')->nullable();
	 	 $table->boolean('active')->default(1);
	 	 $table->timestamps();
	 });


	 /**
	  * Permissions Table
	  */
	  Schema::create('permissions', function (Blueprint $table) {
            $table->increments('id');
	    $table->string('permission_slug')->unique();
	    $table->string('permission_human')->nullable();
	    $table->string('permission_description')->nullable();
	    $table->boolean('active')->default(1);
	    $table->timestamps();
        });


	/**
	 * Permission Role table
	 */
	 Schema::create('permission_role', function (Blueprint $table) {
            $table->increments('id');
	    $table->integer('role_id')->unsigned();
	    $table->integer('permission_id')->unsigned();
	    $table->timestamps();
        });


	/**
	 * User Role table
	 */
	Schema::create('role_user', function (Blueprint $table) {
            $table->increments('id');
	    $table->integer('user_id')->unsigned();
	    $table->integer('role_id')->unsigned();
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
        Schema::drop('roles');
	Schema::drop('permissions');
	Schema::drop('permission_role');
	Schema::drop('role_user');
    }
}
