<%@ page import="uk.ac.ox.brc.greenlight.Response" %>
<ul class="list-group" id="templateQuestions">
    <g:hiddenField name="questionsSize" value="${questions?.size()}"/>


    <g:if test="${questions && questions.size()>0}">
        <li class="list-group-item">
Apply to all:
            <button type="button" class="btn btn-success btn-sm" onclick="$('select[id^=answers]').val('YES')">Yes</button>
            <button type="button" class="btn btn-danger btn-sm" onclick="$('select[id^=answers]').val('NO')">No</button>
            <button type="button" class="btn btn-primary btn-sm" onclick="$('select[id^=answers]').val('BLANK')">Blank</button>

        </li>

    <g:each in="${questions}" var="question" status="index">

        <li class="list-group-item">
            %{--<span class="label ${ question?.optional?'label-primary' : 'label-inverse' } bootstrapTooltip" style="margin-right: 3px;clear:both;cursor: pointer;"--}%
            <span class="label label-primary bootstrapTooltip" style="margin-right: 3px;clear:both;cursor: pointer;"
                  data-toggle="tooltip" data-placement="right" data-html="true" title="<div style='text-align:left'>${question?.name}<br><br>
                  ${question?.optional? "<div><strong class='label label-primary'>Optional</strong></div><br>${question?.labelIfNotYes?question?.labelIfNotYes:''}" :""}   ">${index+1}</span>
             %{--<span style="font-size: 10px;">${question.name.substring(0,Math.min(10,question?.name.size()))+ "..."}</span>--}%


            <g:select class="form-control" id="answers.${index}"
                      name="responses.${index}"
                      value="${ responses ? responses[index]?.answer.key : (question?.defaultResponse? question.defaultResponse : Response.ResponseValue.BLANK)}"
                      from="${question.validResponses}"
                      optionKey="key"
                      optionValue="value"
                      style="margin-left:5px;width: 80%; display: inline !important"
                       />
            <span class="glyphicon glyphicon-question-sign bootstrapTooltip"
                  data-toggle="tooltip" data-placement="left" data-html="true" title="<div style='text-align:left'>${question?.name}</div>"
                  style=";cursor: pointer;display: inline !important"></span>

        </li>

    </g:each>
    </g:if>
</ul>

