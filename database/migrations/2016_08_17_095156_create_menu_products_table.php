<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMenuProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('menu_products', function (Blueprint $table) {
            $table->increments('id');
	    $table->integer('menu_id');
	    $table->integer('product_id');
	    $table->string('product_name',4000);
	    $table->string('product_category',4000);
	    $table->decimal('product_price',16,2);
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
        Schema::drop('menu_products');
    }
}
