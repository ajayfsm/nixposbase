<?php

use Illuminate\Database\Seeder;


//Models
use App\Role;

class RoleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    DB::table('roles')->truncate();

    $data = [
	['role_slug' => 'admin', 'role_human' => 'Administrator', 'role_description' => 'Administrator'],
	['role_slug' => 'accountant', 'role_human' => 'Accountant', 'role_description' => 'Can create and view bills']
	];

    foreach($data as $role){
    	$newrole = new Role;
	$newrole->create($role);
    }

    }
}