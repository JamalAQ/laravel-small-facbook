<?php

namespace App\Http\Controllers;
use App\Models\FriendRequest;
use App\Models\Friend;
use Illuminate\Http\Request;
use App\Models\User;


class FriendRequestController extends Controller
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
        $validatedData = $request->validate([
            'receiver_id' => 'required|exists:users,id', 
        ]);

        
        $senderId = auth()->id();  

        // may we change it 
        if (!auth()->check()) {
            return response()->json(['error' => 'Unauthenticated'], 401);
        }

        $friendRequest = FriendRequest::create([
            'sender_id' => $senderId,
            'receiver_id' => $validatedData['receiver_id'],
            'status' => 'pending', 
            'sent_date' => now(), 
            'result_date' => null, 
        ]);
        
        $receiver = User::where('id', $validatedData['receiver_id'] )->get();
        $request = FriendRequest::where('sender_id', $senderId )->where('receiver_id',$validatedData['receiver_id'])->selectRaw('friend_requests.*,DATE(friend_requests.sent_date) as sent_date_only')->get();


        return response()->json([
            'message' => 'Friend request sent successfully!',
            'status' => 'success',
            'receiver_info' => $receiver,
            'request_info' => $request,
        ]);
        // return redirect()->intended(route('dashboard', absolute: false));
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
        $validated = $request->validate([
            'action' => 'required|in:accept,reject',
        ]);
    
        $friendRequest = FriendRequest::findOrFail($id);

        if ($friendRequest->receiver_id !== auth()->id()) {
            return response()->json([
                'message' => 'You are not authorized to update this request.',
                'status' => 'refused',
            ]);
        }

        if ($validated['action'] === 'accept') {
            Friend::create([
                'user_id' => $friendRequest->sender_id,
                'friend_id' => $friendRequest->receiver_id,
                'friendship_date' => now(),
            ]);
        }else{

            $friendRequest->delete();
            return response()->json([
            'message' => 'You refused the request',
            'status' => 'success',
        ],299);
        }

        $friendRequest->delete();

        return response()->json([
            'message' => 'You accept the request',
            'status' => 'success',
        ]);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $friendRequest = FriendRequest::findOrFail($id);

        
        if ($friendRequest->sender_id == auth()->id()) {

            $friendRequest->delete();

            return response()->json([
            'message' => 'Friend request Deleted successfully!',
            'status' => 'success',
            ],200);

        }else{
            return response()->json([
                'message' => 'fail in the prosses',
                'status' => 'refused',
                ]);
        }
        
    }

    public function remove(string $id)
    {
        $friendRequest = FriendRequest::findOrFail($id);

        
        if ($friendRequest->receiver_id == auth()->id()) {

            $friendRequest->delete();

            return response()->json([
            'message' => 'You refused the request successfully!',
            'status' => 'success',
            ],200);

        }else{
            return response()->json([
                'message' => 'fail in the prosses',
                'status' => 'refused',
                ],302);
        }
        
    }
}
