<?php

use Illuminate\Database\Seeder;



//Models
use App\User;
use App\Location;
use App\Role;
use App\Permission;

class UserRoleLocationTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

	DB::table('location_user')->truncate();
	DB::table('role_user')->truncate();


        $user_location_role_array = [
	'fsm.admin' => [
		    'locations' => [
		    		['name' => 'hyderabad-banjara-hills'],
				['name' => 'hyderabad-jubilee-hills','home' => 1]
				],
		    'roles' => ['admin']
		    ],
        'jubilee.accountant' => [
		    'locations' => [
		    		   ['name' => 'hyderabad-jubilee-hills','home' => 1]
				],
		    'roles' => ['accountant']
		     ],
	'banjara.accountant' => [
		    'locations' => [
		    		['name' => 'hyderabad-banjara-hills','home'=>1]
				   ],
		    'roles' => ['accountant']
		     ],
	];
	

	//Iterate through all the users
	foreach($user_location_role_array as $user=>$details){
	  $newuser = User::where('name',$user)->first();

	//Get all locations and attach the locations to the user
	foreach($details['locations'] as $location){
	   $newlocation = Location::where('location_slug',$location['name'])->first();
	   //echo $newlocation->id.PHP_EOL;
	   if(isset($location['home'])){
		$newuser->location()->attach($newlocation->id,['home'=>1]);
	   }
	   else {
		$newuser->location()->attach($newlocation->id);
	   }
	}


	echo "role".PHP_EOL;
	//Assign all roles

	$rolearray = [];
	foreach($details['roles'] as $role){
	 $getrole = Role::where('role_slug',$role)->first();
	 array_push($rolearray,$getrole->id);
	}

	$newuser->role()->sync($rolearray);

	}//End iterating through all users

    }
}
