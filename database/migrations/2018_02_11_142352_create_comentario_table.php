<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComentarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comentario', function (Blueprint $table) {
            $table->increments('idComentario');
            $table->string('texto', 300);
            $table->string('fecha', 20);
            $table->string('nombreUsuario', 100);
            $table->string('correoUsuario', 50);
            $table->integer('idUsuario')->unsigned();
            $table->integer('idNoticia')->unsigned();
            $table->integer('idComentarioPapa');
            $table->timestamps();
            $table->foreign('idUsuario')->references('idUsuario')->on('usuarios');
            $table->foreign('idNoticia')->references('idNoticia')->on('noticia');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('comentario');
    }
}
