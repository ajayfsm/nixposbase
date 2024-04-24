<?php

use Illuminate\Database\Seeder;

//Models
use App\Location;



class LocationTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('locations')->truncate();

	$locations = [
	['location_slug' => 'hyderabad-jubilee-hills','location_area'=>'jubilee hills','location_city'=>'hyderabad'],
	['location_slug' => 'hyderabad-banjara-hills','location_area'=>'banjara hills','location_city'=>'hyderabad']
	];

	foreach($locations as $location){
	 $newloc = new Location;
	 $newloc->create($location);
	}


    }
}
