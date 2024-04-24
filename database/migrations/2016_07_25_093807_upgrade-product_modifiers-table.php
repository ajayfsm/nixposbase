<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpgradeProductModifiersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('product_modifiers', function (Blueprint $table) {
            $table->integer('SortOrder');
	    $table->integer('ProductModifierGroupId');
	    $table->integer('MaxQuantity');
	    $table->SoftDeletes();
	    
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('product_modifiers', function (Blueprint $table) {
            $table->dropColumn(['SortOrder','ProductModifierGroupId','MaxQuantity','deleted_at']);
        });
    }
}
