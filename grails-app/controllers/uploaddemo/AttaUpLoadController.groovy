package uploaddemo

import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile

class AttaUpLoadController {

    def uploadAtta = {
        def uploadResult = [status:false,message:"upload failed！"]
        def file = request.getFile("attaFile");
        def fileList = request.getFiles("attaFile"); // more than one

        if(file){
            def fileName = file.originalFilename;
            def fileSize = file.size;
            def is = file.inputStream;
            File uploadDir = new File(request.getServletContext().getRealPath("/localFile").toString());
            uploadDir.mkdirs();
            file.transferTo(new File(uploadDir,fileName));
            uploadResult = [status:true,message:"upload successful！"]
        }

        render ([contentType: "application/json", text: uploadResult as JSON])

    }

    def index() { }
}
