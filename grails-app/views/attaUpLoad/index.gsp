<html>
    <head>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.7.1.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.form.js')}"></script>
        <title>
            Attachment Upload
        </title>
    </head>

    <body>
        <g:uploadForm name="uploadForm" controller="attaUpLoad" action="uploadAtta">
            <p><input type="file" name="attaFile" onchange="addAtta(this)"></p>
            <p><input type="button" value="submit/upload" onclick="uploadNow()"/></p>
        </g:uploadForm>
        =============================
        <pre>
            grails version 3.1.14

            select files only add files on the page
            you can get file's info but fileobjects are readonly

            file name：<span id="fileName" style="color: red"></span>
            file size: <span id="fileSize" style="color: red"></span>
            file lastModifiedDate: <span id="fileLastModifiedDate" style="color: red"></span>
            file type: <span id="fileType" style="color: red"></span>

            if you encourter FileUploadBase$SizeLimitExceededException don't forget config in application.yml
            <b>
            grails:
                controllers:
                    upload:
                        maxRequestSize: 209715200
                        maxFileSize: 209715200
            </b>

            if you need    try to use <b><a href="https://developer.mozilla.org/en-US/docs/Web/API/FormData">FormData API</a></b>
        </pre>

        <script>
            function addAtta(item) {
                var file = $(item)[0].files[0];
                console.log(file.lastModifiedDate)
                $("#fileName").html(file.name);
                $("#fileSize").html(file.size);
                $("#fileLastModifiedDate").html(file.lastModifiedDate.toLocaleString());
                $("#fileType").html(file.type);
            }

            function uploadNow() {
                $("#uploadForm").ajaxSubmit({
                    type:'POST',
                    dataType : "json",
                    success:function (data) {
                        alert(data.message)
                        if(data.status){
                            alert("do something");
                        }
                    }
                })
            }


        </script>
    </body>
</html>