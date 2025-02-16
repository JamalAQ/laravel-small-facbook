<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Friend extends Model
{
    use HasFactory;

    public $timestamps = false;// cancel created_at و updated_at

    protected $fillable = [
        'user_id',
        'friend_id',
        'friendship_date',
    ];

    /**
     * Define the relationship with the user who sent the friend request.
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     * Define the relationship with the friend user.
     */
    public function friend()
    {
        return $this->belongsTo(User::class, 'friend_id');
    }
}
