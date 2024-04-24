<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductModifierGroupMapsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_modifier_group_maps', function (Blueprint $table) {

	    $table->increments('id');
	    $table->integer('product_modifier_group_id');
	    $table->string('products',4000);
	    $table->string('product_category',4000);
	    //Implement other columns if need be - menu, location, Department etc
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
        Schema::drop('product_modifier_group_maps');
    }
}
