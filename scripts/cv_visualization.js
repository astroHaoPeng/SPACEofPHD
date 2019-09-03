"use strict";
const fs = require("fs");
const sizeOf = require('image-size');
const path = "source/cv/visulaizations/img";
const output = "source/cv/visulaizations/imglist.json";
var dimensions;
fs.readdir(path, function (err, files) {
    if (err) {
        return;
    }
    let arr = [];
    (function iterator(index) {
        if (index == files.length) {
            fs.writeFile(output, JSON.stringify(arr, null, "\t"), function(err) {
                if(err) console.log('error', err);
              });
            return;
        }
        fs.stat(path + "/" + files[index], function (err, stats) {
            if (err) {
                return;
            }
            if (stats.isFile()) {
                dimensions = sizeOf(path + "/" + files[index]);
                console.log(dimensions.width, dimensions.height);
                arr.push(dimensions.width + '.' + dimensions.height + ' ' + files[index]);
            }
            iterator(index + 1);
        })
    }(0));
});
