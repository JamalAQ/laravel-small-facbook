<?php

namespace App\Http\Controllers;
use App\Models\FriendRequest;
use App\Models\Friend;
use App\Models\Post;
use Illuminate\View\View;



use Illuminate\Http\Request;

class Dashboard extends Controller
{
    public function create(): View
    {

        $userId = auth()->id();

        $userName = auth()->user()->name;
        $userEmail = auth()->user()->email;
        $userimage = auth()->user()->profile_picture;

        // FriendRequest coming

        $friendsRequest = FriendRequest::where('receiver_id', $userId)
        ->join('users', 'users.id', '=', 'friend_requests.sender_id')
        ->selectRaw('users.id as user_id , users.name , friend_requests.id as request_id , users.profile_picture , DATE(friend_requests.sent_date) as sent_date_only')
        ->orderBy('friend_requests.sent_date', 'desc') 
        ->get();

        // FriendRequest seending

        // $friendsRequestSeending = FriendRequest::where('sender_id', $userId)->get();
        $friendsRequestSeending = FriendRequest::join('users', 'friend_requests.receiver_id', '=', 'users.id')
        ->where('friend_requests.sender_id', $userId)
        ->selectRaw('friend_requests.*, users.name ,users.profile_picture , DATE(friend_requests.sent_date) as sent_date_only')
        ->get();

        
        // Friends

        $friends = Friend::where(function($query) use ($userId) {
            $query->where('user_id', $userId)
                    ->orWhere('friend_id', $userId);
        })
        ->join('users', function($join) use ($userId) {
            $join->on('users.id', '=', 'friends.user_id')
                    ->orOn('users.id', '=', 'friends.friend_id');
        })
        ->selectRaw('friends.*, users.id as user_id , users.name , users.profile_picture, DATE(friends.friendship_date) as friendship_date_only')
        ->get();

        $friendsList = [];

        foreach ($friends as $friend) {
            if ($friend->user_id != $userId) {
                $friendsList[] = [
                    'friendship_id' => $friend->id,  
                    'friend_id' => $friend->user_id,  
                    'name' => $friend->name,
                    'friendship_date' => $friend->friendship_date_only,
                    'profile_picture' => $friend->profile_picture
                ];
            }
        }

        $friendsNames = array_column($friendsList, 'name');

        $friendsPictures = array_column($friendsList, 'profile_picture');


        // POSTS

        $friendIds = array_column($friendsList, 'friend_id');  

        $friendIds[] = $userId;

        $posts = Post::whereIn('publisher_id', $friendIds)
        ->join('users', 'users.id', '=', 'posts.publisher_id') 
        ->orderBy('created_at', 'desc')
        ->selectRaw('posts.*, users.id as user_id , users.name , users.profile_picture, DATE(posts.created_at) as created_at_date_only')
        ->get();
    

        return view('dashboard', compact('friendsRequest','friendsRequestSeending',
        'friendsNames', 'friendsPictures'// للحذف لاحقا اعتقد 
        , 'posts','friendsList' , 'userEmail' , 'userName' , 'userimage'));

    }
}
