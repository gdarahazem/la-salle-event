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
}
