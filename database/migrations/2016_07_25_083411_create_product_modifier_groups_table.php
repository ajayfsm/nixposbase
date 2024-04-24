<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductModifierGroupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_modifier_groups', function (Blueprint $table) {
            $table->increments('id');
	    $table->integer('SortOrder');
	    $table->integer('ColumnCount');
	    $table->integer('ButtonHeight');
	    $table->integer('MaxSelectedItems');
	    $table->integer('MinSelectedItems');
	    $table->boolean('AddTagPriceToOrderPrice');
	    $table->boolean('FreeTagging');
	    $table->boolean('SaveFreeTags');
	    $table->string('GroupTag',4000)->nullable();
	    $table->boolean('TaxFree');
	    $table->boolean('Hidden');
	    $table->string('ModifierGroupName',4000)->nullable();

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
        Schema::drop('product_modifier_groups');
    }
}