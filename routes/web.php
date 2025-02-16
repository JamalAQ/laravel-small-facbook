<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Dashboard;
use App\Http\Controllers\FriendRequestController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\FriendController;
use App\Http\Controllers\SearchUsersController;

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
})->name("welcome");
// POSTS 

Route::post('/post', [PostController::class, 'store'])->name('post.store');

Route::put('/post/{post}', [PostController::class, 'update'])->name('post.update');

Route::delete('/post/{post}', [PostController::class, 'destroy'])->name('post.destroy');

// FriendRequest 

Route::post('api/friend-requests', [FriendRequestController::class, 'store'])->name('friend-requests.store');

Route::put('friend-requests/{id}', [FriendRequestController::class, 'update'])->name('friend-requests.update');

Route::delete('friend-requests/{id}', [FriendRequestController::class, 'destroy'])->name('friend-requests.destroy');

Route::delete('friend-requests/remove/{id}', [FriendRequestController::class, 'remove'])->name('friend-requests.remove');


// Friend 


Route::delete('friendships/{id}', [FriendController::class, 'destroy'])->name('friendships.destroy');

// Search Users

Route::get('/api/search-users', [SearchUsersController::class, 'index'])->name('users.search');



// Route::post('/register', [RegisteredUserController::class, 'store'])->name('register.store'); اعتقد انه خاطئ لانه يجب ان يكون في AUTH 




Route::get('/dashboard', [Dashboard::class, 'create'])->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
