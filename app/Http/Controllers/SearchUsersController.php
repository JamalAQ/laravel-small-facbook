<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\FriendRequest;
use App\Models\Friend;



use Illuminate\Http\Request;

class SearchUsersController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        
        $searchTerm = $request->input('search');
        $userId = auth()->id();  


        $users = User::where('name', 'like', '%' . $searchTerm . '%')->get();
        $FriendRequests = FriendRequest::where('sender_id', auth()->id())->pluck('receiver_id');

        // Friends

        $friendsList_idsAnduser_id = Friend::where(function($query) use ($userId) {
            $query->where('user_id', $userId)
                    ->orWhere('friend_id', $userId);
        })
        ->join('users', function($join) use ($userId) {
            $join->on('users.id', '=', 'friends.user_id')
                    ->orOn('users.id', '=', 'friends.friend_id');
        })
        ->selectRaw('users.id as user_id')
        ->get();

        $friendsList_idsAndUser_idArray = [];

        foreach ($friendsList_idsAnduser_id as $Id) {
            $friendsList_idsAndUser_idArray[] = $Id->user_id;
        }
        $friendsList_idsAndUser_idArray[] = $userId ;
        
        return response()->json([
                'users' => $users,
                'friend_requests' => $FriendRequests,
                'friends' => $friendsList_idsAndUser_idArray,
            ]);
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
        //
    }
}
