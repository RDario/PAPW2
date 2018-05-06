<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsuariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->increments('idUsuario');
            $table->string('nombre', 70);
            $table->string('apellidos', 100);
            $table->string('email')->unique();
            $table->string('password', 30);
            $table->string('telefono', 30);
            $table->string('fechaNacimiento', 30);
            $table->enum('tipoUsuario', ['Administradror', 'Reportero', 'Normal'])->default('Normal');
            $table->string('imgAvatar', 50);
            $table->string('imgPortada', 50);
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usuarios');
    }
}
