<?php

use Illuminate\Database\Seeder;


//Models
use App\User;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->truncate();

	$newuser = new User;
	$newuser->create(['name'=>'fsm.admin','email'=>'admin@fsm.in','password' => bcrypt('omega991')]);
	$newuser->create(['name'=>'jubilee.accountant','email'=>'jubilee@fsm.in','password' => bcrypt('sreeram123')]);
	$newuser->create(['name'=>'banjara.accountant','email'=>'banjara@fsm.in','password' => bcrypt('pranay123')]);
	
	

    }
}
