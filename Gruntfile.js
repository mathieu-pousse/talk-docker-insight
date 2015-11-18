module.exports = function(grunt) {

    grunt.loadTasks('node_modules/zenika-formation-framework');

    grunt.registerTask('default', ['displaySlides']);

    grunt.registerTask('package', ['sed', 'clean:dist', 'copy:dist', 'filerev-all']);

};
