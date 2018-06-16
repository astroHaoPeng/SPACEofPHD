var exec = require('child_process').exec;

// // Hexo 2.x 用户复制这段
// hexo.on('new', function(path){
//     exec('code ' + path);
// });
// Hexo 3 用户复制这段
hexo.on('new', function(data){
    exec('code ' + data.path);
});