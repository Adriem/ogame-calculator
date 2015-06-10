/* GULP DEPENDENCIES */
var gulp = require("gulp"),
    coffee = require("gulp-coffee"),
    maps = require("gulp-sourcemaps"),
    uglify = require("gulp-uglify"),
    rename = require("gulp-rename"),
    cssmin = require("gulp-minify-css"),
    htmlmin = require("gulp-minify-html"),
    gutil = require("gulp-util"),
    inject = require("gulp-inject");

/* GULP TASKS */
gulp.task("coffee", function(){
    gulp.src("src/**/*.coffee")
        .pipe(maps.init())
        .pipe(coffee({bare: true}).on('error', gutil.log))
        .pipe(maps.write())
        .pipe(gulp.dest("src/"))
});

gulp.task("js", ["coffee"], function(){
    gulp.src("src/**/*.js")
        .pipe(uglify({mangle:false}))
        .pipe(rename({
            extname: ".min.js"
        }))
        .pipe(gulp.dest("dist/"))
});

gulp.task("css", function(){
    gulp.src("src/**/*.css")
        .pipe(cssmin())
        .pipe(rename({
            extname: ".min.css"
        }))
        .pipe(gulp.dest("dist/"))
});

gulp.task("move-html", function(){
    gulp.src("./src/**/*.html")
        .pipe(gulp.dest("./dist"))
});

gulp.task("move-img", function(){
    gulp.src("./src/img/*")
        .pipe(gulp.dest("./dist/img"))
});

gulp.task("build-dev", ["coffee"], function(){
    var sources = gulp.src(['./src/**/*.js', './src/**/*.css'], {read: false});
    gulp.src("./src/**/*.html")
        .pipe(inject(sources, {relative: true}))
        .pipe(gulp.dest("./src"))
});

gulp.task("build-dist", ["css", "js", "move-html", "move-img"], function(){
    var sources = gulp.src(['./dist/**/*.js', './dist/**/*.css'], {read: false});
    gulp.src("./dist/**/*.html")
        .pipe(inject(sources, {relative: true}))
        .pipe(htmlmin({
            empty: true,
            cdata: false,
            comments: false,
            conditionals: false,
            spare: false,
            quotes: false,
            loose: true
        }))
        .pipe(gulp.dest("./dist"))
});