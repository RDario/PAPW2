<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNoticiaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('noticia', function (Blueprint $table) {
            $table->increments('idNoticia');
            $table->string('titulo', 100);
            $table->string('descripcion', 300);
            $table->string('texto', 1000);
            $table->string('fecha', 20);
            $table->integer('idSeccion')->unsigned();
            $table->integer('idUsuario')->unsigned();
            $table->boolean('isPublica')->default(false);
            $table->string('seccion', 20);
            $table->string('autor', 40);
            $table->boolean('isEspecial');
            $table->string('cintillo', 20);
            $table->timestamps();
            $table->foreign('idUsuario')->references('idUsuario')->on('usuarios');
            $table->foreign('idSeccion')->references('idSeccion')->on('seccion');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('noticia');
    }
}
