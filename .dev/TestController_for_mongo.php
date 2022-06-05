<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestController extends Controller
{
    public function mongotest()
    {
        $mongo = new \MongoDB\Client('mongodb://larastack_mongo_user:larastack_mongo_pass@mongo:27017/');

        $mongoDB	= $mongo->selectDatabase('larastack');

        $data = ['foo'=>'bar'];

        $insertResult = $mongoDB->selectCollection('user')->insertOne($data);
        $response = [
            'mongoInsertedId' => $insertResult->getInsertedId()->__toString()
        ];

        dd($response);

    }
}
