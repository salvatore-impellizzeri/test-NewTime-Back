<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

// Model
use App\Models\User;

// Faker (per generare una lista di utenti)
use Faker\Factory as Faker;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        foreach (range(1, 24) as $index) {
            $firstName = $faker->firstName;
            $lastName = $faker->lastName;

            // Realizzo una serie di email che siano coerenti al nome e cognome dell'utente
            $email = strtolower($firstName . '.' . $lastName . '@example.com');

            User::create([
                'name' => $firstName,
                'surname' => $lastName,
                'email' => $email,
            ]);
        }
    }
}
