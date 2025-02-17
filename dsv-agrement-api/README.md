# 🛠️ Installation Steps:

### 1. Clone repository from github

```bash
git clone https://github.com/David-RDH/dsv-agrement-api.git
```

### 2. Install all required dependencies

```bash
composer install
```

### 3. Setup env file
create .env file and add this line in

```
DB_CONNECTION=mysql
DB_HOST=YOUR_DB_HOST
DB_PORT=3306
DB_DATABASE=YOUR_DB_NAME
DB_USERNAME=YOUR_DB_USERNAME
DB_PASSWORD=YOUR_DB_PASSWORD
```
### 4. Migrate database

```bash
php artisan migrate
```
### 5. Init app

```bash
php artisan app:init
```
### 6. Create seeder
! optional

```bash
php artisan db:seed
```
### 7. Run app
! optional if using laragon

```bash
php artisan serve
```