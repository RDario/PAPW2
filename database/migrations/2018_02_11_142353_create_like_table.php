<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLikeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('like', function (Blueprint $table) {
            $table->increments('idLike');
            $table->integer('idUsuario')->unsigned();
            $table->integer('idNoticia')->unsigned();
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
        Schema::dropIfExists('like');
    }
}
