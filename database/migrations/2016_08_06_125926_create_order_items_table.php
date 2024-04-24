<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrderItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_items', function (Blueprint $table) {
            $table->increments('id');
	    $table->integer('bill_id');

	    $table->integer('product_id')->nullable();
	    $table->string('product_name');
	    $table->string('product_code')->nullable();
	    $table->decimal('order_item_quantity',16,2)->default(1.00)->nullable();
	    $table->decimal('order_item_price',16,2);
	    
	    $table->boolean('order_item_price_change')->default(0);
	    $table->text('order_item_price_change_note')->nullable();
	    $table->text('order_item_modifiers')->nullable();

	    $table->softDeletes();
	    $table->timestamps();

	    //To be implemented later
	    $table->integer('ticket_id')->nullable();
	    $table->integer('warehouse_id')->nullable();
	    $table->integer('department_id')->nullable();

	    $table->string('portion_name',4000)->nullable();
	    $table->integer('portion_id')->nullable();
	    $table->integer('portion_count')->nullable();

	    $table->boolean('locked')->nullable();
	    $table->boolean('calculate_price')->nullable();
	    $table->boolean('increase_inventory')->nullable();
	    $table->boolean('decrease_inventory')->nullable();

	    $table->integer('order_number')->nullable();

	    $table->string('creating_user_name',4000)->nullable();
	    $table->integer('creating_user_id')->nullable();

	    $table->integer('account_transaction_type_id')->nullable();
	    $table->integer('product_timer_id')->nullable();
	    $table->string('price_tag',4000)->nullable();
	    $table->string('tag',4000)->nullable();
	    $table->text('taxes',4000)->nullable();
	    //End of to be implemented later
	    
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('order_items');
    }
}
