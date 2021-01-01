//Connect the gulp modules
const gulp = require('gulp');
const concat = require('gulp-concat');
const autoprefixer = require('gulp-autoprefixer');
const cleanCSS = require('gulp-clean-css');
const uglify = require('gulp-uglify');
const sourcemaps = require('gulp-sourcemaps');
const sass = require('gulp-sass');
const babel = require('gulp-babel');

// Connection order of the sass/scss-files
const cssFiles = [
   './styles/scss/**/*.scss'
];

//Connection order of the js files
const jsFiles = [
   './src/js/lib.js',
   './src/js/main.js'
];

//Task for CSS login
function stylesLogin() {
   return gulp.src("./styles/login/**/*.scss")
   .pipe(sourcemaps.init())
   .pipe(sass())
   .pipe(concat('style.css'))
   .pipe(autoprefixer())
   .pipe(cleanCSS({
      level: 2
   }))
   .pipe(sourcemaps.write('./'))
   .pipe(gulp.dest('./assets/theme/stellar/css/login'))
}
//Task for CSS game
function stylesGame() {
   return gulp.src("./styles/game/**/*.scss")
   .pipe(sourcemaps.init())
   .pipe(sass())
   .pipe(concat('style.css'))
   .pipe(autoprefixer())
   .pipe(cleanCSS({
      level: 2
   }))
   .pipe(sourcemaps.write('./'))
   .pipe(gulp.dest('./assets/theme/stellar/css/game'))
}

function scriptsLogin() {
   return gulp.src('./scripts/login/**.js')
   //Merge files into one
   .pipe(concat('main.js'))
   //JS minification
   .pipe(uglify({
      toplevel: true
   }))
   //Output folder for scripts
   .pipe(gulp.dest('./assets/theme/stellar/js/login'))
}

function scriptsGame() {
   return gulp.src('./scripts/game/**.js')
   //Merge files into one
   .pipe(concat('main.js'))
   //JS minification
   .pipe(uglify({
      toplevel: true
   }))
   //Output folder for scripts
   .pipe(gulp.dest('./assets/theme/stellar/js/game'))
}

function components() {
   return gulp.src('./components/**.js')
   //Merge files into one
   .pipe(babel({presets: ['@babel/preset-env'] })) 
   //JS minification
   .pipe(uglify({
      toplevel: true
   }))
   //Output folder for scripts
   .pipe(gulp.dest('./assets/theme/stellar/js/components'))
}

//Watch files
function watch() {
	gulp.watch('./styles/login/**/*.scss', stylesLogin);
	gulp.watch('./styles/game/**/*.scss', stylesGame);
	gulp.watch('./scripts/login/**.js', scriptsLogin);
	gulp.watch('./components/**.js', components);
}

//Task calling 'styles' function
gulp.task('styles', stylesLogin);
gulp.task('styles', stylesGame);
gulp.task('js', scriptsLogin);
//Task calling 'scripts' function
// gulp.task('scripts', scripts);
//Task for cleaning the 'build' folder
// gulp.task('del', clean);
//Task for changes tracking
gulp.task('watch', watch);
//Task for cleaning the 'build' folder and running 'styles' and 'scripts' functions
// gulp.task('build', gulp.series(clean, gulp.parallel(styles,scripts)));
//Task launches build and watch task sequentially
// gulp.task('dev', gulp.series('build','watch'));
//Default task
// gulp.task('default', gulp.series('build','watch'));