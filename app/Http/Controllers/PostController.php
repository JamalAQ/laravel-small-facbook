<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Storage;
use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
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
        // try{

            $validated = $request->validate([
                'title' => 'nullable|string',      
                'content' => 'required|string',       
                'image' => 'nullable|image|mimes:jpg,jpeg,png,gif|max:2048', 
            ]);
            
            $imagePath = null;
            if ($request->hasFile('image')) {
    
                $randomNumber = rand(1, 10000000);
                $timestamp = time();
                $newFileName = $randomNumber . '_' . $timestamp . '.' . $request->File('image')->getClientOriginalExtension();
                
                $imagePath = $request->file('image')->storeAs('posts', $newFileName, 'public');
            }
            
        
            Post::create([
                'publisher_id' => auth()->id(),
                'title' => $validated['title'],
                'content' => $validated['content'],
                'image' => $imagePath,
            ]);
        
            // return response()->json([
            //     'message' => 'Friendship Deleted successfully!',
            //     'status' => 'success',
            //     ],200);
    
            return redirect()->intended(route('dashboard', absolute: false));
        // }

        // catch (\Exception $e) {
        //     return response()->json([
        //         'message' => 'Error: ' . $e->getMessage(),
        //         'status' => 'error',
        //     ], 500);
        // }

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
            'content' => 'required|string',       
            'image' => 'nullable|image|mimes:jpg,jpeg,png,gif|max:2048',
        ]);

        $post = Post::findOrFail($id);

        if ($post->publisher_id !== auth()->id()) {
            return redirect()->intended(route('dashboard', absolute: false))->withErrors('Unauthorized to edit this post.');
        }

        $imagePath = $post->image; 

        if ($request->hasFile('image')) {
            $newImageName = $request->file('image')->getClientOriginalName(); 
            $currentImageName = basename($post->image); 

        
            if ($newImageName !== $currentImageName) {
         
                if ($post->image && Storage::disk('public')->exists($post->image)) {
                    Storage::disk('public')->delete($post->image);
                }

                $randomNumber = rand(1, 10000000);
                $timestamp = time();
                $newFileName = $randomNumber . '_' . $timestamp . '.' . $request->file('image')->getClientOriginalExtension();

                $imagePath = $request->file('image')->storeAs('posts', $newFileName, 'public');
            }
        }

        Post::update([
            'publisher_id' => auth()->id(),
            'title' => $validated['title'],
            'content' => $validated['content'],
            'image' => $imagePath,
        ]);

        return redirect()->intended(route('dashboard', absolute: false));

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $post = Post::findOrFail($id);

        $post->delete();
            return response()->json([
                'message' => 'post Deleted successfully!',
                'status' => 'success',
            ],200);
        // return redirect()->intended(route('dashboard', absolute: false));
    }
}
