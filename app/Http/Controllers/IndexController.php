<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

class IndexController extends Controller
{
    public function index(){
    	   return view('index.index');
    }

    public function test(){
    	   return view('index.test');
    }
}
