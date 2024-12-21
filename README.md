# Backend - Laravel

Questo progetto utilizza Lravel come framework per lo sviluppo web. È configurato per funzionare con o senza Docker.

---

### Requisiti

#### Per chi utilizza Docker
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/)

#### Per chi NON utilizza Docker
- [PHP 8.0+](https://www.php.net/)
- [Composer](https://getcomposer.org/)
- [MySQL](https://www.mysql.com/)
- [Node.js e npm](https://nodejs.org/)

---

## Configurazione del progetto

### 1. Clona il repository

Esegui il comando seguente per clonare il repository e accedere alla cartella del progetto:

git clone https://github.com/salvatore-impellizzeri/test-NewTime-Back.git

## Istruzioni per chi usa Docker
### 2. Avvia i container Docker
Per costruire e avviare i container, esegui:

docker-compose up --build
Questo comando creerà i container per:

- Laravel (app)
- MySQL (db)
- Nginx (web server)

### 3. Accedi al container Laravel
- Una volta avviati i container, accedi al container Laravel per configurare il progetto:

docker exec -it laravel-app bash

### 4. Installa le dipendenze Laravel
- Esegui i comandi seguenti all'interno del container:

composer install
cp .env.example .env
php artisan key:generate

### 5. Configura il database
Modifica il file .env per utilizzare i container Docker:

DB_CONNECTION=mysql
DB_HOST=mysql-db
DB_PORT=3306
DB_DATABASE=db_test
DB_USERNAME=root
DB_PASSWORD=root

Poi esegui le migrazioni e i seeder:

php artisan migrate:fresh --seed

### 6. Accedi all'applicazione
L'app sarà disponibile su http://localhost:8000.

---

## Istruzioni per chi NON usa Docker
## 2. Configura l'ambiente
Assicurati di avere installato:

- PHP
- Composer
- MySQL
- Node.js e npm

### 3. Installa le dipendenze
- Installa le dipendenze PHP e JavaScript del progetto:

composer install
npm install

### 4. Configura il database
- Modifica il file .env con le credenziali del tuo database:

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=<il-tuo-database>
DB_USERNAME=<il-tuo-username>
DB_PASSWORD=<la-tua-password>

Poi esegui le migrazioni e i seeder

php artisan migrate:fresh --seed

### 5. Avvia il server
- Avvia il server di sviluppo con il comando:

php artisan serve

L'applicazione sarà disponibile su http://localhost:8000.
