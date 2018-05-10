<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSessionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('session', function (Blueprint $table) {
            $table->increments('idUsuario');
            $table->string('nombre', 70);
            $table->string('apellidos', 100);
            $table->string('email')->unique();
            $table->string('fechaNacimiento', 30);
            $table->string('tipoUsuario', 30);
            $table->string('imgAvatar', 50);
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
        Schema::dropIfExists('session');
    }
}
