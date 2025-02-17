<?php

namespace App\Enums;

enum ERoles :string
{
    case SUPERADMIN = "Super Administrateur";
    case ADMIN = "Administrateur";
    case OV = "Veterinaire Officiel";
    case CLIENT = "Client";
}