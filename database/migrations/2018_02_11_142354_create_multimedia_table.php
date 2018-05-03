<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMultimediaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('multimedia', function (Blueprint $table) {
            $table->increments('idMultimedia');
            $table->integer('idNoticia')->unsigned();
            $table->string('urlMedia', 100);
            $table->enum('tipoMedia', ['VIDEO', 'IMG']);
            $table->timestamps();
            $table->foreign('idNoticia')->references('idNoticia')->on('noticia')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('multimedia');
    }
}
