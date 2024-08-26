<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Schedule extends Model
{
    use SoftDeletes;

    public $table = 'schedules';

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        'title',
        'subtitle',
        'day_number',
        'start_time',
        'speaker_id',
        'created_at',
        'updated_at',
        'deleted_at',
        "event_id",
    ];

    public function speaker()
    {
        return $this->belongsTo(Speaker::class, 'speaker_id');
    }

    public function venue()
    {
        return $this->belongsTo(Venue::class, 'event_id');
    }
}
