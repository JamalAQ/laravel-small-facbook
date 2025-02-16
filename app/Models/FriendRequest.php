<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class FriendRequest extends Model
{
    use HasFactory;


    protected $table = 'friend_requests';


    protected $fillable = [
        'sender_id',
        'receiver_id',
        'status',
        'sent_date',
        'result_date',
    ];

    public $timestamps = false;
    
    public function sender()
    {
        return $this->belongsTo(User::class, 'sender_id');
    }

    public function receiver()
    {
        return $this->belongsTo(User::class, 'receiver_id');
    }
}
