
<%@ page import="uk.ac.ox.brc.greenlight.Attachment" %>
<!DOCTYPE html>
<html>
	<head>
        <meta name="layout" content="mainBootstrap">
	</head>
	<body>
    <div class="col-md-9 "  >
        <div class="panel panel-primary PageMainPanel" >
            <div class="panel-heading">Consent Form Detail</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-9">
                        Date of Scan:
                        <g:formatDate date="${attachment.dateOfScan}" type="day"></g:formatDate>

                    </div>
                    <div class="col-md-9">
                        <img id="scannedForm" style="margin: 4px; width: 100%;height: 100%;" class="Photo"   src="${createLink(controller:'attachment', action:'viewImage', id:"${attachment.id}")}" />
                    </div>
                </div>

            </div>
        </div>
        </div>

    </body>
</html>
