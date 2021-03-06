<%@ page import="uk.ac.ox.brc.greenlight.ConsentFormTemplate; uk.ac.ox.brc.greenlight.ConsentForm; uk.ac.ox.brc.greenlight.Patient" %>
<%@ page import="uk.ac.ox.brc.greenlight.ConsentFormTemplate; uk.ac.ox.brc.greenlight.Attachment; uk.ac.ox.brc.greenlight.Attachment" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Consent Form</title>

</head>

<body>

<div class="span12">
        <h1>Consent Form</h1>

        <div class="row">
            <g:hasErrors>
            <g:eachError><p>${it}</p></g:eachError>
            </g:hasErrors>
            <div class="span12">
                <g:if test="${flash.created}">
                    <div class="alert alert-success">${flash.created}</div>
                </g:if>
                <g:elseif test="${flash.error}">
                    <div class="alert alert-danger">${flash.error}</div>
                </g:elseif>
            </div>

            <g:form role="form" action="save" controller="consentFormCompletion" >

                <g:hiddenField name="commandInstance.attachment.id" value="${commandInstance?.attachment?.id}"></g:hiddenField>
                <g:set var="responses" value="${commandInstance?.consentForm?.responses}"></g:set>


                <div class="span12">
                        <div class="row">
                            <div class="span4 ">
                                <div class="form-group">
                                    <label for="commandInstance.patient.nhsNumber" class="required">NHS Number</label>
                                    <g:textField readonly="true"
                                            class="form-control  ${hasErrors(bean: patient, field: 'nhsNumber', 'invalidInput')}"
                                            id="commandInstance.patient.nhsNumber" name="commandInstance.patient.nhsNumber"
                                            value="${commandInstance?.patient?.nhsNumber}"
                                             />
                                </div>

                                <div class="form-group">
                                    <label for="commandInstance.patient.hospitalNumber" class="required">Hospital Number</label>
                                    <g:textField readonly="true"
                                                 class="form-control  ${hasErrors(bean: patient, field: 'hospitalNumber', 'invalidInput')}"
                                                 id="commandInstance.patient.nhsNumber" name="commandInstance.patient.hospitalNumber"
                                                 value="${commandInstance?.patient?.hospitalNumber}"
                                    />
                                </div>


                                <div class="form-group">
                                    <label for="commandInstance.patient.familyName" class="required">Last Name</label>
                                    <g:textField readonly="true"
                                                 class="form-control  ${hasErrors(bean: patient, field: 'familyName', 'invalidInput')}"
                                                 id="commandInstance.patient.familyName" name="commandInstance.patient.familyName"
                                                 value="${commandInstance?.patient?.familyName}"
                                    />
                                </div>




                            </div>
                            <div class="span4 ">


                                <div class="form-group">
                                    <label for="commandInstance.patient.givenName" class="required">First Name</label>
                                    <g:textField readonly="true"
                                                 class="form-control ${hasErrors(bean: patient, field: 'givenName', 'invalidInput')}"
                                                 name="commandInstance.patient.givenName" value="${commandInstance?.patient?.givenName}"
                                    />
                                </div>


                                <div class="form-group">
                                    <label for="commandInstance.patient.dateOfBirth">Date of Birth</label>
                                    <g:datePicker   readonly="true" class="form-control" id="commandInstance.patient.dateOfBirth" name="commandInstance.patient.dateOfBirth"
                                                    value="${commandInstance?.patient?.dateOfBirth}"
                                                    disabled="true"
                                                    precision="day"/>
                                </div>


                                <div class="form-group">
                                    <label for="commandInstance.consentForm.consentTakerName" class="required">Consent Taker Name</label>
                                    <g:textField name="commandInstance.consentForm.consentTakerName" id="commandInstance.consentForm.consentTakerName"
                                                 readonly="true" class="form-control  ${hasErrors(bean: consentForm, field: 'consentTakerName', 'invalidInput')}"
                                                 value="${commandInstance?.consentForm?.consentTakerName}"
                                    />
                                </div>




                            </div>
                            <div class="span4">
                                <div class="form-group">
                                    <label for="commandInstance.consentForm.ConsentDate">Consent Date</label>
                                    <g:datePicker class="form-control" readonly="true"
                                                  id="commandInstance.consentForm.ConsentDate"
                                                  name="commandInstance.consentForm.consentDate"
                                                  value="${commandInstance?.consentForm?.consentDate}"
                                                  disabled="true"

                                                  precision="day"/>
                                </div>


                                <div class="form-group">
                                    <label for="commandInstance.consentForm.formID" class="required">Form Id</label>
                                    <g:textField readonly="true"
                                                 class="form-control  ${hasErrors(bean: consentForm, field: 'formID', 'invalidInput')}"
                                                 id="commandInstance.consentForm.formID" name="commandInstance.consentForm.formID"
                                                 value="${commandInstance?.consentForm?.formID}"
                                    />
                                </div>



                                <div class="form-group">
                                    <label for="commandInstance.consentForm.comment">Comment</label>
                                    <g:textArea   readonly="readonly"
                                                class="form-control  ${hasErrors(bean: consentForm, field: 'comment', 'invalidInput')}"
                                                id="commandInstance.consentForm.comment" name="commandInstance.consentForm.comment"
                                                value="${commandInstance?.consentForm?.comment}"
                                    />
                                </div>

                            </div>
                        </div>
                </div>

                <div class="span12">
                        <div class="row">
                            <div class="span8">

                                <g:if test="${commandInstance?.attachment}">
                                    <a href="${createLink(action:'show',
                                            controller:'attachment',id: commandInstance?.attachment?.id)}" target="_blank">

                                        <g:if test="${commandInstance?.attachment?.attachmentType == Attachment.AttachmentType.IMAGE}">

                                            <div  id="scrollerDiv">
                                                <img id="scannedForm" style="margin: 4px; width: 100%;height: 100%" class="Photo" src="${resource(dir:'attachments', file: commandInstance?.attachment?.id + '.jpg')}" />
                                            </div>

                                        </g:if>
                                        <g:elseif test="${commandInstance?.attachment?.attachmentType == Attachment.AttachmentType.PDF}">

                                            <div style="width: 100%">
                                                <g:render  template="/attachment/pdfViewer"         model="[attachmentId:commandInstance?.attachment?.id]" >
                                                </g:render>
                                            </div>

                                        </g:elseif>
                                    </a>
                                </g:if>
                            </div>

                            <div class="span4">

                                <label >Consent Form Type</label>
                                <g:textField id="commandInstance.consentFormTemplate"
                                             name="commandInstance.consentFormTemplate"
                                             class="form-control"
                                          style="font-size:12px;" readonly="true"
                                          value="${commandInstance?.consentForm?.template}"
                                          disabled="disabled"
                                />

                                <div class="form-group">
                                    <label for="commandInstance.consentForm.formStatus">Form Status</label>
                                    <g:textField id="commandInstance?.consentForm.formStatus"
                                              name="commandInstance.consentForm.formStatus"
                                              class="form-control"
                                              readonly="true"
                                              disabled="disabled"
                                              value="${commandInstance?.consentForm?.formStatus}"
                                              />
                                </div>


                                <ul class="list-group">
                                    <g:each in="${commandInstance?.questions}" var="question" status="index">

                                        <li class="list-group-item">

                                            %{--<span class="label label-primary bootstrapTooltip" style="margin-right: 3px;clear:both;cursor: pointer;"--}%
                                                  %{--data-toggle="tooltip" data-placement="right" data-html="true" title="<div style='text-align:left'>${question?.name}</div>">${index+1}</span>--}%


                                            <span class="label label-primary bootstrapTooltip" style="margin-right: 3px;clear:both;cursor: pointer;"
                                                  data-toggle="tooltip" data-placement="right" data-html="true" title="<div style='text-align:left'>${question?.name}<br><br>
                                                    ${question?.optional? "<div><strong class='label label-primary'>Optional</strong></div><br>${question?.labelIfNotYes?question?.labelIfNotYes:''}" :""}   ">${index+1}</span>



                                            &nbsp;  ${commandInstance?.responses[index]?.answer}
                                        </li>
                                    </g:each>
                                </ul>


                            </div>

                     </div>


                        <g:link   action="delete" class="btn  btn-danger btn-sm" style="text-decoration:none;" controller="consentFormCompletion" id="${commandInstance?.consentForm?.id}"  onclick="return confirm('Are you sure?');" >
                             Delete
                        </g:link>

                        <g:link   action="edit" class="btn  btn-primary btn-sm" controller="consentFormCompletion" id="${commandInstance?.consentForm?.id}" >
                            Edit
                        </g:link>

                </div>

            </g:form>
        </div>
</div>

<script type="text/javascript">
    //As we need to change css of an image, we need to wait and act after it is loaded
    //as $() jquery runs when DOM fully loaded, but
    //$(window).load() executes when all other things are loaded as well, such as the images
    $(window).load(function() {
        if( $("#scrollerDiv img").height() > 1000){
            $("#scrollerDiv").css( "overflow", "auto" );
            $("#scrollerDiv").css( "max-height", "700px" );
        }
    });

</script>

</body>
</html>