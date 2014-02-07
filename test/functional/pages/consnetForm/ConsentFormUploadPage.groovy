package pages.consnetForm

import geb.Page

/**
 * Created by soheil on 28/01/14.
 */
class ConsentFormUploadPage extends Page{

    static url = "attachedFormImage/upload"

    static at = {
        url == "attachedFormImage/upload" &&
                title == "Consent Forms Upload"
    }
    static content = {

        uploadButton{$("button[id='btnUpload'][type='submit']")}
        fileSelectorButton{$("input[id='scannedForm']")}
        uploadedFilesTable(required: false) {$("table[id='uploadedFilesTable']")}
    }
}