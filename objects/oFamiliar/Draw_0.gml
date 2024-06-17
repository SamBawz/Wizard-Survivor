if (flash > 0) {
    flash -=1;
    shader_set(shadEnemyFlash);
    draw_self();
    shader_reset();
}
else {
	draw_self();
}

