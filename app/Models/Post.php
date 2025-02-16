<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Post extends Model
{
    use HasFactory;

    protected $fillable = [
        'publisher_id', 
        'title', 
        'content', 
        'image', 
        'published_at', 
        'updated_at'
    ];

    public function publisher()
    {
        return $this->belongsTo(User::class, 'publisher_id');
    }
}
