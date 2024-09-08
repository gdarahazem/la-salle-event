<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{

    protected $fillable = [
        'event_id',
        'user_name',
        'user_email',
        'user_phone',
    ];

    public function venue()
    {
        return $this->belongsTo(Venue::class, 'event_id');
    }


}
