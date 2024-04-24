<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBillsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bills', function (Blueprint $table) {
	    $table->increments('id');
	    $table->string('bill_number')->nullable();
	    $table->date('bill_date')->nullable();
	    $table->string('bill_location')->nullable();
	    $table->dateTime('bill_start_time')->nullable();
	    $table->dateTime('bill_end_time')->nullable();
	    $table->integer('user_id')->nullable();
	    $table->decimal('bill_amount',8,2)->nullable();
	    $table->softDeletes();
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
        Schema::drop('bills');
    }
}
