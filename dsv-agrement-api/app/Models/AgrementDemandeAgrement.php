<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AgrementDemandeAgrement extends Model
{
    use HasFactory;

    protected $table = 'agrement_demande';

    protected $fillable = ['agrement_id', 'demande_agrement_id'];

    public $timestamps = false;
}
