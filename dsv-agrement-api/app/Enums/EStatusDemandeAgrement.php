<?php

namespace App\Enums;

enum EStatusDemandeAgrement :string
{
    case A_01 = "Nouveau";
    case A_02 = "Mise en examin";
    case A_03 = "Accepté";
    case A_04 = "Refusé";
}