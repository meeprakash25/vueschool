<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsToFrontendBlocksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('frontend_blocks', function (Blueprint $table) {
            $table->string('block_type')->nullable()->default('program')->after('frontend_menu_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('frontend_blocks', function (Blueprint $table) {
            $table->dropColumn(['block_type']);
        });
    }
}
