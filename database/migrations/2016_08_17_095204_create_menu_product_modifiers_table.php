<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMenuProductModifiersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('menu_product_modifiers', function (Blueprint $table) {
            $table->increments('id');
	    $table->integer('menu_id');
	    $table->integer('ProductModifierGroupId');
	    $table->string('ModifierGroupName',4000);
	    $table->integer('product_modifier_id');
	    $table->string('product_modifier_name',4000);
	    $table->decimal('product_modifier_price',16,2);
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
        Schema::drop('menu_product_modifiers');
    }
}
