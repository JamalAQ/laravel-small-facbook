<?php

namespace App\Http\Controllers;
use App\Models\Friend;
use Illuminate\Http\Request;

class FriendController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */

    public function destroy(string $id)
    {
        $friendship = Friend::findOrFail($id);

        if ($friendship->user_id !== auth()->id() && $friendship->friend_id !== auth()->id()) {
            return response()->json([
                'message' => 'fail in the prosses',
                'status' => 'refused',
                ],302);
        }else{

            $friendship->delete();

            return response()->json([
                'message' => 'Friendship Deleted successfully!',
                'status' => 'success',
                ],200);

        }
    
    }
}
