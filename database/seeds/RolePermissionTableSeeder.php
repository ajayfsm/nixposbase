<?php

use Illuminate\Database\Seeder;


//Models
use App\Role;
use App\Permission;


class RolePermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('permission_role')->truncate();

	$permroles = ['accountant' => ['index-bill','create-bill','store-bill','getnextbillid-bill','list-bill','print-bill','productcategory-share','product-share','menudata-share','change-location']];


	foreach($permroles as $role=>$perms){
	   $getrole = Role::where('role_slug',$role)->first();

	   //Get the IDs of all permissions in an array
	   $permarray = [];
	   
	   foreach($perms as $perm){
	     $permid = Permission::where('permission_slug',$perm)->first();
	     array_push($permarray,$permid->id);
	   }
	  
	   $getrole->permission()->sync($permarray);
    }
 }
}
