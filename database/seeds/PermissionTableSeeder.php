<?php

use Illuminate\Database\Seeder;

//Model
use App\Permission;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('permissions')->truncate();

	$newpermarray = [

		      /** Product **/
		      ['permission_slug' => 'index-product','permission_human' => 'index@product'],
		      ['permission_slug' => 'store-product','permission_human' => 'store@product'],
		      ['permission_slug' => 'edit-product','permission_human' => 'edit@product'],
		      ['permission_slug' => 'update-product','permission_human' => 'update@product'],
		      ['permission_slug' => 'delete-product','permission_human' => 'delete@product'],
		      ['permission_slug' => 'destroy-product','permission_human' => 'destroy@product'],

		      /** Product Modifier **/
['permission_slug' => 'index-productmodifier','permission_human' => 'index@productmodifier'],
['permission_slug' => 'store-productmodifier','permission_human' => 'store@productmodifier'],
['permission_slug' => 'edit-productmodifier','permission_human' => 'edit@productmodifier'],
['permission_slug' => 'update-productmodifier','permission_human' => 'update@productmodifier'],
['permission_slug' => 'delete-productmodifier','permission_human' => 'delete@productmodifier'],
['permission_slug' => 'destroy-productmodifier','permission_human' => 'destroy@productmodifier'],

		      /** Product Modifier Group **/
['permission_slug' => 'index-productmodifiergroup','permission_human' => 'index@productmodifiergroup'],
['permission_slug' => 'store-productmodifiergroup','permission_human' => 'store@productmodifiergroup'],
['permission_slug' => 'edit-productmodifiergroup','permission_human' => 'edit@productmodifiergroup'],
['permission_slug' => 'update-productmodifiergroup','permission_human' => 'update@productmodifiergroup'],
['permission_slug' => 'delete-productmodifiergroup','permission_human' => 'delete@productmodifiergroup'],
['permission_slug' => 'destroy-productmodifiergroup','permission_human' => 'destroy@productmodifiergroup'],



		      /** Location **/
		      ['permission_slug' => 'index-location','permission_human' => 'index@location'],
		      ['permission_slug' => 'create-location','permission_human' => 'create@location'],
		      ['permission_slug' => 'store-location','permission_human' => 'store@location'],
		      ['permission_slug' => 'edit-location','permission_human' => 'edit@location'],
		      ['permission_slug' => 'update-location','permission_human' => 'update@location'],
		      ['permission_slug' => 'delete-location','permission_human' => 'delete@location'],
		     ['permission_slug' => 'destroy-location','permission_human' => 'destroy@location'],
		     ['permission_slug' => 'change-location','permission_human' => 'change@location'],

		      /** Bill **/
		      ['permission_slug' => 'index-bill','permission_human' => 'index@bill'],
		      ['permission_slug' => 'create-bill','permission_human' => 'create@bill'],
		      ['permission_slug' => 'store-bill','permission_human' => 'store@bill'],
		      ['permission_slug' => 'getnextbillid-bill','permission_human' => 'getnextid@bill'],
		      ['permission_slug' => 'list-bill','permission_human' => 'list@bill'],
		      ['permission_slug' => 'print-bill','permission_human' => 'print@bill'],
		     

		     /**Share Controller**/
		      ['permission_slug' => 'productcategory-share','permission_human' => 'productcategory@Share'],
		      ['permission_slug' => 'product-share','permission_human' => 'product@share'],
		      ['permission_slug' => 'menudata-share','permission_human' => 'menudata@share'],

		      /** Menu **/
		      ['permission_slug' => 'index-menu','permission_human' => 'index@menu'],
		      ['permission_slug' => 'create-menu','permission_human' => 'create@menu'],
		      ['permission_slug' => 'store-menu','permission_human' => 'store@menu'],
		      ['permission_slug' => 'edit-menu','permission_human' => 'edit@menu'],
		      ['permission_slug' => 'update-menu','permission_human' => 'update@menu'],
		      ['permission_slug' => 'delete-menu','permission_human' => 'delete@menu'],
		      ['permission_slug' => 'destroy-menu','permission_human' => 'destroy@menu'],
		      ['permission_slug' => 'activate-menu','permission_human' => 'activate@menu'],
		     
];

	foreach($newpermarray as $perm){
	  $new = new Permission;
	  $new->create($perm);
	}


    }
}
