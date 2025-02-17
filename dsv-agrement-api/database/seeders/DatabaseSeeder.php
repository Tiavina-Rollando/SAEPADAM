<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Agrement;
use App\Models\DemandeAgrement;
use App\Models\Etablissement;
use App\Models\Filiere;
use App\Models\StatusDemandeAgrement;
use App\Models\TypeActivite;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        \App\Models\User::factory(20)->create();

        foreach (User::all() as $user) {
            // $token = $user->createToken("angular-front",['*'], now()->addDay(1))->plainTextToken;
            // dd($token);
            $role = fake()->numberBetween(1,4);
            $user->syncRoles($role);

            if ($role == 4) {
                $user->UserInformation()->create([
                    "tel" => fake()->unique()->phoneNumber(),
                    "address" => fake()->address
                ]);
            } else {
                    $user->UserInformation()->create([
                        "tel" => fake()->unique()->phoneNumber(),
                        "address" => fake()->address,
                        "matricule" => fake()->unique()->numberBetween(111111,999999)
                    ]);
            }

            if ($role == 4) {
                $nombre_etablissement = fake()->randomDigitNotNull();

                for ($i=1; $i <= $nombre_etablissement ; $i++) {

                    $filiere = fake()->randomElement(Filiere::all());
                    $type_activite = fake()->randomElement(TypeActivite::all());

                    $etablissement = Etablissement::create([
                        "name" => fake()->company(),
                        "filiere_id" => $filiere->id,
                        "type_activite_id" => $type_activite->id,
                        "type_etablissement" => fake()->randomElement(['petit','moyen', 'grand']),
                        "adresse" => fake()->address,
                        "type_produit" => fake()->bothify('Produit #?#?')
                    ]);

                    $type_agrement = fake()->randomElement([1,2]);
                    $status_demande_agrement = fake()->randomElement(StatusDemandeAgrement::all());
                    $status_agrement = fake()->boolean();

                    $demande_agrement = $etablissement->DemandeAgrement()->create([
                        "type_agrement_id" => $type_agrement,
                        "status" => $status_demande_agrement->id
                    ]);

                    if ($status_demande_agrement->id == 3) {
                        $agrement = Agrement::create([
                            "numero" => fake()->numerify("AG #####"),
                            "status" => $status_agrement,
                            "type_agrement_id" => $type_agrement,
                            "date_debut" => fake()->date(),
                            "date_fin" => $type_agrement == 1 ? fake()->date() : null
                        ]);

                        $demande_agrement->Agrement()->attach($agrement->id);
                        $etablissement->Agrement()->attach($agrement->id);
                    }

                    $user->Etablissement()->attach($etablissement->id);
                }
            }

        }
    }
}
