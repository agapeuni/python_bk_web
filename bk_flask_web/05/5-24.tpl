<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
   <head>
       <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
       <title>파일 업로드</title>
       <script type="text/javascript" src="/static/plugin/plupload/js/plupload.full.min.js"></script>
   </head>
   <body>
       <ul id="filelist"></ul>
       <br />
        
        <div id="container">
            <a id="browse" href="javascript:;">[Browse...]</a>
            <a id="start-upload" href="javascript:;">[Start Upload]</a>
        </div>
        <div id="console"></div>
        <script type="text/javascript">
        var uploader = new plupload.Uploader({
            browse_button: 'browse',
            url: '/file_upload'
        });
        
        uploader.init();
        
        uploader.bind('FilesAdded', function(up, files) {
            var html = '';
            plupload.each(files, function(file) {
                html += '<li id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b></li>';
            });
            document.getElementById('filelist').innerHTML += html;
        });
        
        uploader.bind('UploadProgress', function(up, file) {
            document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
        });
        
        uploader.bind('Error', function(up, err) {
            document.getElementById('console').innerHTML += "\nError #" + err.code + ": " + err.message;
        });
         
        document.getElementById('start-upload').onclick = function() {
            uploader.start();
       };
        </script>
    </body>
</html>