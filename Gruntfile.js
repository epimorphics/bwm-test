module.exports = function(grunt) {
  path = require('path');

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    bower: {
      install: {}
    },
    compress: {
      tests: {
        options: {
          archive: "ch-lda-test.tgz"
        },
        files: [
          {
             expand: true,
             cwd:    'test',
             src:    ['**']
          }
        ]
      }
    },
    shell: {
      upload_tests:{
        command: 'aws s3 cp --profile ch ch-lda-test.tgz s3://ch-dms-deploy/deploy/ch-lda-test.tgz'
      }
    }
  });
  
  grunt.loadNpmTasks('grunt-contrib-compress');
  grunt.loadNpmTasks('grunt-shell');
    
  grunt.registerTask('build-tests', [ 'compress:tests' ] );
  grunt.registerTask('upload-tests', [ 'build-tests', 'shell:upload_tests'] );
 
};